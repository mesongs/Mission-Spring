package kr.ac.kopo.receipt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.awt.Color;
import java.io.BufferedOutputStream;
import java.io.File; 
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.receipt.service.ReceiptService;
import kr.ac.kopo.receipt.vo.AcceptRejectVO;
import kr.ac.kopo.receipt.vo.HomeTaxCardVO;
import kr.ac.kopo.receipt.vo.HomeTaxCashVO;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.receipt.vo.RejectReceiptVO;
import kr.ac.kopo.receipt.vo.HomeTaxInfoVO;
import kr.ac.kopo.receipt.vo.IntegratedSalesVO;
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
	public String finalRegister(ReceiptVO receipt) {
		
		service.receiptResgister(receipt);
		
		return "receipt/receiptList";
		
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
	
	
	// 회원 - 처리완료된 영수증 세부사항 조회하기
	@RequestMapping("/receipt/detail/{receiptNo}")
	public ModelAndView receiptDetail(@PathVariable("receiptNo") int receiptNo) {
		
		ModelAndView mav = new ModelAndView("receipt/receiptDetail");
		ReceiptVO receipt = service.receiptDetail(receiptNo);
		mav.addObject("receipt", receipt);
		
		return mav;
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
	
	// 직원이 확인할 수 있는 처리 대기중인 모든 영수증 목록
	@RequestMapping("/receipt/receiptManager")
	public String receiptManageMent() {
		
		return "receipt/receiptManage";
		
	}
	
	@GetMapping("/receipt/getMgWaitList")
	@ResponseBody
	public List<ReceiptVO> getMgProcessedList(){
		
		List<ReceiptVO> mgWaitList = service.getMgWaitList();
		
		return mgWaitList;
	}
	
	// 직원이 확인할 수 있는 처리 '완료'된 영수증 목록
	@RequestMapping("/receipt/mgProcessed")
	public String receiptmgProcessed() {
		
		return "receipt/receiptManageProcessed";
	}
	
	// 직원이 승인 or 반려를 위해 들어가는 상세페이지
	@RequestMapping("/receipt/mgDetail/{receiptNo}")
	public ModelAndView getMgDetail(@PathVariable("receiptNo") int receiptNo) {
		
		ModelAndView mav = new ModelAndView("receipt/mgReceiptDetail");
		ReceiptVO receipt = service.mgDetailService(receiptNo);
		
		mav.addObject("receipt", receipt);
		
		return mav;
	}
	
	// 직원 처리 대기 목록 개수에 따른 조회 ajax
	@GetMapping("/receipt/getPerMgReceiptList")
	@ResponseBody
	public List<ReceiptVO> getpPerMgReceipList(@RequestParam("perReceipt") int perReceipt){
				
		List<ReceiptVO> perMgReceiptList = service.getMgReceiptService(perReceipt);
				
		return perMgReceiptList;
	}
	
	@PostMapping("/receipt/accept")
	public ModelAndView receiptAcceptReject(AcceptRejectVO acceptReject) {

		ModelAndView mav = new ModelAndView("receipt/receiptManage");
		String msg = "";
		
		int cnt = service.acceptRejectService(acceptReject);
		
		// 정상 수행 확인
		if(cnt == 1) {
			
			if(acceptReject.getConfirm().equals("1")) {
				
				msg = "정상적으로 승인되었습니다.";
				
			}else {
				
				msg = "정상적으로 반려되었습니다.";
			}
			
		}else {
			
			msg = "실패";
		}
		
		// 수행 결과 모달창 띄우기
		mav.addObject("msg", msg);
		
		return mav;
		
	}
	
	 // 회원이 확인할 수 있는 반려된 영수증 탭 이동
		@RequestMapping("/receipt/rejectReceiptList")
		public String rejectReceipt(){
			
			return "receipt/rejectReceiptList";
		}
		
		@GetMapping("/receipt/getRejectList")
		@ResponseBody
		public List<RejectReceiptVO> rejectReceiptList(){
			
			List<RejectReceiptVO> rejectReceiptList = service.getRejectReceiptList();
			
			return rejectReceiptList;
		}
		
		// 회원 - 반려된 영수증에 대한 세부사항
		@RequestMapping("/receipt/rejectDetail/{receiptNo}")
		public ModelAndView rejectReceiptDetail(@PathVariable("receiptNo") int receiptNo) {
			
			ModelAndView mav = new ModelAndView("receipt/rejectReceiptDetail");
			RejectReceiptVO rejectReceipt = service.rejectReceiptDetailService(receiptNo);
			
			System.out.println(rejectReceipt);
			mav.addObject("rejectReceipt", rejectReceipt);
			
			return mav;
		}
		
		// 회원이 반려된 영수증을 세부사항으로 가서 '재등록'
		@PostMapping("/receipt/reRegisterReject")
		public ModelAndView reRegister(RejectReceiptVO rejectReceipt) {
			
			
			// 회원 반려 부분으로 다시
			ModelAndView mav = new ModelAndView("receipt/rejectReceiptList");
			String msg ="";
			
			int cnt = service.reRegisterRejectService(rejectReceipt);
			
			if(cnt == 1) {
				
				msg = "영수증이 재등록 되었습니다.";
			
			}
			
			mav.addObject("msg", msg);
			
			return mav;
			
		}

		// 홈택스 연동 페이지로 이동 (현재 카드 매입 내역 조회로감)
		@RequestMapping("/receipt/homeTaxPage")
		public String homeTaxPage() {
			
			
			return "receipt/homeTaxCard";
		}
		
		// 홈택스 현금영수증 매입내역 이동
		@RequestMapping("/receipt/homeTaxCash")
		public String homeTaxCash() {
			
			return "receipt/homeTaxCash";
		}
		
		// 홈택스 전자(세금) 계산서 이동
		@RequestMapping("/receipt/homeTaxDigitalInvoice")
		public String homeTaxDigital() {
					
			return "receipt/homeTaxDigital";
		}
		
		// 홈택스 Main으로 이동
		// post로 로그인 정보를 받아오자 form 방식
		@PostMapping("/receipt/homeTaxConnect") 
		public String homeTaxConnect(HomeTaxInfoVO homeTaxInfo, Model model) {
				
			    // 반환값은 뭐여야 하지? 로그인이 성공적으로 되었다 라는 걸 확인하고 성공한 경우에만 페이지 넘겨야함
				// 로그인 실패한 경우에는 redirect
				String valid = service.homeTaxConnectService(homeTaxInfo);
				String msg ="";
				
				if(valid.equals("success")) {
					
					// 인증 성공한 경우
					System.out.println(" 로그인 성공 시 받아온 값 " + valid);
					return "receipt/homeTaxMain";
					
				}else {
					System.out.println(" 로그인 실패 시 받아온 값 " + valid);
 					return "redirect:/receipt/register";
				}
				
				
		}
		
		// 테스트용으로 만들어놓은 get방식
		@GetMapping("/receipt/homeTaxConnect") 
		public String TesthomeTaxConnect() {
				
				// 테스트
				return "receipt/homeTaxMain";
		}
		
		// 회원의 현금 영수증(매입) 정보를 가져옴
		@RequestMapping("/receipt/getHomeTaxCashInfo")
		@ResponseBody
		public List<HomeTaxCashVO> getHomeTaxCashInfo(HttpSession session, @RequestParam("purchaseDate") String purchaseDate) {
			
			LoginVO userVO = (LoginVO)session.getAttribute("userVO");
			String businessNo = userVO.getBusinessNo();
			
			List<HomeTaxCashVO> getHomeTaxCashList = service.getHomeTaxCashInfoService(purchaseDate, businessNo);
			
			return getHomeTaxCashList;
			
		}
		
		@RequestMapping("/receipt/getHomeTaxCardInfo")
		@ResponseBody
		public List<HomeTaxCardVO> getHomeTaxCardInfo(HttpSession session, @RequestParam("searchMonth") String searchMonth){
			
			LoginVO userVO = (LoginVO)session.getAttribute("userVO");
			String businessNo = userVO.getBusinessNo();
			
			List<HomeTaxCardVO> getHomeTaxCardList = service.getHomeTaxCardInfoService(searchMonth, businessNo);
			
			return getHomeTaxCardList;
		}
		
		
		// 통합 영수증 매입으로 이동
		@RequestMapping("/receipt/allReceiptList")
		public String getAllreceiptList() {
			
			
			
			return "receipt/allReceiptList";
		}
		
		// 통합 매입 내역을 반환하는 list
		@RequestMapping("/receipt/getAllReceiptSalese")
		@ResponseBody
		public HashMap<String, Object> getAllreceiptSalesList(IntegratedSalesVO integratedSalesVO, HttpSession session) {
			
			LoginVO userVO = (LoginVO)session.getAttribute("userVO");
			String businessNo = userVO.getBusinessNo();
			
			integratedSalesVO.setBusinessNo(businessNo);
			
			List<IntegratedSalesVO> IntegratedSalesList = service.getIntegratedList(integratedSalesVO);
			
			// 받아온 List의 vo 합계를 공유영역에 등록하기
			
			// 구매금액의 합계, 세액 합계
			int amountSum=0;
			int vatSum=0;
			
			for(int i=0; i< IntegratedSalesList.size(); i++) {
				
				amountSum += IntegratedSalesList.get(i).getCalSum();
				vatSum += IntegratedSalesList.get(i).getVat();
			}
			
			
			HashMap<String, Object> map = new HashMap<>();
			
			map.put("IntegratedSalesList", IntegratedSalesList);
			map.put("amountSum", amountSum);
			map.put("vatSum", vatSum);
			
			return map;
			
		}
		
		// 엑셀 다운로드
		@RequestMapping("/receipt/getListExcelFile")
		public String ListExcelDown(HttpServletRequest request ,HttpServletResponse response ,HttpSession session, IntegratedSalesVO param ) throws Exception {
			
			OutputStream out = null;
			
			// 업로드한 후 새로고침 안하려면, 그냥 void하면 되나?
			
			 try {
		            HSSFWorkbook workbook = service.listExcelDownload(param);
		            
		            response.reset();
		            response.setHeader("Content-Disposition", "attachment;filename=stbcs_history.xls");
		            response.setContentType("application/vnd.ms-excel");
		            out = new BufferedOutputStream(response.getOutputStream());
		            
		            workbook.write(out);
		            out.flush();
		            
		        } catch (Exception e) {
		        	e.printStackTrace();
//		            logger.error("exception during downloading excel file : {}", e);
		        } finally {
		            if(out != null) out.close();
		        }    
			
			
			return "redirect:/receipt/allReceiptList";
		}
		
 				
}















