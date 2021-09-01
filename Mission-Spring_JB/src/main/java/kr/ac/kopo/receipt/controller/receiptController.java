package kr.ac.kopo.receipt.controller;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class receiptController {
	
	// 증빙관리 선택 => 영수증 목록 페이지 (처리 완료된)
	@RequestMapping("/receipt/processedList")
	public String receiptProcessedList() {
		
		return "receipt/receiptList";
	}
	
	
	// 영수증 등록 탭 이동
	@GetMapping("/receipt/register")
	public String receiptRegisterForm() {
		
		return "receipt/receiptRegister";
	}
	
	// 영수증 등록 진행 => 사용자가 입력한 영수증 => 이미지 파일 서버에 저장 => DB에 저장하는 것 까지
	// http 프로토콜의 바디 부분에 파일정보를 담아서 전송
	@PostMapping("/receipt/register")
	public ModelAndView receiptRegister(MultipartHttpServletRequest multipartRequest) {
		
		ModelAndView mav = new ModelAndView("receipt/receiptCheck");
		
		// 영수증 사진말고, 관련 없는 사진 등록하면 어떻게? => 템플릿 OCR에서는 구분가능함, general OCR에서는 어떻게?.. 잘못 올리는 사진에 대한 대비가 필요한데
		
		/*
		 * 1. 파일을 서버 경로에 저장
		 * 2. template or general ocr api 호출 => parsing
		 * 3. 추출된 텍스트 VO에 저장, 공유영역에 등록 => replaceCheck.jsp에서 자동완성
		 * 4. general ocr의 경우 합계 금액으로 아무것도 추출이 안되는 경우 -1을 반환하도록 만들어야함
		 */
		
		String file_path = "C:\\Lecture\\spring-workspace\\newUpload\\";
		System.out.println("파일 경로 : " + file_path);
		
		Iterator<String> iter = multipartRequest.getFileNames();
		
		String formFileName = iter.next();
		
		MultipartFile mFile = multipartRequest.getFile(formFileName);
		
		// 원본 파일명
		String oriFileName = mFile.getOriginalFilename();
		System.out.println("원본 파일명 : " + oriFileName);
		
		try {
			
			if(oriFileName != null && !oriFileName.equals("")) {
				
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
				System.out.println("파일 사이즈 : " + fileSize);
				
				// 고유한 파일명 만들기, 여러 명의 사용자가 동일한 이름의 파일을 올리는 경우 구분해주어야함
				String saveFileName = "kopo-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + saveFileName);
				
				// 임시저장된 파일을 내가 만들어둔 원하는 경로에 저장
				mFile.transferTo(new File(file_path + saveFileName));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		int selectedReceiptNo = Integer.parseInt(multipartRequest.getParameter("receiptKind"));
 		int selectedPurposeNo = Integer.parseInt(multipartRequest.getParameter("purpose"));
 		String inputMemo = multipartRequest.getParameter("memo");
 		
 		
 		mav.addObject("selectedReceiptNo", selectedReceiptNo);
 		mav.addObject("selectedpurposeNo", selectedPurposeNo);
 		mav.addObject("inputMemo", inputMemo);
 		
		return mav;
		
	}
	
	
	@GetMapping("/receipt/receiptWaitList")
	public String getreceiptWaitList() {
		
		return "receipt/receiptWaitList";
		
	}
	
	
	
	// 사용자가 선택한 영수증에 대한 세부사항, {no} => @Path~
	@RequestMapping("/receipt/detail")
	public String receiptDetail() {
		
		
		return "receipt/receiptDetail";
		
	}
	
	// 영수증 목록 페이지 check
	@RequestMapping("/receipt/replaceCheck")
	public String listCheck() {
		
		
		return "receipt/replaceCheck";
	}
	
	// 영수증 목록 페이지 unCheck
	@RequestMapping("/receipt/replaceUnCheck")
	public String listUnCheck() {
		
		
		
		return "receipt/replaceUnCheck";
	}
}
