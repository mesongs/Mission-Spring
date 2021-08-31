package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.member.vo.MemberVO;

// model객체나 modelAndView를 통해 공유영역에 올린 것 중
// ~이름을 가진 것을 세션영역에 올려줘, 하나 일 때는 {} 기호 안써도 됨
// 근데 이렇게 session을 등록하면, session.invalidate()가 작동안하네..
@SessionAttributes({"userVO"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/member/login")
	public String loginForm(Model model, HttpSession session) {
		
		String msg = (String)session.getAttribute("msg");
		
		// session에서 msg 제거
		session.removeAttribute("msg");
		
		model.addAttribute("msg", msg);
		
		return "member/login";
	}
	
	@PostMapping("/member/login")
	public String login(LoginVO loginVO, Model model, HttpSession session) {
		
		
		LoginVO userVO =  service.login(loginVO);
		
		//로그인을 실패한 경우
		if(userVO == null) {
			
			String msg = "아이디 또는 패스워드가 잘못되었습니다.";
			// 실패한 경우, 공유영역에 msg 등록
			model.addAttribute("msg", msg);
			
			return "member/login";
		}
		
		// 로그인을 성공했음
		// 필요한거 요구하면 됨, session 객체도 굳이 request로 받아올 필요없음
		model.addAttribute("userVO", userVO);
		
		
		// 로그인 인터셉터를 거쳤는지 확인, 사용자가 로그인 후 가고싶은 경로
		String dest = (String)session.getAttribute("dest");
		if(dest != null) {
				
				session.removeAttribute("dest");
				return "redirect:" + dest;
			}
		
		return "redirect:/";
		
	}
	
	// @RequestMapping 써도됨
	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		
		// @SessionAttributes로 등록하니까 이게 작동안함 => SessionStatus
		//session.invalidate();
		
		// false
		System.out.println(sessionStatus.isComplete());
		
		// 세션 끝났음, 종료
		sessionStatus.setComplete();
		
		// true (끝난거 확인)
		System.out.println(sessionStatus.isComplete());
		
		return "redirect:/";
	}
	
	///////////////////////////////////////////////////////////////// 윗 부분은 board 만들 때 생성한 것
	@GetMapping("/member/signUp")
	public String signUpForm(){
		
		return "member/signUp";
	}
	
	// 회원가입 실행
	@PostMapping("/member/signUp")
	public String signUpProcess(MemberVO member, HttpSession session) {
		
		String msg = "회원가입을 축하합니다. 로그인 해주세요.";
		session.setAttribute("msg", msg);
		
		// login.jsp에 모달로 msg 호출
		// session에 저장하고, 컨트롤러 보내기 위해 redirect, GetMapping으로 보내지지..
		
		return "redirect:/member/login";
	}
	
	@RequestMapping("/member/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("userId") String inputId) {
		

		String valid = service.idCheck(inputId);
		
		// 반환되는 값이 success or fail
		return valid;
	}
	
	@RequestMapping("/member/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		
		int authNo = service.emailCheck(email);
		
		return authNo;
	}
	
	
}
