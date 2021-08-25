package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

//@Controller
public class MemberController2 {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/login")
	public String loginForm() {
		
		return "login/login";
		
	}
	
	
	@PostMapping("/login")
	public String login(MemberVO member, Model model, HttpSession session) {
		
		System.out.println(member);
		
		MemberVO userVO =  service.login(member);
		
		
		//로그인을 실패한 경우
		if(userVO == null) {
			String msg = "아이디 또는 패스워드가 잘못되었습니다.";
			// 실패한 경우, 공유영역에 msg 등록
			model.addAttribute("msg",msg);
			
			return "login/login";
		}
		
		// 로그인을 성공했음
		// 스프링은 필요한거 요구하면 됨, session 객체도 굳이 request로 받아올 필요없음!
		session.setAttribute("userVO", userVO);
		
		return "redirect:/";
		
	}
	
	// @RequestMapping 써도됨
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
}
