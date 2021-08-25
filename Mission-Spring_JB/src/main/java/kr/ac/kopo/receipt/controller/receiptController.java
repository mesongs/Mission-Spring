package kr.ac.kopo.receipt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class receiptController {
	
	@RequestMapping("/receipt/detail")
	public String receiptDetail() {
		
		
		return "receipt/receiptDetail";
		
	}
	
	
}
