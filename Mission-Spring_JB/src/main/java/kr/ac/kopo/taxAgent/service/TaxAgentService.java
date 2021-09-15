package kr.ac.kopo.taxAgent.service;

import java.util.List;

import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;

public interface TaxAgentService {

	List<TaxCustomerVO> getCustomerListService(String taxAgentId);
	
	TaxCustomerVO getCustomerInfoService(String bNo);
	
}