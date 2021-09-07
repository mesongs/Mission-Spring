package kr.ac.kopo.financial.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.financial.service.FinancialService;
import kr.ac.kopo.member.vo.LoginVO;

@Controller
public class FinancialController {

	
	@Autowired
	private FinancialService financialService;
	
	// 사업보고서 탭 이동
	@RequestMapping("/financial/sales")
	public String financialSales(HttpSession session){
		
		LoginVO userVO = (LoginVO)session.getAttribute("userVO");
		
		String businessNo = userVO.getBusinessNo();
		String dealDate = "20210829";
		
		
		financialService.getSalesReportService(businessNo, dealDate);
		
		//서비스에서 api 요청
		
		return "financial/salesReport";
	}
}
