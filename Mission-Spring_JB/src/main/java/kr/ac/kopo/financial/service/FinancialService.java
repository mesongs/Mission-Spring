package kr.ac.kopo.financial.service;

import java.util.List;

import kr.ac.kopo.financial.vo.salesVO;

public interface FinancialService {

	// 회원의 매출 내역을 가져옴
	List<salesVO> getSalesReportService(String businessNo, String dealDate);
	
}
