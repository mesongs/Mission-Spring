package kr.ac.kopo.receipt.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.kopo.receipt.dao.ReceiptDAO;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.receipt.vo.searchDateVO;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;

@Service
public class ReceiptServiceImpl implements ReceiptService {

	@Autowired
	private ReceiptDAO receiptDAO;

//	@Autowired
//	ServletContext servletContext;
	
	// 사용자 확인 후 영수증 등록 신청
	@Transactional
	@Override
	public void receiptResgister(ReceiptVO receipt) {
	
		// pk가 될 영수증 번호 추출
		int receiptNo = receiptDAO.getReceiptNo();
	
		receipt.setReceiptNo(receiptNo); 
		
		String filePath = receipt.getFilePath();
		String fileSaveName = receipt.getFileSaveName();
		
		String fileFullPath = filePath + fileSaveName;
		
		receipt.setFilePath(fileFullPath);
		
		// 로그인했을 때 세션에 저장되는 사업장 번호를 가져와서
		// 숫자로 저장되어있는 값
		
		int purposeNo = (Integer.parseInt(receipt.getPurpose()));
		int receiptKindNo= (Integer.parseInt(receipt.getReceiptKind()));;
		
		String purpose = "";
		String receiptKind = "";
		
		switch (purposeNo) {
		case 1:
			purpose = "재료비";
			break;
		case 2:
			purpose = "자재비";
			break;
		case 3:
			purpose = "식비";
			break;
		case 4:
			purpose = "접대비";
			break;
		case 5:
			purpose = "세금";
			break;
		case 6:
			purpose = "인건비";
			break;
		case 7:
			purpose = "공과금";
			break;
		case 8:
			purpose = "기타";
			break;
		}
		
		switch (receiptKindNo) {
		case 1:
			receiptKind = "001";
			break;
		case 2:
			receiptKind = "002";
			break;
		case 3:
			receiptKind = "003";
			break;
		case 4:
			receiptKind = "004";
			break;
		}
		
		receipt.setPurpose(purpose);
		receipt.setReceiptKind(receiptKind);
		
		receiptDAO.receiptRegister(receipt);
		receiptDAO.receiptFileRegister(receipt);
	}
	
	// 처리 대기 검색
	@Override
	public List<ReceiptVO> searchwaitList(String searchWord) {
		
		List<ReceiptVO> searchwaitList = receiptDAO.searchWaitList(searchWord);
		
		return searchwaitList;
	}

	// 처리 대기중인 모든 리스트 검색
	@Override
	public List<ReceiptVO> waitAllList() {
		
		List<ReceiptVO> WaitAllList = receiptDAO.waitAllList();
		
		return WaitAllList;
	}
	
	@Override
	public List<ReceiptVO> getProcessedList() {
		
		List<ReceiptVO> WaitAllList = receiptDAO.getProcessedList();
		
		return WaitAllList;
	}
	
	@Override
	public List<ReceiptVO> searchprocessedList(String searchWord) {
		
		List<ReceiptVO> processedAllList = receiptDAO.getSearchProcessedList(searchWord);
		
		return processedAllList;
	}

	@Override
	public List<ReceiptVO> serachDate(searchDateVO searchDate) {
		
		List<ReceiptVO> searchDateList = receiptDAO.getSearchDateList(searchDate);
		
		return searchDateList;
	}
	
	@Override
	public List<ReceiptVO> searchReceiptKind(String receiptKind) {
		
		List<ReceiptVO> searchReceiptKindList = receiptDAO.searchReceiptKind(receiptKind);
		
		return searchReceiptKindList;
	}

	// 가장 먼저했던 이미지 서버에 저장, 썸네일 이미지 저장 => 저장된 이미지 ocr
	/**
	 * 1. 이미지 서버 파일에 저장, 썸네일 이미지
	 * 2. 저장된 이미지 영수증 종류별 general / template ocr 요청
	 * 3. parsing한 후 VO에 저장
	 */
	@Override
	public ReceiptFileVO uploadImgFile(MultipartHttpServletRequest multipartRequest) {

		ReceiptFileVO receiptFile = new ReceiptFileVO();
		
		int selectedReceiptNo = Integer.parseInt(multipartRequest.getParameter("receiptKind"));
		int selectedPurposeNo = Integer.parseInt(multipartRequest.getParameter("purpose"));
		String inputMemo = multipartRequest.getParameter("memo");

		// 사용자가 receiptRegister에서 입력한 값
		// 영수증 종류에 따른 general or template ocr 진행
		receiptFile.setSelectedReceiptNo(selectedReceiptNo);
		receiptFile.setSelectedPurposeNo(selectedPurposeNo);
		receiptFile.setInputMemo(inputMemo);
		
		Iterator<String> iter = multipartRequest.getFileNames();
		// 사용자가 업로드한 input type="file" 태그의 name
		String formFileName = iter.next();
		
		// 서버에 저장된 파일 이름으로 경로 설정
		String saveFileName ="";
		
		// 로컬 테스트, 일단 업로드는 로컬에 하고, api로 넘기는 url을 다르게 설정해서 자동완성 시켜보기, 그 다음은 dbms서버 연결
		String filePath = "C:\\Lecture\\spring-workspace\\newUpload\\";
		
		// deploy했을 때 서버의 실제 경로를 가져오는 servletContext
		// deploy했을 때 /var/lib/tomcat9/webapps/Mission-Spring_JB 이게 실제 경로임
		//String filePath = servletContext.getRealPath("/upload/");
		
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
				ImageIO.write(sourceImage, thumbnailFileName.substring(index + 1), new File(filePath, thumbnailFileName));

				// 이미지 관련 데이터 공유영역에 등록
				receiptFile.setThumbnailFileName(thumbnailFileName);
				receiptFile.setFileSaveName(saveFileName);
				receiptFile.setFileOriginalName(oriFileName);
				receiptFile.setFileSize(fileSize);
				receiptFile.setFilePath(filePath);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		// general OCR 요청 이거로 해야함 // 실제 api 호출 test
		// ('합'으로 시작하는 inferText의 index or '계'를 포함하는 index or '금액'을 포함하는 index) //
		// java에서 api요청하는 방법 restTemplate도 존재함
		// 합계, 소계, 결제금액, 판매금액 => List의 최대값 추출

		//카드 영수증을 고른 경우, 이미지에서 전체 텍스트를 추출하는 general ocr 진행
		if (selectedReceiptNo == 3) {
			
			// api로 요청한 값, 추출된 text, 여기서 인식된 정보를 얻음
			List<String> inferTextList = new ArrayList<String>();

			// '합'으로 시작하는 인덱스 리스트
			List<Integer> correctIndexList = new ArrayList<Integer>();

			// 쉼표,'원'을 공백(정규식 숫자 제외 공백)으로 대체한 실제 합계금액이 저장되는 리스트
			List<Integer> resultList = new ArrayList<Integer>();

			OkHttpClient client = new OkHttpClient();

			MediaType mediaType = MediaType.parse("application/json");

			RequestBody body = RequestBody.create(mediaType,
					"{\n\t\"version\" : \"V1\"," + "\n\t\"requestId\" : \"test2\"," + "\n\t\"timestamp\" : 0,"
							+ "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"jpg\","
							+ "\n\t\t\"url\" : \"https://kr.object.ncloudstorage.com/testbucke/test8.jpg\","
							+ "\n\t\t\"name\" : \"test8.jpg\"\n\t}]\n}");
			
			//String testFilePath ="kopo-8aaa3f34-7aaa-46c8-9e6d-bd8584fde567.jpg";
			// http://34.64.137.151:8080/Mission-Spring_JB/upload/kopo-8aaa3f34-7aaa-46c8-9e6d-bd8584fde567.jpg
			
			// 이걸로 api 요청해야함, 로컬 테스트를 위해 주석
//			RequestBody body = RequestBody.create(mediaType,
//			"{\n\t\"version\" : \"V1\"," + "\n\t\"requestId\" : \"test2\"," + "\n\t\"timestamp\" : 0,"
//					+ "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"png\","
//					+ "\n\t\t\"url\" : \"http://34.64.137.151:8080/Mission-Spring_JB/upload/"+ saveFileName + "\","
//					+ "\n\t\t\"name\" : \""+ saveFileName +"\"\n\t}]\n}");
			
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
				//System.out.println("api로 받아온 general OCR : " + result); // 세진이는 본인이 만든 api에서 값을 받아와서 바로 map으로 넣음

				ObjectMapper mapper = new ObjectMapper();

				JsonNode root = mapper.readTree(result);

				JsonNode images = root.path("images");

				inferTextList = images.get(0).path("fields").findValuesAsText("inferText");
				//System.out.println("List 크기 : " + inferTextList.size());

				for (int i = 0; i < inferTextList.size(); i++) {

					// 합 계, 소 계, 판매금액, 결제금액
					if (inferTextList.get(i).startsWith("합") || inferTextList.get(i).contains("계") || inferTextList.get(i).contains("금액")) {

						// inferTextList의 index 저장, 중복 제거할 필요없음
						correctIndexList.add(i);
					}

				}

				System.out.println("correctIndexList : " + correctIndexList); // [41, 48, 49]

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
//			int amount = Collections.max(resultList)) / 1.1;
			
			// ocr로 추출한 합계금액에서 영수금액, 부가세 추출
			int sum = Collections.max(resultList);
			
			// 소수점 첫째 자리에서 반올림
			int amount = (int)(Math.round(sum / 1.1));
			int vat = sum - amount; 
			
			receiptFile.setSum(sum);
			receiptFile.setAmount(amount);
			receiptFile.setVat(vat);
			
		}else { // 다른 종류의 영수증을 고른 경우 (1,2,4)
			
			OkHttpClient client = new OkHttpClient();
			System.out.println("saveFileName : " + saveFileName);

			MediaType mediaType = MediaType.parse("application/json");
			RequestBody body = RequestBody.create(mediaType, "{\n\t\"version\" : \"V1\","
					+ "\n\t\"requestId\" : \"test2\","
					+ "\n\t\"timestamp\" : 0,"
					+ "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"JPG\","
					+ "\n\t\t\"url\" : \"http://34.64.137.151:8080/Mission-Spring_JB/upload/"+ saveFileName + "\","
					+ "\n\t\t\"name\" : \""+ saveFileName +"\"\n\t}]\n}");
			
			// 1, 2 ,4번 종류 로컬 테스트 완료
			
//			RequestBody body = RequestBody.create(mediaType, "{\n\t\"version\" : \"V1\","
//			+ "\n\t\"requestId\" : \"test2\","
//			+ "\n\t\"timestamp\" : 0,"
//			+ "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"JPG\","
//			+ "\n\t\t\"url\" : \"http://34.64.137.151:8080/Mission-Spring_JB/upload/kopo-cba67cf0-0bef-4e50-a8f8-da83052a089c.JPG\","
//			+ "\n\t\t\"name\" : \"kopo-cba67cf0-0bef-4e50-a8f8-da83052a089c.JPG\"\n\t}]\n}");
			
			Request request = new Request.Builder()
			  .url("https://55c7547061ee4d91891f615ee5e7c101.apigw.ntruss.com/custom/v1/10633/1ffc0406b9891fcd265a225e83a668fa045f1282588f80c8d11c029bad156d85/infer")
			  .post(body)
			  .addHeader("content-type", "application/json")
			  .addHeader("x-ocr-secret", "dFpna0dQcVlGT3JDb1hQY2hYZnlYTkRwTUtsd0lIbko=")
			  .addHeader("cache-control", "no-cache")
//			  .addHeader("postman-token", "31917011-c262-8273-4761-7a87eef0d3fa")
			  .build();
			
			try {
				
				Response response = client.newCall(request).execute();
				
				ResponseBody responseBody = response.body();
				
//				System.out.println(responseBody.string());
	            
				String result = responseBody.string();
				
				//System.out.println("api로 받아온 값 result : " + result);
	             
				// ObjectMapper를 이용하면 JSON을 Java 객체로 변환할 수 있고, 
				// 반대로 Java 객체를 JSON 객체로 serialization 할 수 있음
				ObjectMapper mapper = new ObjectMapper();
				
				// tree형태로 읽어준다, 안에 어떤 값들이 있는지 아는 방법은?
				// JsonNode로 파싱하기 위해 mapper.readTree 사용
				// JsonNode 는 값을 읽을 수만 있고, ObjectNode는 값을 읽고 쓸 수 있다.
				
				// String형을 Json형으로 바꿔서
				
				JsonNode root = mapper.readTree(result);
				
				System.out.println("여기서부터 시작(readTree 한 것) : " + root);
//				{"version":"V1","requestId":"test2","timestamp":1629624968000,"images":[{"uid":"019a82199d9a43ca8781c3737567954e","name":"tesetT.JPG","inferResult":"SUCCESS","message":"SUCCESS","matchedTemplate":{"id":10242,"name":"계산서1"},"validationResult":{"result":"NO_REQUESTED"},"title":{"name":"계산서1","bounding":{"top":48.0,"left":149.0,"width":248.0,"height":68.0},"inferText":"계 산 서","inferConfidence":0.99959993},"fields":[{"name":"supplier_business_no","bounding":{"top":129.0,"left":231.0,"width":240.0,"height":15.0},"valueType":"ALL","inferText":"807-93-00062","inferConfidence":0.9938},{"name":"store_name","bounding":{"top":163.0,"left":227.0,"width":115.0,"height":40.0},"valueType":"ALL","inferText":"유창수산","inferConfidence":0.9999},{"name":"receipt_date","bounding":{"top":330.0,"left":90.0,"width":183.0,"height":43.0},"valueType":"ALL","inferText":"2021 630","inferConfidence":0.99004996},{"name":"amount","bounding":{"top":588.0,"left":77.0,"width":134.0,"height":34.0},"valueType":"ALL","inferText":"01.100 0~","inferConfidence":0.8885}]}]}

				JsonNode images = root.path("images");
				
				System.out.println("images : " + images);
//				[{"uid":"019a82199d9a43ca8781c3737567954e","name":"tesetT.JPG","inferResult":"SUCCESS","message":"SUCCESS","matchedTemplate":{"id":10242,"name":"계산서1"},"validationResult":{"result":"NO_REQUESTED"},"title":{"name":"계산서1","bounding":{"top":48.0,"left":149.0,"width":248.0,"height":68.0},"inferText":"계 산 서","inferConfidence":0.99959993},"fields":[{"name":"supplier_business_no","bounding":{"top":129.0,"left":231.0,"width":240.0,"height":15.0},"valueType":"ALL","inferText":"807-93-00062","inferConfidence":0.9938},{"name":"store_name","bounding":{"top":163.0,"left":227.0,"width":115.0,"height":40.0},"valueType":"ALL","inferText":"유창수산","inferConfidence":0.9999},{"name":"receipt_date","bounding":{"top":330.0,"left":90.0,"width":183.0,"height":43.0},"valueType":"ALL","inferText":"2021 630","inferConfidence":0.99004996},{"name":"amount","bounding":{"top":588.0,"left":77.0,"width":134.0,"height":34.0},"valueType":"ALL","inferText":"01.100 0~","inferConfidence":0.8885}]}]
				
				System.out.println("fields : " + images.get(0).path("fields") );
				
				// 필드이름이 fields인 것에서 inferText 이름을 가진 값을 찾음
//				List<String> inferTextList = images.get(0).path("fields").findValuesAsText("inferText");
				
				List<String> nameList = images.get(0).path("fields").findValuesAsText("name");
				List<String> inferTextList = images.get(0).path("fields").findValuesAsText("inferText");
				
				Map<String, String> map = new HashMap<String, String>();
				
				for(int i=0; i< nameList.size(); i++) {
					map.put(nameList.get(i), inferTextList.get(i));
				}
				
				System.out.println("맵으로 저장한 값 : " + map);
//				{amount=01.100 0~, supplier_business_no=807-93-00062, receipt_date=2021 630, store_name=유창수산}

				System.out.println("amount : " + map.get("amount"));
				System.out.println("supplier_business_no : " + map.get("supplier_business_no"));
				System.out.println("receipt_date : " + map.get("receipt_date"));
				System.out.println("store_name : " + map.get("store_name"));
				
				// 이상하게 날아오는 amount(총 금액)가 있는데.. String으로 받아서 숫자 제외하고 integer로 변경
				String sumParsing = map.get("amount");
				
				// 숫자 제외 공백으로 변경
				int sum = Integer.parseInt(sumParsing.replaceAll("[^0-9]", ""));
				
				// 여기 amount는 영수금액 구하는 것
				int amount = (int)(sum / 1.1);
				int vat = sum - amount;
				
				// 계산서의 경우, 부가세 없음
				if(selectedReceiptNo == 2) {
					amount = sum;
					vat = 0;
				}
				
				receiptFile.setAmount(amount);
				receiptFile.setVat(vat);
				receiptFile.setSupplierBusinessNo(map.get("supplier_business_no"));
				receiptFile.setReceiptDate(map.get("receipt_date"));
				receiptFile.setStoreName(map.get("store_name"));
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		}
		
		return receiptFile;
	}
	
	//general ocr에서 사용할 Integer형 변환
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