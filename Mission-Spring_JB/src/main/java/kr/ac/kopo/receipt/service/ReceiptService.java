package kr.ac.kopo.receipt.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.receipt.vo.AcceptRejectVO;
import kr.ac.kopo.receipt.vo.HomeTaxCardVO;
import kr.ac.kopo.receipt.vo.HomeTaxCashVO;
import kr.ac.kopo.receipt.vo.HomeTaxInfoVO;
import kr.ac.kopo.receipt.vo.IntegratedSalesVO;
import kr.ac.kopo.receipt.vo.ReceiptFileVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;
import kr.ac.kopo.receipt.vo.RejectReceiptVO;
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
	
	ReceiptVO receiptDetail(int receiptNo);
	
	List<ReceiptVO> getMgWaitList();
	
	ReceiptVO mgDetailService(int receiptNo);
	
	List<ReceiptVO> getMgReceiptService(int perReceipt);
	
	int acceptRejectService(AcceptRejectVO acceptReject);
	
	List<RejectReceiptVO> getRejectReceiptList();
	
	RejectReceiptVO rejectReceiptDetailService(int receiptNo);

	int reRegisterRejectService(RejectReceiptVO rejectReceipt);
	
	String homeTaxConnectService(HomeTaxInfoVO homeTaxInfo);
	
	List<HomeTaxCashVO> getHomeTaxCashInfoService(String purchaseDate, String businessNo);
	
	List<HomeTaxCardVO> getHomeTaxCardInfoService(String searchMonth, String businessNo);
	
	List<IntegratedSalesVO> getIntegratedList(IntegratedSalesVO integratedSalesVO);
	
	List<IntegratedSalesVO> getSearchListService(HashMap<String, Object> map);
	
}
