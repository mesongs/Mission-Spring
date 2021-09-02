package kr.ac.kopo.receipt.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;

public interface ReceiptService {

	ReceiptFileVO uploadImgFile(MultipartHttpServletRequest multipartRequest);
	
	void receiptResgister(ReceiptVO receipt);
	
}
