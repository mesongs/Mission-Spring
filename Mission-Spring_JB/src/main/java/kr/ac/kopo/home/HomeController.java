package kr.ac.kopo.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		
		// 루트로 들어왔을 때, WEB-INF/jsp/index.jsp
		// 현재 index.jsp를 webapp으로 꺼내놓음, 편리하게 개발하려고..
		return "index";
		
	}
	
	
	
	
}
