package kr.ac.kopo.receipt.vo;

public class HomeTaxCashVO {
	
	
	 private String cashApprovalNo;
	 private String purchaseDate;
	 private String businessNo;
	 private String supplierBusinessNo;
	 private String supplierStoreName;
	 private String purchaseTime;
	 private String storeKind;
	 private String section;
	 private String deduction;
	 private int amount;
	 private int vat;
	 private int sum;
	 
	public String getCashApprovalNo() {
		return cashApprovalNo;
	}
	public void setCashApprovalNo(String cashApprovalNo) {
		this.cashApprovalNo = cashApprovalNo;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
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
	public String getPurchaseTime() {
		return purchaseTime;
	}
	public void setPurchaseTime(String purchaseTime) {
		this.purchaseTime = purchaseTime;
	}
	public String getStoreKind() {
		return storeKind;
	}
	public void setStoreKind(String storeKind) {
		this.storeKind = storeKind;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getDeduction() {
		return deduction;
	}
	public void setDeduction(String deduction) {
		this.deduction = deduction;
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
		return "HomeTaxCashVO [cashApprovalNo=" + cashApprovalNo + ", purchaseDate=" + purchaseDate + ", businessNo="
				+ businessNo + ", supplierBusinessNo=" + supplierBusinessNo + ", supplierStoreName=" + supplierStoreName
				+ ", purchaseTime=" + purchaseTime + ", storeKind=" + storeKind + ", section=" + section
				+ ", deduction=" + deduction + ", amount=" + amount + ", vat=" + vat + ", sum=" + sum + "]";
	}
	 
}
