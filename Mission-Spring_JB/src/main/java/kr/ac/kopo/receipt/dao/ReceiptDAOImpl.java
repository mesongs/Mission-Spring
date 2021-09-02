package kr.ac.kopo.receipt.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;

@Repository
public class ReceiptDAOImpl implements ReceiptDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void receiptRegister(ReceiptVO ReceiptVO) {
		
		sqlSessionTemplate.insert("receipt.receiptDAO.receiptRegister", ReceiptVO);
		
	}
	 
	@Override
	public void receiptFileRegister(ReceiptVO ReceiptVO) {
		
		sqlSessionTemplate.insert("receipt.receiptDAO.receiptFileRegister", ReceiptVO);
		
	}

	@Override
	public int getReceiptNo() {
		
		// 영수증_TB, 영수증파일_TB의 PK
		int receiptNo = sqlSessionTemplate.selectOne("receipt.receiptDAO.getReceiptNo");
		
		return receiptNo;
	}
	
	

}
