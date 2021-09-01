package kr.ac.kopo.receipt.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.receipt.vo.ReceiptVO;

public class ReceiptServiceImpl implements ReceiptService {
	
	@Autowired
	private 
	
	@Override
	public ReceiptVO uploadImgFile(MultipartFile mFile) {
		
		ReceiptVO receiptVO = new ReceiptVO();
		String filePath = "C:\\Lecture\\spring-workspace\\newUpload\\";
//		String filePath = "/var/www/html/img/";
	
		String oriFileName = mFile.getOriginalFilename();
		
		System.out.println("서비스에서 반은 원본 파일 : " + oriFileName);
		
		return receiptVO;
		
	}
}
