package kr.ac.kopo.receipt.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.vo.AcceptRejectVO;
import kr.ac.kopo.receipt.vo.HomeTaxCashVO;
import kr.ac.kopo.receipt.vo.IntegratedSalesVO;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.receipt.vo.RejectReceiptVO;
import kr.ac.kopo.receipt.vo.searchDateVO;

public interface ReceiptDAO {
	
	void receiptRegister(ReceiptVO ReceiptVO);
	
	void receiptFileRegister(ReceiptVO ReceiptVO);
	
	int getReceiptNo();
	
	List<ReceiptVO> searchWaitList(String searchWord);
	
	List<ReceiptVO> waitAllList();
	
	List<ReceiptVO> getProcessedList();
	
	List<ReceiptVO> getSearchProcessedList(String searchWord);
	
	List<ReceiptVO> getSearchDateList(searchDateVO date);
	
	List<ReceiptVO> searchReceiptKind(String receiptKind);
	
	List<ReceiptVO> getPerReceiptList(int perReceipt);
	
	ReceiptVO getReceiptDetail(int receiptNo);
	
	List<ReceiptVO> getDaoMgWaitList();
	
	ReceiptVO mgDetailDao(int receiptNo);
	
	List<ReceiptVO> getMgReceiptDao(int perReceipt);
	
	int acceptDao(AcceptRejectVO acceptReject);
	
	int rejectDao(AcceptRejectVO acceptReject);
	
	List<RejectReceiptVO> rejectReceiptDao();

	RejectReceiptVO rejectReceiptDetailDao(int receiptNo);
	
	int reRegisterRejectDao(RejectReceiptVO rejectReceipt);
	
	List<IntegratedSalesVO> getIntegratedListDao(IntegratedSalesVO integratedSalesVO);
	
	List<IntegratedSalesVO> getSearchedIntegratedListDao(HashMap<String, Object> map);
	
}