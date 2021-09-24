package kr.ac.kopo.taxAgent.dao;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.taxAgent.vo.CustomerSalesVO;
import kr.ac.kopo.taxAgent.vo.TaxBillVO;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxUserInfoVO;
import kr.ac.kopo.taxAgent.vo.customerPurchaseVO;

public interface TaxAgentDAO {

	
	List<TaxCustomerVO> getCustomerListDao(String taxAgentId);

	TaxCustomerVO getCustomerInfoDao(String bNo);
	
//	List<customerPurchaseVO> getReceiptKindSumList(String bNo);
	
	customerPurchaseVO getPusrchaseSum(String bNo);
	
	List<customerPurchaseVO> getPurchaseList(String bNo);
	
	CustomerSalesVO getSalesSum(String bNo);
	
	TaxUserInfoVO getTaxUserInfoDao(String bNo); 
	
	List<customerPurchaseVO> getCustomerPurchaseListDao(HashMap<String, String> map);
	
	customerPurchaseVO getPusrchasePerSum(HashMap<String, String> map);
	
	List<customerPurchaseVO> getReceiptKindSumList(HashMap<String, String> map);
	
	List<CustomerSalesVO> getCustomerSalesListDao(HashMap<String, String> map);
	
	CustomerSalesVO getSalesPerSum(HashMap<String, String> map);
	
	List<TaxBillVO> getHrTaxBillList(HashMap<String, String> map);
	
	TaxBillVO geHrTaxBillCountSum(HashMap<String, String> map);
	
	TaxBillVO getDigitalTaxBillCountSum(HashMap<String, String> map);
	
	int getTotalRecord(HashMap<String, String> map);
	
	
	
}
