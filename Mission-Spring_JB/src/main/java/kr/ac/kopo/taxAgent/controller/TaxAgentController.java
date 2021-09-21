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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.taxAgent.service.TaxAgentService;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxBillVO;

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
	
	
	// 세무사가 선택한 고객의 세무 정보 1 - 원본
//	@RequestMapping("/taxAgent/taxAccountDetail/{bNo}")
//	public ModelAndView taxAccountDetail(@PathVariable("bNo") String bNO) {
//		
////		고객 사업자번호로 조회
//		
//		bNO = bNO.replaceAll("-", "");
//		
//		ModelAndView mav = new ModelAndView("taxAgent/taxAccountDetail");
//		
//		TaxCustomerVO taxCustomer = service.getCustomerInfoService(bNO);
//		
//		mav.addObject("taxCustomer", taxCustomer);
//		
//		return mav;
//		
//	}
	
	
	// 세무사가 선택한 고객의 세무 정보 2 - 변경 페이지
		@RequestMapping("/taxAgent/taxAccountDetail/{bNo}")
		public ModelAndView taxAccountDetail(@PathVariable("bNo") String bNO) {
			
//			고객 사업자번호로 조회
			
			bNO = bNO.replaceAll("-", "");
			
			ModelAndView mav = new ModelAndView("taxAgent/taxAgentLookupSales");
			
			TaxCustomerVO taxCustomer = service.getCustomerInfoService(bNO);
			
			mav.addObject("taxCustomer", taxCustomer);
			
			return mav;
			
		}
	
	
	// 세무사가 고객의 세무 정보 확인 후, 신고서 작성 페이지로 이동함
	@RequestMapping("/taxAgent/taxWriteForm")
	public ModelAndView taxWriteForm(@RequestParam("bNo") String bNo, @RequestParam("storeName") String storeName) {
		
		ModelAndView mav = new ModelAndView("taxAgent/taxWriteFormKind");
		
		mav.addObject("bNo", bNo);
		mav.addObject("storeName", storeName);
		
		return mav;
	}
	
	
	// 카드 매출 관련 세금신고서 작성 form으로 이동
	@RequestMapping("/taxAgent/cardSealesWriteForm")
	public ModelAndView cardSealesWriteForm() {
		
		ModelAndView mav = new ModelAndView("taxAgent/taxCardSalesWriteForm");
		
		// 이 링크로 들어오면, 기존에 조회한 값을 가지고 들어와야함
		
		
		return mav;
	}
	
	// 매입처별 세금계산서 합계표
	@RequestMapping("/taxAgent/taxBill")
	public String getAjaxTaxBill(TaxBillVO taxBillVO) {
		
		
		return "taxAgent/taxBillWriteForm";
	}
	

	
	
	
	
	
	
}
