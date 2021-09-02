package kr.ac.kopo.receipt.dao;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;

public interface ReceiptDAO {
	
	void receiptRegister(ReceiptVO ReceiptVO);
	
	void receiptFileRegister(ReceiptVO ReceiptVO);
	
	int getReceiptNo();
	
}