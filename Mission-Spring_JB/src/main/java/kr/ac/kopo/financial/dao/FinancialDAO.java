package kr.ac.kopo.financial.dao;

import java.util.List;

import kr.ac.kopo.financial.vo.salesVO;

public interface FinancialDAO {
	
	void getSalesReportDao(List<salesVO> salesList);
}
