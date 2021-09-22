package kr.ac.kopo.taxAgent.dao;

import java.util.List;

import kr.ac.kopo.taxAgent.vo.CustomerSalesVO;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxUserInfoVO;
import kr.ac.kopo.taxAgent.vo.customerPurchaseVO;

public interface TaxAgentDAO {

	
	List<TaxCustomerVO> getCustomerListDao(String taxAgentId);

	TaxCustomerVO getCustomerInfoDao(String bNo);
	
	List<customerPurchaseVO> getReceiptKindSumList(String bNo);
	
	customerPurchaseVO getPusrchaseSum(String bNo);
	
	List<customerPurchaseVO> getPurchaseList(String bNo);
	
	CustomerSalesVO getSalesSum(String bNo);
	
	TaxUserInfoVO	getTaxUserInfoDao(String bNo); 
	
	
	
}
