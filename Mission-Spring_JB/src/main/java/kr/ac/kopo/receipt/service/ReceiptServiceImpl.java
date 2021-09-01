package kr.ac.kopo.receipt.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.dao.ReceiptDAO;
import kr.ac.kopo.receipt.vo.ReceiptVO;

public class ReceiptServiceImpl implements ReceiptService {
	
	@Autowired
	private ReceiptDAO receiptDAO;
	
	@Override
	public ReceiptVO uploadImgFile(MultipartHttpServletRequest multipartRequest) {
		
		ReceiptVO receiptVO = new ReceiptVO();
		String filePath = "C:\\Lecture\\spring-workspace\\newUpload\\";
		
		Iterator<String> iter = multipartRequest.getFileNames();
		String formFileName = iter.next();
		System.out.println("바로 받아지는지 확인 :" + formFileName);
		
//		String filePath = "/var/www/html/img/";
	
//		String oriFileName = multipartRequest.getOriginalFilename();
		
//		System.out.println("서비스에서 반은 원본 파일 : " + oriFileName);
		
		return receiptVO;
		
	}
}
