package kr.ac.kopo.account.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.PolicyVO;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	// 사용자의 agreement가 'N'인 경우 실행되는 controller
	@RequestMapping("/account/agreement")
	public ModelAndView agreement() {
		
		ModelAndView mav = new ModelAndView("account/agreement");
		
		List<PolicyVO> policyList = accountService.policyAgree();
		
		mav.addObject("policyList", policyList);
		
		return mav;
	}
	
	// 간편비밀번호 설정 이용약관
	@GetMapping("/account/easyPassword")
	public ModelAndView setEasypassword() {
		
		ModelAndView mav = new ModelAndView("account/easyPasswordSet");
		List<PolicyVO> policyList = accountService.authPolicyAgree();
		mav.addObject("policyList", policyList);
		
		return mav;
	}
	
//	@PostMapping("/account/easyPassword"){
//	간편 이체를 위한 easyPassword 등록하기
//	넘어오는 파라미터는 간편비밀번호만! 있으면 됨	
//	
//	}
	
	@RequestMapping("/account/smsAuth")
	@ResponseBody
	public int smsAuth(@RequestParam("phoneNumber") String phoneNumber) {
		
//		인증번호 넘어오는거 확인함 System.out.println(phoneNumber);
		
		int authNo = accountService.smsAuth(phoneNumber);
		
		return authNo;
	}
	
	
}
