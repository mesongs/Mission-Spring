package kr.ac.kopo.financial.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.financial.vo.SalesReportVO;
import kr.ac.kopo.financial.vo.SalesVO;

@Repository
public class FinancialDAOImpl implements FinancialDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void batchInsertSalesDao(List<SalesVO> salesList) {
		
//		sqlSessionTemplate.insert("financial.financialDAO.salesInsertBatch", salesListMap);
		sqlSessionTemplate.insert("financial.financialDAO.salesInsertBatch", salesList);
		
	}

	// 이전에 시도했던 것
	@Override
	public List<SalesReportVO> getSalesReportDao(String businessNo) {
		
		List<SalesReportVO> salesReportList = sqlSessionTemplate.selectList("financial.financialDAO.salesReportResult", businessNo);
		
		return salesReportList;
	}

	@Override
	public List<SalesReportVO> getCardApprovalTop5Dao(String businessNo) {
		
		List<SalesReportVO> cardApprovalTop5List = sqlSessionTemplate.selectList("financial.financialDAO.cardApprovalTop5", businessNo);
		
		return cardApprovalTop5List;
	}
	
	
	
	
	
	
	
	
	
}
