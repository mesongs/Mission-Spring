package kr.ac.kopo.receipt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.receipt.vo.AcceptRejectVO;
import kr.ac.kopo.receipt.vo.HomeTaxCashVO;
import kr.ac.kopo.receipt.vo.IntegratedSalesVO;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.receipt.vo.RejectReceiptVO;
import kr.ac.kopo.receipt.vo.searchDateVO;

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
	
	// 처리 대기 검색 결과
	@Override
	public List<ReceiptVO> searchWaitList(String searchWord) {
			
		List<ReceiptVO> searchWaitList = sqlSessionTemplate.selectList("receipt.receiptDAO.getSeachWaitLst", searchWord);
			
		return searchWaitList;
	}

	@Override
	public List<ReceiptVO> waitAllList() {
		List<ReceiptVO> waitAllList = sqlSessionTemplate.selectList("receipt.receiptDAO.waitAllList");
		return waitAllList;
	}

	@Override
	public List<ReceiptVO> getProcessedList() {
		
		List<ReceiptVO> processedAllList = sqlSessionTemplate.selectList("receipt.receiptDAO.processedAllList");
		
		return processedAllList;
	}

	@Override
	public List<ReceiptVO> getSearchProcessedList(String searchWord) {

		List<ReceiptVO> processedAllList = sqlSessionTemplate.selectList("receipt.receiptDAO.getSeachProcessedList", searchWord);
		
		return processedAllList;
	}

	@Override
	public List<ReceiptVO> getSearchDateList(searchDateVO date) {
		
		List<ReceiptVO> searchDateList = sqlSessionTemplate.selectList("receipt.receiptDAO.getSeachDateList", date);
		
		return searchDateList;
	}

	@Override
	public List<ReceiptVO> searchReceiptKind(String receiptKind) {
		
		List<ReceiptVO> searchReceiptKindList = sqlSessionTemplate.selectList("receipt.receiptDAO.getReceiptKindList", receiptKind);
		
		return searchReceiptKindList;
	}

	@Override
	public List<ReceiptVO> getPerReceiptList(int perReceipt) {
		
		List<ReceiptVO> perReceiptList = sqlSessionTemplate.selectList("receipt.receiptDAO.getPerReceiptList", perReceipt);
		
		return perReceiptList;
	}

	@Override
	public ReceiptVO getReceiptDetail(int receiptNo) {
		
		ReceiptVO receipt = sqlSessionTemplate.selectOne("receipt.receiptDAO.getReceiptDetail", receiptNo);
		
		return receipt;
	}

	@Override
	public List<ReceiptVO> getDaoMgWaitList() {
		
		List<ReceiptVO> mgWaitReceiptList = sqlSessionTemplate.selectList("receipt.receiptDAO.getMgReceiptList");
		return mgWaitReceiptList;
	}

	@Override
	public ReceiptVO mgDetailDao(int receiptNo) {
		
		ReceiptVO receipt = sqlSessionTemplate.selectOne("receipt.receiptDAO.getMgReceiptDetail", receiptNo);
		return receipt;
	}

	@Override
	public List<ReceiptVO> getMgReceiptDao(int perReceipt) {
		
		List<ReceiptVO> perMgReceiptList  = sqlSessionTemplate.selectList("receipt.receiptDAO.getPerMgReceiptList", perReceipt);
		return perMgReceiptList;
	}

	@Override
	public int acceptDao(AcceptRejectVO acceptReject) {
		
		int cnt = sqlSessionTemplate.update("receipt.receiptDAO.acceptUpdate", acceptReject);
		return cnt;
		
	}

	@Override
	public int rejectDao(AcceptRejectVO acceptReject) {
		
		int cnt = sqlSessionTemplate.update("receipt.receiptDAO.rejectUpdate", acceptReject);
		return cnt;
	}

	@Override
	public List<RejectReceiptVO> rejectReceiptDao() {
		
		List<RejectReceiptVO> rejectReceiptList = sqlSessionTemplate.selectList("receipt.receiptDAO.rejectReceiptList");
		
		return rejectReceiptList;
	}

	@Override
	public RejectReceiptVO rejectReceiptDetailDao(int receiptNo) {
		RejectReceiptVO rejectReceipt = sqlSessionTemplate.selectOne("receipt.receiptDAO.rejectReceiptDetail", receiptNo);
		return rejectReceipt;
	}

	@Override
	public int reRegisterRejectDao(RejectReceiptVO rejectReceipt) {
		
		int cnt = sqlSessionTemplate.update("receipt.receiptDAO.reRegisterReject", rejectReceipt);
		
		return cnt;
	}

	@Override
	public List<IntegratedSalesVO> getIntegratedListDao(IntegratedSalesVO integratedSalesVO) {
		
		List<IntegratedSalesVO> getIntegratedList = sqlSessionTemplate.selectList("receipt.receiptDAO.getIntegratedList", integratedSalesVO);
		
		return getIntegratedList;
	}
	
	
	
	

}
