package kr.ac.kopo.financial.controller;

import java.util.ArrayList;
import java.util.Collection;
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
//		String dealDate = "202011";
//		financialService.batchInsertSalesService(businessNo, dealDate);
		
		// 여기부터는 매출보고서에 필요한 것 select해서 map으로 가져오기
		///////////////////////////////////////////////////////////////////////////////////////
		ModelAndView mav = new ModelAndView("financial/salesReport");
//		
		HashMap<String, Object> map = financialService.getSalesInfo(businessNo);
//		

		
//		keySet 여러 키 순회해서
//		keySet 사이즈 => 객체를 몇 개 만들어야할지
//		루프 돌면서 리스트 객체 생성?
		
		List<ReturnSalesVO> cardApprovalTop5List = (List<ReturnSalesVO>)map.get("cardApprovalTop5List");
		ReturnSalesVO returnSalesVO = (ReturnSalesVO)map.get("returnSalesVO");
		List<ReturnSalesVO> lastWeekSalesList = (List<ReturnSalesVO>) map.get("lastWeekSalesList");
		List<ReturnSalesVO> weekBeforeSalesList = (List<ReturnSalesVO>) map.get("weekBeforeSalesList");
		List<ReturnSalesVO> customerKindSaleList = (List<ReturnSalesVO>)map.get("getCustomerKindSaleList");
		
		int perCutomerSale = (int)map.get("perCutomerSale");
		
		ReturnSalesVO bytimeSale = (ReturnSalesVO)map.get("bytimeSale");
		ReturnSalesVO bytimeSale2 = (ReturnSalesVO)map.get("bytimeSale2");
		
		
		// 최근 7일간 카드사별 결제 금액 top5
		mav.addObject("cardApprovalTop5List", cardApprovalTop5List);
		
		// 전 날, 전 전날, 증감률
		mav.addObject("returnSalesVO", returnSalesVO);
		
		// 최근 7일간 매출액 추이
		mav.addObject("lastWeekSalesList", lastWeekSalesList);
		
		// 지 지난주 매출액 추이(위와 비교할 수 있도록)
		mav.addObject("weekBeforeSalesList", weekBeforeSalesList);
		
		// 평균 객단가
		mav.addObject("perCutomerSale", perCutomerSale);
		
		// 시간대별 분석
		mav.addObject("bytimeSale", bytimeSale);
		mav.addObject("bytimeSale2", bytimeSale2);
		
		// 신규 + 재방문객 수, 신규고객 매출 + 재방문객 매출
		mav.addObject("customerKindSaleList", customerKindSaleList);
		
		return mav;
		
	}
	
// 	스프링 스케줄러로 배치 처리, 지금은 위에서 수동으로 작동하게 넣어놓았음
//	회원들의 사업장에서 발생한 카드 통합 매출 정보를 여신~으로부터 가져와서 insert
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
