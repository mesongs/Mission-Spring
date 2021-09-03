package kr.ac.kopo.receipt.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.receipt.vo.searchDateVO;

public interface ReceiptService {

	ReceiptFileVO uploadImgFile(MultipartHttpServletRequest multipartRequest);
	
	void receiptResgister(ReceiptVO receipt);
	
	List<ReceiptVO> searchwaitList(String searchWord);
	
	List<ReceiptVO> waitAllList();
	
	List<ReceiptVO> getProcessedList();
	
	List<ReceiptVO> searchprocessedList(String searchWord);
	
	List<ReceiptVO> serachDate(searchDateVO searchDate);
	
	List<ReceiptVO> searchReceiptKind(String receiptKind);

	List<ReceiptVO> getPerReceiptList(int perReceipt);
}
