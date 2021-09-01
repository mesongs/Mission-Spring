package kr.ac.kopo.receipt.dao;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.receipt.vo.ReceiptVO;

public interface ReceiptDAO {
	
	ReceiptVO uploadImgFile(MultipartFile mFile);
	
}
