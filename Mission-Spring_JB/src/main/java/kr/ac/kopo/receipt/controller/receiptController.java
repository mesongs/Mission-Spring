package kr.ac.kopo.receipt.controller;




import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.service.ReceiptService;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.receipt.vo.searchDateVO;

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
	
	@PostMapping("/receipt/finalRegister")
	public void finalRegister(ReceiptVO receipt) {
		
		service.receiptResgister(receipt);
		
	}
	
	// 영수증 처리 대기 목록 탭 이동
	@GetMapping("/receipt/receiptWaitList")
	public String getreceiptWaitList() {
		
		return "receipt/receiptWaitList";
		
	}
	
	@PostMapping("/receipt/waitListSearch")
	@ResponseBody
	public List<ReceiptVO> getwaitSearchList(@RequestParam("searchWord") String searchWord, Model model){
		
		List<ReceiptVO> searchWaitList = service.searchwaitList(searchWord);
		
		
		return searchWaitList;
	}
	
	@PostMapping("/receipt/processedListSearch")
	@ResponseBody
	public List<ReceiptVO> getprocessedList(@RequestParam("searchWord") String searchWord){
		
		List<ReceiptVO> searchprocessedList = service.searchprocessedList(searchWord);
		
		return searchprocessedList;
	}
	
	
	@GetMapping("/receipt/selectDate")
	@ResponseBody
	public List<ReceiptVO> getListDate(searchDateVO dateVO){
		
		List<ReceiptVO> searchDateList = service.serachDate(dateVO);
		
		return searchDateList;
		
	}
	
	// 영수증 종류에 따른 조회 ajax
	@GetMapping("/receipt/getReceiptKindList")
	@ResponseBody
	public List<ReceiptVO> getReceiptKindList(@RequestParam("receiptKind") String receiptKind){
		
		List<ReceiptVO> searchReceiptKindList = service.searchReceiptKind(receiptKind);
		
		return searchReceiptKindList;
	}
	
	// 목록 개수에 따른 조회 ajax
		@GetMapping("/receipt/getPerReceiptList")
		@ResponseBody
		public List<ReceiptVO> getpPerReceipList(@RequestParam("perReceipt") int perReceipt){
			
			List<ReceiptVO> perReceiptList = service.getPerReceiptList(perReceipt);
			
			return perReceiptList;
	}
	
	
	// 세부사항 조회하기
	@RequestMapping("/receipt/detail/{receiptNo}")
	public ReceiptVO receiptDetail(@PathVariable("receiptNo") int receiptNo) {
		
		
		ReceiptVO receipt = new ReceiptVO();
		// receiptNo 넘겨서 세부사항 조회하기
		return receipt;
	}
	
	
	@GetMapping("/receipt/waitAllList")
	@ResponseBody
	public List<ReceiptVO> waitList(){
		
		List<ReceiptVO> waitAllList = service.waitAllList();
		
		return waitAllList;
		
	}
	
	// 처리 완료된 영수증 목록
	@GetMapping("/receipt/processedAllList")
	@ResponseBody
	public List<ReceiptVO> processedList(){
		
		List<ReceiptVO> processedAllList = service.getProcessedList();
		
		return processedAllList;
		
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
