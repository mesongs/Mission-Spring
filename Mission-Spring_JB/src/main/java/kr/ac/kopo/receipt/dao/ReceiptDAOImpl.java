package kr.ac.kopo.receipt.dao;

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
	private ReceiptDAO receiptDAO;

	@Override
	public ReceiptFileVO uploadImgFile(MultipartHttpServletRequest multipartRequest) {
		
		// 이거 테스트를 위해서 적어놓은건데, 사용안했음
		ReceiptFileVO vo = new ReceiptFileVO();
		
		return vo;
	}
	
	// 서버에 저장된 이미지 파일의 정보를 DB에 저장
//	@Override
//	public void insertImgData(ReceiptFileVO receiptFile) {
//		
//		
//		
//		
//		
//	}
	
	
	
	

}
