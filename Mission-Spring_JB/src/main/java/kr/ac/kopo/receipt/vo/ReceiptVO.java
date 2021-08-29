package kr.ac.kopo.receipt.vo;

public class ReceiptVO {
	
	int receiptNo;
	String receiptCode; // 영수증 분류코드
	String supplierBusinessNo; // 공급자 사업자 번호
	String store_name;
	String receiptDate; // 영수일시
	String regDate; // 등록일시
	int amount; // 영수금액
	int vat; // 부가세
	String overlap; // 중복 여부
	String receiptStatus; // 처리완료, 처리대기, 반려
	String purpose;
	String memo;
	String business_no;
	
	public int getReceiptNo() {
		return receiptNo;
	}
	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}
	public String getReceiptCode() {
		return receiptCode;
	}
	public void setReceiptCode(String receiptCode) {
		this.receiptCode = receiptCode;
	}
	public String getSupplierBusinessNo() {
		return supplierBusinessNo;
	}
	public void setSupplierBusinessNo(String supplierBusinessNo) {
		this.supplierBusinessNo = supplierBusinessNo;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	
	@Override
	public String toString() {
		return "ReceiptVO [receiptNo=" + receiptNo + ", receiptCode=" + receiptCode + ", supplierBusinessNo="
				+ supplierBusinessNo + ", store_name=" + store_name + ", receiptDate=" + receiptDate + ", regDate="
				+ regDate + ", amount=" + amount + ", vat=" + vat + ", overlap=" + overlap + ", receiptStatus="
				+ receiptStatus + ", purpose=" + purpose + ", memo=" + memo + ", business_no=" + business_no + "]";
	}
	
	
	
	
	
}
