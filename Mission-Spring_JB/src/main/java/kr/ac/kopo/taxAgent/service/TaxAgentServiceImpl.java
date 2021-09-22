package kr.ac.kopo.taxAgent.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.ac.kopo.taxAgent.dao.TaxAgentDAO;
import kr.ac.kopo.taxAgent.vo.CustomerSalesVO;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxUserInfoVO;
import kr.ac.kopo.taxAgent.vo.customerPurchaseVO;

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

	// 세무사의 고객 증빙자료 조회(매입)
	@Override
	public HashMap<String, Object> getCustomerPurchase(String bNo) {
		
		
		HashMap<String, Object> map = new HashMap<>();
		
		// 발급유형별 합계금액
		List<customerPurchaseVO> receiptKindSumList = taxAgentDAO.getReceiptKindSumList(bNo);
		customerPurchaseVO pusrchaseSumVO = taxAgentDAO.getPusrchaseSum(bNo);
		List<customerPurchaseVO> getPurchaseList = taxAgentDAO.getPurchaseList(bNo);
		CustomerSalesVO salesSumVO = taxAgentDAO.getSalesSum(bNo);
		
		map.put("receiptKindSumList", receiptKindSumList);
		map.put("pusrchaseSumVO", pusrchaseSumVO);
		map.put("getPurchaseList", getPurchaseList);
		map.put("salesSumVO", salesSumVO);
		
		return map;
	}

	// 신고서 작성에 필요한 user data
	@Override
	public TaxUserInfoVO getTaxUserInfoService(String bNo) {
		
		
		TaxUserInfoVO taxUserInfo = taxAgentDAO.getTaxUserInfoDao(bNo);
		
		return taxUserInfo;
		
	}

	
	
	

	
	
	
	
	
}
