package kr.ac.kopo.receipt.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
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
}