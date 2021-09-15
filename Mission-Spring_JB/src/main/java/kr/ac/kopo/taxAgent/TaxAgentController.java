package kr.ac.kopo.taxAgent;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.member.service.MemberService;

@Controller
public class TaxAgentController {

//	@Autowired
//	private taxAgent taxAgentservice;

	// 기장대리 페이지로 이동
	@RequestMapping("/taxAgent/taxAccount")
	public String taxAccount() {
		
		return "taxAgent/taxAccount";
	}
	
	
	
}
