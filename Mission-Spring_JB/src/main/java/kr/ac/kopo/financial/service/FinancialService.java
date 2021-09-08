package kr.ac.kopo.financial.service;

import kr.ac.kopo.financial.vo.ReturnSalesVO;


public interface FinancialService {
	
	// 배치 처리
	void batchInsertSalesService(String businessNo, String dealDate);
	
	// 매출 시각화 데이터 처리 후 리턴
	ReturnSalesVO getSalesInfo(String businessNo);
}
