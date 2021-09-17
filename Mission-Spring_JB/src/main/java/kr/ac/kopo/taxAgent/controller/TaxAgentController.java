package kr.ac.kopo.taxAgent.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.taxAgent.service.TaxAgentService;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;

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
		
		mav.addObject("customerList", customerList);
		
		return mav;
	}
	
	// 세무사가 회원 목록에서 회원 클릭 => 회원 사업장 번호를 통해 ajax로 데이터 불러오기
	@RequestMapping("/taxAgent/taxAccountDetail/{bNo}")
	public ModelAndView taxAccountDetail(@PathVariable("bNo") String bNO) {
		
//		고객 사업자번호로 조회
		
		ModelAndView mav = new ModelAndView("taxAgent/taxAccountDetail");
		
		TaxCustomerVO taxCustomer = service.getCustomerInfoService(bNO);
		
		mav.addObject("taxCustomer", taxCustomer);
		
		return mav;
		
	}
	
	
	
	
	
	
	
	
}
