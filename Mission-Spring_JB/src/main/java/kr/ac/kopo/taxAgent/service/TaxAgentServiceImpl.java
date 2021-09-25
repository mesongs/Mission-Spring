package kr.ac.kopo.taxAgent.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.ac.kopo.taxAgent.dao.TaxAgentDAO;
import kr.ac.kopo.taxAgent.vo.CustomerSalesVO;
import kr.ac.kopo.taxAgent.vo.TaxBillVO;
import kr.ac.kopo.taxAgent.vo.TaxCustomerVO;
import kr.ac.kopo.taxAgent.vo.TaxUserInfoVO;
import kr.ac.kopo.taxAgent.vo.customerPurchaseVO;
import kr.ac.kopo.util.Pagination;

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
//		List<customerPurchaseVO> receiptKindSumList = taxAgentDAO.getReceiptKindSumList(bNo);
		customerPurchaseVO pusrchaseSumVO = taxAgentDAO.getPusrchaseSum(bNo);
		List<customerPurchaseVO> getPurchaseList = taxAgentDAO.getPurchaseList(bNo);
		CustomerSalesVO salesSumVO = taxAgentDAO.getSalesSum(bNo);
		
//		map.put("receiptKindSumList", receiptKindSumList);
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
	
	// 통합 매입내역 조회 - ajax
	@Override
	public HashMap<String, Object> getCustomerPurchaseListService(HashMap<String, String> map) {
		
		// 총 개수 + 현재 페이지 구하기 => 레코드의 시작과 끝
		
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, Object> curPageMap = new HashMap<String, Object>();
		
		// 통합 매입내역 리스트 => pagination 적용
		List<customerPurchaseVO> purchaseList = taxAgentDAO.getCustomerPurchaseListDao(map);
		
		// 총 합계금액, 영수금액 합계, 부가세 합계
		customerPurchaseVO customerPurchaseVO = taxAgentDAO.getPusrchasePerSum(map);
		
		// 유형별 합계
		List<customerPurchaseVO> receiptKindSumList = taxAgentDAO.getReceiptKindSumList(map);
		
		// 통합 매입내역 총 레코드 개 수
		int totalPurchaseRow = taxAgentDAO.getPurchaseTotalRecord(map); 
		int curPage = (Integer.parseInt(map.get("curPage"))); 
		
		Pagination pagination = new Pagination(totalPurchaseRow, curPage);
		
//		System.out.println(pagination.toString());
		
		// curPage가 1인 경우와 아닌 경우. ajax가 서로 다름
		curPageMap.put("startRow", pagination.getStartRow());
		curPageMap.put("endRow", pagination.getEndRow());
		curPageMap.put("selectYear", map.get("selectYear")); 
		curPageMap.put("selectOrder", map.get("selectOrder")); 
		
		
		List<customerPurchaseVO> purchasePageRowList = taxAgentDAO.getpurchaseFirstPageList(curPageMap);
		
		// 처음 조회 눌렀을 때, 1page에 30개 record 보여줌
		returnMap.put("purchasePageRowList", purchasePageRowList);
		
		returnMap.put("startPage", pagination.getStartPage());
		returnMap.put("endPage", pagination.getEndPage());
		
		// 이것을 페이징으로 변경했음, 첫 페이지 30개
		returnMap.put("purchaseList", purchaseList);
		
		returnMap.put("customerPurchaseVO", customerPurchaseVO);
		returnMap.put("receiptKindSumList", receiptKindSumList);
		
		
		return returnMap;
	}
	
	@Override
	public HashMap<String, Object> getCustomerSalesListService(HashMap<String, String> map) {

		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, Object> curPageMap = new HashMap<String, Object>();
		// 통합 매출 리스트 (현재 카드 매출만 집계)
		List<CustomerSalesVO> salesList = taxAgentDAO.getCustomerSalesListDao(map);
		
		// 매출 공급가액, 부가세, 합계금액
		CustomerSalesVO customerSaelsVO = taxAgentDAO.getSalesPerSum(map);
		
		///////////////////////////////////////////////// ajax 페이징
		int totalRow = taxAgentDAO.getTotalRecord(map); 
		int curPage = (Integer.parseInt(map.get("curPage"))); 
		
		Pagination pagination = new Pagination(totalRow, curPage);
		
//		System.out.println(pagination.toString());
		
		// curPage가 1인 경우와 아닌 경우. ajax가 서로 다름
		curPageMap.put("startRow", pagination.getStartRow());
		curPageMap.put("endRow", pagination.getEndRow());
		curPageMap.put("selectYear", map.get("selectYear")); 
		curPageMap.put("selectOrder", map.get("selectOrder")); 
		
		List<CustomerSalesVO> pageRowList = taxAgentDAO.getFirstPageList(curPageMap);
		
		// 처음 조회 눌렀을 때, 1page에 30개 record 보여줌
		returnMap.put("pageRowList", pageRowList);
		returnMap.put("salesList", salesList);
		returnMap.put("customerSaelsVO", customerSaelsVO);
		
		
		
		return returnMap;
		
	}

	@Override
	public List<TaxBillVO> getHrTaxBillList(HashMap<String, String> map) {
		
		List<TaxBillVO> getHrtaxBillList = taxAgentDAO.getHrTaxBillList(map);
		
		return getHrtaxBillList;
	}

	@Override
	public TaxBillVO taxbillCountSum(HashMap<String, String> map) {
		
		TaxBillVO taxbillCountSum = taxAgentDAO.geHrTaxBillCountSum(map);
		
		return taxbillCountSum;
	}

	@Override
	public TaxBillVO digitalTaxBillCountSum(HashMap<String, String> map) {
		
		TaxBillVO digitalTaxbillCountSum = taxAgentDAO.getDigitalTaxBillCountSum(map);
		
		return digitalTaxbillCountSum;
	}
	
	
	
	
	
	
	
	
	
	
}
