package kr.ac.kopo.taxAgent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.receipt.dao.ReceiptDAO;
import kr.ac.kopo.taxAgent.dao.TaxAgentDAO;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;

@Service
public class TaxAgentServiceImpl implements TaxAgentService {
	
	@Autowired
	private TaxAgentDAO taxAgentDAO;

	@Override
	public List<TaxCustomerVO> getCustomerListService(String taxAgentId) {
		
		List<TaxCustomerVO> getCustomerList = taxAgentDAO.getCustomerListDao(taxAgentId);
		
		return getCustomerList;
	}

	@Override
	public TaxCustomerVO getCustomerInfoService(String bNo) {
		
		TaxCustomerVO taxCustomer = taxAgentDAO.getCustomerInfoDao(bNo);
		
		return taxCustomer;
	}

	
	
	
	
}
