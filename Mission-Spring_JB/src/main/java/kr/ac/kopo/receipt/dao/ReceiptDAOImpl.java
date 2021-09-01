package kr.ac.kopo.receipt.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.receipt.vo.ReceiptVO;

public class ReceiptDAOImpl implements ReceiptDAO {
	
	@Autowired
	private ReceiptDAO receiptDAO;
	
	@Override
	public ReceiptVO uploadImgFile(MultipartFile mFile) {
		// TODO Auto-generated method stub
		return null;
	}

}
