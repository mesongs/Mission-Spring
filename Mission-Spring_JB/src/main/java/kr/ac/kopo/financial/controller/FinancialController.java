package kr.ac.kopo.financial.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView financialSales(HttpSession session){
		
		LoginVO userVO = (LoginVO)session.getAttribute("userVO");
		String businessNo = userVO.getBusinessNo();

//		현재 날짜별로 insert하는데, 하나with에 가입한 모든 회원들의 전 날 카드 통합 매출내역을 조회해야함
//		String dealDate = "202001";
//		financialService.batchInsertSalesService(businessNo, dealDate);
		
		// 매일 오전 9시 30분 batch Insert 실행
//		financialService.batchInsertSalesService();
		
		
		///////////////////////////////////////////////////////////////////////////////////////
		ModelAndView mav = new ModelAndView("financial/salesReport");
//		
		HashMap<String, Object> map = financialService.getSalesInfo(businessNo);
//		
		System.out.println("컨트롤러에서 출력한 map : " + map);
//		
		mav.addObject("map", map);
//		
//		System.out.println(map.get("cardApprovalTop5List").toString());
		
		return mav;
	}
	
	// 스프링 스케줄러로 배치 처리, 회원들의 사업장에서 발생한 카드 통합 매출 정보를 여신~으로부터 가져와서 insert
//	public void cardBatchInsert(HttpSession session) {
//		
//		LoginVO userVO = (LoginVO)session.getAttribute("userVO");
//		String businessNo = userVO.getBusinessNo();
//		
//		// 매일 해당 날짜 -1일로 api요청 / 월별 요청도 가능
//		String dealDate = "20210714";
//		
//		// 회원들의 사업장번호를 모두 select해서 전달해서 받아와야함
//		financialService.batchInsertSalesService(businessNo, dealDate);
//		
//	}
	
	
	
}
