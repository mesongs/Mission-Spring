package kr.ac.kopo.taxAgent.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxUserInfoVO;

public interface TaxAgentService {

	List<TaxCustomerVO> getCustomerListService(String taxAgentId);
	
	TaxCustomerVO getCustomerInfoService(String bNo);

	HashMap<String, Object> getCustomerPurchase(String bNo);
	
	TaxUserInfoVO getTaxUserInfoService(String bNo);
}