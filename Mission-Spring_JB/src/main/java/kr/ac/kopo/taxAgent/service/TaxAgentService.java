package kr.ac.kopo.taxAgent.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.taxAgent.vo.TaxBillVO;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxUserInfoVO;
import kr.ac.kopo.taxAgent.vo.customerPurchaseVO;

public interface TaxAgentService {

	List<TaxCustomerVO> getCustomerListService(String taxAgentId);
	
	TaxCustomerVO getCustomerInfoService(String bNo);

	HashMap<String, Object> getCustomerPurchase(String bNo);
	
	TaxUserInfoVO getTaxUserInfoService(String bNo);
	
	HashMap<String, Object> getCustomerPurchaseListService(HashMap<String, String> map);
	
	HashMap<String, Object> getCustomerSalesListService(HashMap<String, String> map);
	
	List<TaxBillVO> getHrTaxBillList(HashMap<String, String> map);
	
	TaxBillVO taxbillCountSum(HashMap<String, String> map);
	
	TaxBillVO digitalTaxBillCountSum(HashMap<String, String> map);
	
}