package kr.ac.kopo.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		
		// 루트로 들어왔을 때, WEB-INF/jsp/index.jsp
		return "index";
		
	}
	
	// 테스트해보자
	
	@RequestMapping("/receipt")
	public String rec() {
		
		
		return "receipt/receiptList"; 
	}
	
}
