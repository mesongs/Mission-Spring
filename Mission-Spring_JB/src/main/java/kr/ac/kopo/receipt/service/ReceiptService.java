package kr.ac.kopo.receipt.service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;

public interface ReceiptService {

	ReceiptFileVO uploadImgFile(MultipartHttpServletRequest multipartRequest);
	
}
