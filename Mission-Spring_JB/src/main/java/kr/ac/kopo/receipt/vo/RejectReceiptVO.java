package kr.ac.kopo.receipt.vo;

public class RejectReceiptVO {
	
	private int receiptNo; 
	private String regDate; // 등록일시(sysdate)
	private String receiptKind; // 영수증 분류코드
	private String storeName;
	private int amount; // 영수금액
	private int vat; // 부가세
	private int sum; // ocr로 추출한 합계
	private String purpose;
	private String rejectReason;
	private String receiptStatus; // 처리완료, 처리대기, 반려
	private String supplierBusinessNo; // 공급자 사업자 번호
	private String businessNo; // 자신의 사업장번호
	private String receiptDate; // 영수일시
	private String userId;
	private String memo;
	private String receiptName; //가져올 때, 영수증명으로 가져옴
	private String receiptCode; //세부사항 가져올 때, 코드로 가져오기
	private String overlap;
	// 파일 경로 저장
	private String fileSaveName;
	private String filePath;
	
	
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getOverlap() {
		return overlap;
	}
	public void setOverlap(String overlap) {
		this.overlap = overlap;
	}
	public int getReceiptNo() {
		return receiptNo;
	}
	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getReceiptKind() {
		return receiptKind;
	}
	public void setReceiptKind(String receiptKind) {
		this.receiptKind = receiptKind;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getVat() {
		return vat;
	}
	public void setVat(int vat) {
		this.vat = vat;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public String getReceiptStatus() {
		return receiptStatus;
	}
	public void setReceiptStatus(String receiptStatus) {
		this.receiptStatus = receiptStatus;
	}
	public String getSupplierBusinessNo() {
		return supplierBusinessNo;
	}
	public void setSupplierBusinessNo(String supplierBusinessNo) {
		this.supplierBusinessNo = supplierBusinessNo;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getReceiptName() {
		return receiptName;
	}
	public void setReceiptName(String receiptName) {
		this.receiptName = receiptName;
	}
	public String getReceiptCode() {
		return receiptCode;
	}
	public void setReceiptCode(String receiptCode) {
		this.receiptCode = receiptCode;
	}
	public String getFileSaveName() {
		return fileSaveName;
	}
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	@Override
	public String toString() {
		return "RejectReceiptVO [receiptNo=" + receiptNo + ", regDate=" + regDate + ", receiptKind=" + receiptKind
				+ ", storeName=" + storeName + ", amount=" + amount + ", vat=" + vat + ", sum=" + sum + ", purpose="
				+ purpose + ", rejectReason=" + rejectReason + ", receiptStatus=" + receiptStatus
				+ ", supplierBusinessNo=" + supplierBusinessNo + ", businessNo=" + businessNo + ", receiptDate="
				+ receiptDate + ", userId=" + userId + ", memo=" + memo + ", receiptName=" + receiptName
				+ ", receiptCode=" + receiptCode + ", overlap=" + overlap + ", fileSaveName=" + fileSaveName
				+ ", filePath=" + filePath + "]";
	}
	
	
	
	
	
	
}
