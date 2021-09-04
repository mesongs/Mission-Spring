package kr.ac.kopo.receipt.vo;

public class ReceiptVO {
	
	private int receiptNo; 
	private String regDate; // 등록일시(sysdate)
	private String receiptKind; // 영수증 분류코드
	private String overlap; // 중복 여부
	private String receiptStatus; // 처리완료, 처리대기, 반려
	private String storeName;
	private String supplierBusinessNo; // 공급자 사업자 번호
	private String businessNo; // 자신의 사업장번호
	private String receiptDate; // 영수일시
	private int amount; // 영수금액
	private int vat; // 부가세
	private int sum; // ocr로 추출한 합계
	private String purpose;
	private String memo;
	private String receiptName; //가져올 때, 영수증명으로 가져옴
	private String receiptCode; //세부사항 가져올 때, 코드로 가져오기
	// 파일 경로 저장
	private String filePath;
	private long fileSize;
	private String fileOriginalName;
	private String fileSaveName;
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
	public String getOverlap() {
		return overlap;
	}
	public void setOverlap(String overlap) {
		this.overlap = overlap;
	}
	public String getReceiptStatus() {
		return receiptStatus;
	}
	public void setReceiptStatus(String receiptStatus) {
		this.receiptStatus = receiptStatus;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
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
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public String getFileSaveName() {
		return fileSaveName;
	}
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	
	@Override
	public String toString() {
		return "ReceiptVO [receiptNo=" + receiptNo + ", regDate=" + regDate + ", receiptKind=" + receiptKind
				+ ", overlap=" + overlap + ", receiptStatus=" + receiptStatus + ", storeName=" + storeName
				+ ", supplierBusinessNo=" + supplierBusinessNo + ", businessNo=" + businessNo + ", receiptDate="
				+ receiptDate + ", amount=" + amount + ", vat=" + vat + ", sum=" + sum + ", purpose=" + purpose
				+ ", memo=" + memo + ", receiptName=" + receiptName + ", receiptCode=" + receiptCode + ", filePath="
				+ filePath + ", fileSize=" + fileSize + ", fileOriginalName=" + fileOriginalName + ", fileSaveName="
				+ fileSaveName + "]";
	}
	
	
	
}
