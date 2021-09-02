package kr.ac.kopo.receipt.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.service.ReceiptService;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;

@Controller
public class receiptController {
	
	@Autowired
	private ReceiptService service;
	
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
	public String receiptRegister(MultipartHttpServletRequest multipartRequest, Model model) {
		
		ReceiptFileVO receiptFile = service.uploadImgFile(multipartRequest);
		model.addAttribute("receiptFile", receiptFile);
		
		return "receipt/receiptCheck";
		
	}
	
	// 사용자 확인 후 영수증 DB에 등록
	// 테스트하려고 int로 받아봤음
	@PostMapping("/receipt/finalRegister")
	public void finalRegister(ReceiptVO receipt) {
		
		System.out.println("컨트롤러로 잘넘어오지? : " + receipt);
		
		service.receiptResgister(receipt);
		
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
