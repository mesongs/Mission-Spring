package kr.ac.kopo.taxAgent.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.taxAgent.service.TaxAgentService;
import kr.ac.kopo.taxAgent.vo.CustomerSalesVO;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxUserInfoVO;
import kr.ac.kopo.taxAgent.vo.customerPurchaseVO;

@Repository
public class taxAgentDAOImpl implements TaxAgentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<TaxCustomerVO> getCustomerListDao(String taxAgentId) {
		
		List<TaxCustomerVO> getCutomerList = sqlSessionTemplate.selectList("taxAgent.taxAgentDAO.getCustomerList", taxAgentId);
		
		return getCutomerList;
	}

	@Override
	public TaxCustomerVO getCustomerInfoDao(String bNo) {
		
		TaxCustomerVO taxCustomer = sqlSessionTemplate.selectOne("taxAgent.taxAgentDAO.getCustomerInfo", bNo);
		
		return taxCustomer;
	}
	
	//세무사 - 고객의 영수증 종류별 매입 합계 조회
//	@Override
//	public List<customerPurchaseVO> getReceiptKindSumList(String bNo) {
//		
//		List<customerPurchaseVO> receiptKindPurchaseList = sqlSessionTemplate.selectList("taxAgent.taxAgentDAO.receiptKindPurchase", bNo); 
//		
//		return receiptKindPurchaseList;
//	}

	@Override
	public customerPurchaseVO getPusrchaseSum(String bNo) {
		
		customerPurchaseVO purchaseSumVO = sqlSessionTemplate.selectOne("taxAgent.taxAgentDAO.purchaseSum", bNo);
		
		return purchaseSumVO;
	}

	@Override
	public List<customerPurchaseVO> getPurchaseList(String bNo) {
		
		List<customerPurchaseVO> purchaseList = sqlSessionTemplate.selectList("taxAgent.taxAgentDAO.pusrchaseRow", bNo);
		
		return purchaseList;
	}

	@Override
	public CustomerSalesVO getSalesSum(String bNo) {
		
		CustomerSalesVO salesSumVO = sqlSessionTemplate.selectOne("taxAgent.taxAgentDAO.salesSum",bNo);
		
		return salesSumVO;
	}

	@Override
	public TaxUserInfoVO getTaxUserInfoDao(String bNo) {
		
		TaxUserInfoVO taxUserInfo = sqlSessionTemplate.selectOne("taxAgent.taxAgentDAO.taxUserInfoSearch", bNo);
		
		return taxUserInfo;
	}

	@Override
	public List<customerPurchaseVO> getCustomerPurchaseListDao(HashMap<String, String> map) {
		
		List<customerPurchaseVO> purchaseList = sqlSessionTemplate.selectList("taxAgent.taxAgentDAO.customerPurchaseListAjax", map);
		
		return purchaseList;
	}

	@Override
	public customerPurchaseVO getPusrchasePerSum(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		
		customerPurchaseVO purchasePurVO = sqlSessionTemplate.selectOne("taxAgent.taxAgentDAO.purchasePerAjax", map);
		
		return purchasePurVO;
	}

	@Override
	public List<customerPurchaseVO> getReceiptKindSumList(HashMap<String, String> map) {
		
		List<customerPurchaseVO> receiptKindSumList = sqlSessionTemplate.selectList("taxAgent.taxAgentDAO.receiptKindSum",map);
		
		return receiptKindSumList;
	}

	
	
	
}
