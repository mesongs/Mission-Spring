package kr.ac.kopo.financial.dao;

import java.util.List;

import kr.ac.kopo.financial.vo.ReturnSalesVO;
import kr.ac.kopo.financial.vo.SalesReportVO;
import kr.ac.kopo.financial.vo.SalesVO;

public interface FinancialDAO {
	
	void batchInsertSalesDao(List<SalesVO> salesList);
	
//	List<SalesReportVO> getSalesReportDao(String businessNo);
	
	// 파라미터로 날짜도 받아야함
	List<ReturnSalesVO> getCardApprovalTop5Dao(String businessNo);
	
	// 전 날 매출액
	ReturnSalesVO getSalesSum(String businessNo);
	
	List<ReturnSalesVO> getLastWeekSales(String businessNo);
	
	List<ReturnSalesVO> getWeekBeforeSales(String businessNo);
	
	int getPerCustomerSale(String businessNo);
	
	// 전 날 시간대별 매출액
	ReturnSalesVO getByTime(String businessNo);
	
	// 전 전날 시간대별 매출액
	ReturnSalesVO getByTime2(String businessNo);
	
	// (전 날)고객 종류별 결제금액 / 기존고객, 신규고객 수
	List<ReturnSalesVO> getCustomerKindSaleList(String businessNo);
	
	// (최근 7일간) 고객 종류별 결제금액 / 기존고객, 신규고객 수
	List<ReturnSalesVO> getWeekCustomerKindSaleList(String businessNo);
	
	
}
