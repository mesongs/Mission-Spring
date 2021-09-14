package kr.ac.kopo.financial.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.financial.vo.ReturnSalesVO;
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

	// 이전에 시도했던 것(result set뽑아오는거)
//	@Override
//	public List<SalesReportVO> getSalesReportDao(String businessNo) {
//		
//		List<SalesReportVO> salesReportList = sqlSessionTemplate.selectList("financial.financialDAO.salesReportResult", businessNo);
//		
//		return salesReportList;
//	}

	@Override
	public List<ReturnSalesVO> getCardApprovalTop5Dao(String businessNo) {
		
		List<ReturnSalesVO> cardApprovalTop5List = sqlSessionTemplate.selectList("financial.financialDAO.cardApprovalTop5", businessNo);
		
		return cardApprovalTop5List;
	}

	@Override
	public ReturnSalesVO getSalesSum(String businessNo) {
		
		ReturnSalesVO returnSalesVO = sqlSessionTemplate.selectOne("financial.financialDAO.salesResult", businessNo);
		
		return returnSalesVO;
	}

	@Override
	public List<ReturnSalesVO> getLastWeekSales(String businessNo) {
		
		List<ReturnSalesVO> lastWeekSales = sqlSessionTemplate.selectList("financial.financialDAO.lastWeekSales", businessNo);
		return lastWeekSales;
	}
	
	@Override 
	public List<ReturnSalesVO> getWeekBeforeSales(String businessNo) {
		
		List<ReturnSalesVO> weekBeforeSales = sqlSessionTemplate.selectList("financial.financialDAO.weekBeforeLast", businessNo);
		return weekBeforeSales;
	}

	@Override
	public int getPerCustomerSale(String businessNo) {
		
		int perCustomerSale = sqlSessionTemplate.selectOne("financial.financialDAO.perCutomerSale", businessNo);
		return perCustomerSale;
	}

	@Override
	public ReturnSalesVO getByTime(String businessNo) {
		
		ReturnSalesVO returnSalesVO = sqlSessionTemplate.selectOne("financial.financialDAO.byTimeSale", businessNo);
		
		return returnSalesVO;
	}

	@Override
	public ReturnSalesVO getByTime2(String businessNo) {
		
		ReturnSalesVO returnSalesVO = sqlSessionTemplate.selectOne("financial.financialDAO.byTimeSale2", businessNo);
		
		return returnSalesVO;
	}

	@Override
	public List<ReturnSalesVO> getCustomerKindSaleList(String businessNo) {
		
		List<ReturnSalesVO> customerKindSaleList = sqlSessionTemplate.selectList("financial.financialDAO.customerKindSale", businessNo);
		
		return customerKindSaleList;
	}

	@Override
	public List<ReturnSalesVO> getWeekCustomerKindSaleList(String businessNo) {
		List<ReturnSalesVO> customerKindSaleList = sqlSessionTemplate.selectList("financial.financialDAO.WeekCustomerKindSale",businessNo);
		return customerKindSaleList;
	}

	@Override
	public ReturnSalesVO getMonthSales(String businessNo) {
		ReturnSalesVO monthSalesVO = sqlSessionTemplate.selectOne("financial.financialDAO.monthSalesResult", businessNo);
		
		return monthSalesVO;
	}
	
	
	
}
