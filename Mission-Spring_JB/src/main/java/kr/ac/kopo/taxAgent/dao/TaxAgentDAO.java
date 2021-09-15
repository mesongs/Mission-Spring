package kr.ac.kopo.taxAgent.dao;

import java.util.List;

import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;

public interface TaxAgentDAO {

	
	List<TaxCustomerVO> getCustomerListDao(String taxAgentId);

	TaxCustomerVO getCustomerInfoDao(String bNo);
}
