package kr.ac.kopo.receipt.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.kopo.receipt.dao.ReceiptDAO;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;

@Service
public class ReceiptServiceImpl implements ReceiptService {

//	@Autowired
//	private ReceiptDAO receiptDAO;

	@Autowired
	ServletContext servletContext;

	@Override
	public ReceiptFileVO uploadImgFile(MultipartHttpServletRequest multipartRequest) {

		ReceiptFileVO receiptFile = new ReceiptFileVO();

		Iterator<String> iter = multipartRequest.getFileNames();
		// 사용자가 업로드한 input type="file" 태그의 name
		String formFileName = iter.next();
		
		// 서버에 저장된 파일 이름으로 경로 설정
		String saveFileName ="";
		
		// 로컬 테스트, 일단 업로드는 로컬에 하고, api로 넘기는 url을 다르게 설정해서 자동완성 시켜보기, 그 다음은 dbms서버 연결
		// String filePath = "C:\\Lecture\\spring-workspace\\newUpload\\";

		// deploy했을 때 서버의 실제 경로를 가져오는 servletContext
		// deploy했을 때 /var/lib/tomcat9/webapps/Mission-Spring_JB 이게 실제 경로임
		String filePath = servletContext.getRealPath("/upload/");
		
		MultipartFile mFile = multipartRequest.getFile(formFileName);

		// 원본 파일명
		String oriFileName = mFile.getOriginalFilename();

		try {

			if (oriFileName != null && !oriFileName.equals("")) {

				// 확장자 처리
				String ext = "";

				// 뒤쪽에 있는 . 의 위치
				int index = oriFileName.lastIndexOf(".");

				// 위 조건 .이 없으면 -1
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}

				// 파일 사이즈
				long fileSize = mFile.getSize();

				// 고유한 파일명 만들기, 여러 명의 사용자가 동일한 이름의 파일을 올리는 경우 구분해주어야함
				saveFileName = "kopo-" + UUID.randomUUID().toString() + ext;

				// 실질적으로 임시 저장된 파일을 내가 만들어둔 원하는 경로에 저장함
				mFile.transferTo(new File(filePath + saveFileName));

				// 썸네일 표시를 위해 이미지 불러오기
				// 썸네일 표시하려면, File객체로 이미지 데이터를 읽어야함, MultipartFile로는 이미지 데이터 못읽네
				File file = new File(filePath, saveFileName);
				BufferedImage sourceImage = ImageIO.read(file);

				// BufferedImage thumnailImage = Scalr.resize(sourceImage,
				// Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH, 400);

				index = saveFileName.lastIndexOf(".");

				// 썸네일 파일의 이름 설정
				String thumbnailFileName = saveFileName.substring(0, index) + "_s" + saveFileName.substring(index);
				index = thumbnailFileName.lastIndexOf(".");

//				ImageIO.write(thumnailImage, thumbnailFileName.substring(index + 1), new File(file_path, thumbnailFileName));
				ImageIO.write(sourceImage, thumbnailFileName.substring(index + 1),
						new File(filePath, thumbnailFileName));

				// 썸네일 이미지 공유영역에 등록
				receiptFile.setThumbnailFileName(thumbnailFileName);
				receiptFile.setFileSaveName(saveFileName);
				receiptFile.setFileOriginalName(oriFileName);
				receiptFile.setFileSize(fileSize);
				receiptFile.setFilePath(filePath);

				int selectedReceiptNo = Integer.parseInt(multipartRequest.getParameter("receiptKind"));
				int selectedPurposeNo = Integer.parseInt(multipartRequest.getParameter("purpose"));
				String inputMemo = multipartRequest.getParameter("memo");

				// 사용자가 receiptRegister에서 입력한 값
				receiptFile.setSelectedReceiptNo(selectedReceiptNo);
				receiptFile.setSelectedPurposeNo(selectedPurposeNo);
				receiptFile.setInputMemo(inputMemo);

				System.out.println(receiptFile);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		// DB에 파일 insert 먼저 하는게 아니라, filePath
		// file_path = http://34.64.137.151:8080/Mission-Spring_JB/upload/ +
		// saveFileName 이렇게 api 요청하기
		// 우선 로컬에서 시도해보기
		// http://34.64.137.151:8080/Mission-Spring_JB/upload/kopo-f6662ae4-644b-431d-9d0d-dfa0d16ca55b.png
		// ocr api요청

		// general OCR 요청 이거로 해야함 // 실제 api 호출 test
		// ('합'으로 시작하는 inferText의 index or '계'를 포함하는 index or '금액'을 포함하는 index) //
		// java에서 api요청하는 방법 restTemplate도 존재함
		// 합계, 소계, 결제금액, 판매금액 => List의 최대값 추출

		// api로 요청한 값, 추출된 text, 여기서 인식된 정보를 얻음
		List<String> inferTextList = new ArrayList<String>();

		// '합'으로 시작하는 인덱스 리스트
		List<Integer> correctIndexList = new ArrayList<Integer>();

		// 쉼표,'원'을 공백(정규식 숫자 제외 공백)으로 대체한 실제 합계금액이 저장되는 리스트
		List<Integer> resultList = new ArrayList<Integer>();

		OkHttpClient client = new OkHttpClient();

		MediaType mediaType = MediaType.parse("application/json");

//		RequestBody body = RequestBody.create(mediaType,
//				"{\n\t\"version\" : \"V1\"," + "\n\t\"requestId\" : \"test2\"," + "\n\t\"timestamp\" : 0,"
//						+ "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"jpg\","
//						+ "\n\t\t\"url\" : \"https://kr.object.ncloudstorage.com/testbucke/test8.jpg\","
//						+ "\n\t\t\"name\" : \"test8.jpg\"\n\t}]\n}");
		
		//String testFilePath ="kopo-8aaa3f34-7aaa-46c8-9e6d-bd8584fde567.jpg";
		// http://34.64.137.151:8080/Mission-Spring_JB/upload/kopo-8aaa3f34-7aaa-46c8-9e6d-bd8584fde567.jpg
		
		RequestBody body = RequestBody.create(mediaType,
		"{\n\t\"version\" : \"V1\"," + "\n\t\"requestId\" : \"test2\"," + "\n\t\"timestamp\" : 0,"
				+ "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"png\","
				+ "\n\t\t\"url\" : \"http://34.64.137.151:8080/Mission-Spring_JB/upload/"+ saveFileName + "\","
				+ "\n\t\t\"name\" : \"kopo-f6662ae4-644b-431d-9d0d-dfa0d16ca55b.png\"\n\t}]\n}");
		
		// 알아서 객체 생성? (request 객체 생성)
		Request request = new Request.Builder().url(
				"https://55c7547061ee4d91891f615ee5e7c101.apigw.ntruss.com/custom/v1/10737/a4ea6ab1e2b24fda85a939e66443d9c380440ecaf6e6e6069e248761c5a0353b/general")
				.post(body).addHeader("content-type", "application/json")
				.addHeader("x-ocr-secret", "cHBIclVDQnZaV3NkQVJBUnRhaGdsaGxMTEllSEtzSkM=")
				.addHeader("cache-control", "no-cache") //
				.addHeader("postman-token", "31917011-c262-8273-4761-7a87eef0d3fa").build();

		try {

			Response response = client.newCall(request).execute();
			ResponseBody responseBody = response.body();

			// general OCR로 받아온 결과값 출력
			String result = responseBody.string();
			System.out.println("api로 받아온 general OCR : " + result); // 세진이는 본인이 만든 api에서 값을 받아와서 바로 map으로 넣음

			ObjectMapper mapper = new ObjectMapper();

			JsonNode root = mapper.readTree(result);

			JsonNode images = root.path("images");

			inferTextList = images.get(0).path("fields").findValuesAsText("inferText");
			System.out.println("List 크기 : " + inferTextList.size());

			for (int i = 0; i < inferTextList.size(); i++) {

				// 합 계, 소 계, 판매금액, 결제금액
				if (inferTextList.get(i).startsWith("합") || inferTextList.get(i).contains("계")
						|| inferTextList.get(i).contains("금액")) {

					// inferTextList의 index 저장, 중복 제거할 필요없음
					correctIndexList.add(i);
				}

			}

			System.out.println("correctIndexList : " + correctIndexList); // [41, 48, 49]
			// System.out.println(inferTextList.get(41));
			// System.out.println(inferTextList.get(48));
			// System.out.println(inferTextList.get(49));

			for (int i = 0; i < correctIndexList.size(); i++) {

				int cnt = correctIndexList.get(i);

				// sb.append(inferTextList.get(cnt));

				while (cnt < inferTextList.size() - 1) {

					cnt = cnt + 1;

					if (checkInt(inferTextList.get(cnt).replaceAll("[^0-9]", ""))) {

						resultList.add(Integer.parseInt(inferTextList.get(cnt).replaceAll("[^0-9]", "")));

						break;

					} else {

						// int형 변경 실패 sb.append(inferTextList.get(cnt));
						// System.out.println(sb.toString());
					}

				}

			}

		} catch (

		Exception e) {
			e.printStackTrace();

		}
		System.out.println("resultList : " + resultList);
		System.out.println("resultList중 최대값 : " + Collections.max(resultList));
		
		// resultList중 최대값을 VO에 저장해서 반환, VO에 멤버변수 추가해야함, 영수금액과 부가세 처리해서 넘겨주자
		// @ResponseBody List 출력 return inferTextList;
		// Collections.max(resultList) => 합계금액 = 부가세 + 영수금액
		// x(1+0.1) = 합계금액 => x = 합계금액 / 1.1 = 영수금액
//		int amount = Collections.max(resultList)) / 1.1;
		
		int sum = Collections.max(resultList);
		
		int amount = (int)(sum / 1.1);
		int vat = sum - amount; 
		
		receiptFile.setAmount(amount);
		receiptFile.setVat(vat);
		
		return receiptFile;
	}

	public boolean checkInt(String str) {

		// instanceof로 형변환 검사 하려했지만, String과 int는 부모자식 관계가 아니므로, 컴파일X
		// //NumberFormatException 예외 발생 시 false return

		try {

			Integer.parseInt(str);
			return true;

		} catch (NumberFormatException e) {

			return false;
		}

	}
}