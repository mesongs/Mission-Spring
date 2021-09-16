package kr.ac.kopo.receipt.vo;

public class IntegratedSalesVO {

	private String receiptCode;
	private String supplierStoreName;
	private int amount;
	private int vat;
	private int calSum;
	private String receiptDate;
	private String supplierBusinessNo;
	private String division;
	
	private String businessNo;
	private String[] sendArray;
	private String purchaseDate;
	
	public int getCalSum() {
		return calSum;
	}
	public void setCalSum(int calSum) {
		this.calSum = calSum;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public String[] getSendArray() {
		return sendArray;
	}
	public void setSendArray(String[] sendArray) {
		this.sendArray = sendArray;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getReceiptCode() {
		return receiptCode;
	}
	public void setReceiptCode(String receiptCode) {
		this.receiptCode = receiptCode;
	}
	public String getSupplierStoreName() {
		return supplierStoreName;
	}
	public void setSupplierStoreName(String supplierStoreName) {
		this.supplierStoreName = supplierStoreName;
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
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getSupplierBusinessNo() {
		return supplierBusinessNo;
	}
	public void setSupplierBusinessNo(String supplierBusinessNo) {
		this.supplierBusinessNo = supplierBusinessNo;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	
	@Override
	public String toString() {
		return "IntegratedSalesVO [receiptCode=" + receiptCode + ", supplierStoreName=" + supplierStoreName
				+ ", amount=" + amount + ", vat=" + vat + ", receiptDate=" + receiptDate + ", supplierBusinessNo="
				+ supplierBusinessNo + ", division=" + division + "]";
	}
	
}
