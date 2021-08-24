package kr.ac.kopo.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("/login")
	public String loginForm() {
		
		
		return "login/login";
		
	}
}
