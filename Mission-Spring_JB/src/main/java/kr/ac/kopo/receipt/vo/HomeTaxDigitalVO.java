package kr.ac.kopo.receipt.vo;

public class HomeTaxDigitalVO {

	private String digitalApprovalNo;
	private String dealDate;
	private String issueDate;
	private String supplierBusinessNo;
	private String supplierStoreName;
	private String supplierName;
	private String storeKind;
	private String receiptKind;
	private String supplierEmail;
	private int amount;
	private int vat;
	private int sum;
	private String section;
	
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getDigitalApprovalNo() {
		return digitalApprovalNo;
	}
	public void setDigitalApprovalNo(String digitalApprovalNo) {
		this.digitalApprovalNo = digitalApprovalNo;
	}
	public String getDealDate() {
		return dealDate;
	}
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getSupplierBusinessNo() {
		return supplierBusinessNo;
	}
	public void setSupplierBusinessNo(String supplierBusinessNo) {
		this.supplierBusinessNo = supplierBusinessNo;
	}
	public String getSupplierStoreName() {
		return supplierStoreName;
	}
	public void setSupplierStoreName(String supplierStoreName) {
		this.supplierStoreName = supplierStoreName;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getStoreKind() {
		return storeKind;
	}
	public void setStoreKind(String storeKind) {
		this.storeKind = storeKind;
	}
	public String getReceiptKind() {
		return receiptKind;
	}
	public void setReceiptKind(String receiptKind) {
		this.receiptKind = receiptKind;
	}
	public String getSupplierEmail() {
		return supplierEmail;
	}
	public void setSupplierEmail(String supplierEmail) {
		this.supplierEmail = supplierEmail;
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
	
	@Override
	public String toString() {
		return "HomeTaxDigitalVO [digitalApprovalNo=" + digitalApprovalNo + ", dealDate=" + dealDate + ", issueDate="
				+ issueDate + ", supplierBusinessNo=" + supplierBusinessNo + ", supplierStoreName=" + supplierStoreName
				+ ", supplierName=" + supplierName + ", storeKind=" + storeKind + ", receiptKind=" + receiptKind
				+ ", supplierEmail=" + supplierEmail + ", amount=" + amount + ", vat=" + vat + ", sum=" + sum + "]";
	}
	
	
	
	
}
