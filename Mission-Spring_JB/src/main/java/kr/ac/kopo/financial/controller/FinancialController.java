package kr.ac.kopo.financial.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.financial.service.FinancialService;
import kr.ac.kopo.financial.vo.ReturnSalesVO;
import kr.ac.kopo.financial.vo.SalesReportVO;
import kr.ac.kopo.member.vo.LoginVO;

@Controller
public class FinancialController {

	@Autowired
	private FinancialService financialService;
	
	// 사업보고서 탭 이동
	// api 요청 후 데이터 받아오기 test 중, 컨트롤러에 스케줄러 설정, 서비스에서 컨트롤러에서 파라미터 가지고 있으면 스케줄러 오류남
	@RequestMapping("/financial/slaesReport")
	public String financialSales(HttpSession session){
		
		LoginVO userVO = (LoginVO)session.getAttribute("userVO");
		String businessNo = userVO.getBusinessNo();

//		현재 날짜별로 insert하는데, 하나with에 가입한 모든 회원들의 전 날 카드 통합 매출내역을 조회해야함
//		String dealDate = "20210714";
//		financialService.batchInsertSalesService(businessNo, dealDate);
		
		// 매일 오전 9시 30분 batch Insert 실행
//		financialService.batchInsertSalesService();
		
		
		
		
		//받아온 데이터를 시각화하기, view에 필요한 데이터 select
		ReturnSalesVO returnSalesReport = financialService.getSalesInfo(businessNo);
		
		System.out.println(returnSalesReport);
		
		return "financial/salesReport";
	}
	
	
	
}
