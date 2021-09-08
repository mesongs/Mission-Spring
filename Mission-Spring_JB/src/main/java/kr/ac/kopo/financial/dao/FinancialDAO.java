package kr.ac.kopo.financial.dao;

import java.util.List;

import kr.ac.kopo.financial.vo.SalesReportVO;
import kr.ac.kopo.financial.vo.SalesVO;

public interface FinancialDAO {
	
	void batchInsertSalesDao(List<SalesVO> salesList);
	
	List<SalesReportVO> getSalesReportDao(String businessNo);
	
}
