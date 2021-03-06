package kr.ac.kopo.taxAgent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.financial.vo.ReturnPurchaseVO;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.taxAgent.service.TaxAgentService;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxUserInfoVO;
import kr.ac.kopo.taxAgent.vo.customerPurchaseVO;
import kr.ac.kopo.taxAgent.vo.summaryVO;
import kr.ac.kopo.taxAgent.vo.CustomerSalesVO;
import kr.ac.kopo.taxAgent.vo.TaxBillVO;
import kr.ac.kopo.taxAgent.vo.WriteInfoVO;

@Controller
public class TaxAgentController {

	@Autowired
	private TaxAgentService service;

	// 고객 증빙자료 조회/수집 페이지로 이동
	@RequestMapping("/taxAgent/taxAccount")
	public ModelAndView taxAccount(HttpSession session) {
		
		// 여기서 로그인한 세무사의 고객 정보를 가져옴
		
		ModelAndView mav = new ModelAndView("taxAgent/taxAccount");
		
		LoginVO userVO = (LoginVO)session.getAttribute("userVO");
		String taxAgentId = userVO.getId();
		
		// 세무사가 담당하고 있는 회원 정보
		List<TaxCustomerVO> customerList = service.getCustomerListService(taxAgentId);
		
		for(int i=0; i<customerList.size(); i++) {
			
			customerList.get(i).setPhone(makePhoneNumber(customerList.get(i).getPhone()));
			customerList.get(i).setBusinessNo(makeBNo(customerList.get(i).getBusinessNo()));
		}
		
		
		mav.addObject("customerList", customerList);
		
		return mav;
	}
	
	public static String makePhoneNumber(String phoneNumber) {

		   String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";

		   

		   if(!Pattern.matches(regEx, phoneNumber)) return null;

		   

		   return phoneNumber.replaceAll(regEx, "$1-$2-$3");

		   

	  }
	
	public static String makeBNo(String businessNo) {

		   String regEx = "(\\d{3,3})(\\d{2,2})(\\d{5,5})";
		   
		   

		   if(!Pattern.matches(regEx, businessNo)) return null;

		   

		   return businessNo.replaceAll(regEx, "$1-$2-$3");
	  }
	
	

	
	// 세무사가 선택한 고객의 세무 정보
		@RequestMapping("/taxAgent/taxAccountDetail/{bNo}")
		public ModelAndView taxAccountDetail(@PathVariable("bNo") String bNO) {
			
//			고객 사업자번호로 조회
			
			bNO = bNO.replaceAll("-", "");
			
			ModelAndView mav = new ModelAndView("taxAgent/taxAgentLookupSales");
			
			// 세무사가 선택한 고객의 data를 얻어옴
			TaxCustomerVO taxCustomer = service.getCustomerInfoService(bNO);
			
			// 회원의 최근 6개월 간의 통합 매입, 카드 매출을 조회 => 공유영역에 저장
			// 서비스단에서 dao 여러 개 호출해서 map에 저장해서 넘겨주기
			
			
			// 세무사가 선택한 고객 Info
			mav.addObject("taxCustomer", taxCustomer);
			
			return mav;
	}
	
  
	// 통합 매입 조회 ajax
	@RequestMapping("/taxAgent/getPurchaseListAjax")
	@ResponseBody
	public HashMap<String, Object> getPurchaseListAjax(@RequestParam HashMap<String, String> map){
		
		HashMap<String, Object> returnMap = service.getCustomerPurchaseListService(map);
		// returnMap에 들어있는 값은 사용자가 조회한 rowList 영수금액 합계, 부가세 합계, 매입유형별 금액 합계
		
		return returnMap;
	}
	
	
	// 통합 매출 조회 ajax
	@RequestMapping("/taxAgent/getSalesListAjax")
	@ResponseBody
	public HashMap<String, Object> getSalesListAjax(@RequestParam HashMap<String, String> map){
		
		HashMap<String, Object> returnMap = service.getCustomerSalesListService(map);
		
		return returnMap;
	}
		
	// 세무사가 고객의 세무 정보 확인 후, 신고서 작성 페이지로 이동함 - 변경 전 1
	@PostMapping("/taxAgent/taxWriteForm")
	public ModelAndView taxWriteForm(summaryVO summaryVO) {
		
		ModelAndView mav = new ModelAndView("taxAgent/taxWriteFormKind");
		mav.addObject("summaryVO", summaryVO);
		
		return mav;
	}
	
	// 카드 매출 관련 신고서 작성, form으로 이동
	@PostMapping("/taxAgent/cardSealesWriteForm")
	public ModelAndView cardSealesWriteForm(WriteInfoVO writeInfoVO) {
		
		ModelAndView mav = new ModelAndView("taxAgent/taxCardSalesWriteForm");
		// 이 링크로 들어오면, 기존에 조회한 값을 가지고 들어와야함
		
		String bNo = writeInfoVO.getbNo();
		
		TaxUserInfoVO taxUserInfo = service.getTaxUserInfoService(bNo); 		
		
		// 고객 기본정보를 가져와서VO 공유영역에 저장
		mav.addObject("taxUserInfo", taxUserInfo);
		mav.addObject("writeInfoVO", writeInfoVO);
		
		return mav;
		
	}
	
	// 매입처별 세금계산서 합계표
	@PostMapping("/taxAgent/taxBill")
	public ModelAndView getAjaxTaxBill(WriteInfoVO writeInfoVO) {
		
		ModelAndView mav = new ModelAndView("taxAgent/taxBillWriteForm");
		// bNo 고객 정보(사업장 정보) 가져와야하고, 고객의 세금계산서 내역을 가져와야함, forEach로
		String bNo = writeInfoVO.getbNo();
		
		// writeInfoVO에는 통합 매입 / 매출 데이터가 들어있음
		TaxUserInfoVO taxUserInfo = service.getTaxUserInfoService(bNo);  
		
		// 세무사가 선택한 날짜
		String selectYear = writeInfoVO.getSelectYear();
		String selectOrder = writeInfoVO.getSelectOrder();
		
		HashMap<String, String> requestMap = new HashMap<>();
		
		requestMap.put("selectYear", selectYear);
		requestMap.put("selectOrder", selectOrder);
		
		List<TaxBillVO> getHrTaxBillList = service.getHrTaxBillList(requestMap);
		
		TaxBillVO taxBillCountSumVO = service.taxbillCountSum(requestMap);
		
		TaxBillVO digitalTaxBillCountSumVO = service.digitalTaxBillCountSum(requestMap);
		
		mav.addObject("writeInfoVO",writeInfoVO);
		mav.addObject("taxUserInfo",taxUserInfo);
		
		
		// 수기 세금계산서 List
		mav.addObject("getHrTaxBillList", getHrTaxBillList);
		
		// 수기 세금계산서 합계
		mav.addObject("taxBillCountSumVO",taxBillCountSumVO);
		
		// 전자 세금계산서 합계
		mav.addObject("digitalTaxBillCountSumVO", digitalTaxBillCountSumVO);
		
		return mav;
		
	}
	

	// 매출 탭으로 이동 시 변경되는 부분만 페이지 replace
	@RequestMapping("/taxAgent/taxAgentPurchaseReplace")
	public String purchaseReplace() {
		
		return "taxAgent/taxAgentLookupReplace";
	}
	
	
	
	
	
	
}
