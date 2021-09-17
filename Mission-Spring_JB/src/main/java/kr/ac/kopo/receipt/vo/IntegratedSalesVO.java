package kr.ac.kopo.receipt.vo;

import java.util.Arrays;

public class IntegratedSalesVO {

	private String receiptCode;
	private String supplierStoreName;
	private int amount;
	private int vat;
	private int calSum;
	private String receiptDate;
	private String supplierBusinessNo;
	private String division;
	
	private String amountValue; // 공급가액 합계
	private String vatValue; // 부가세 합계
	
	private String businessNo;
	private String[] sendArray;
	private String purchaseDate;
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
	public int getCalSum() {
		return calSum;
	}
	public void setCalSum(int calSum) {
		this.calSum = calSum;
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
	public String getAmountValue() {
		return amountValue;
	}
	public void setAmountValue(String amountValue) {
		this.amountValue = amountValue;
	}
	public String getVatValue() {
		return vatValue;
	}
	public void setVatValue(String vatValue) {
		this.vatValue = vatValue;
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
	@Override
	public String toString() {
		return "IntegratedSalesVO [receiptCode=" + receiptCode + ", supplierStoreName=" + supplierStoreName
				+ ", amount=" + amount + ", vat=" + vat + ", calSum=" + calSum + ", receiptDate=" + receiptDate
				+ ", supplierBusinessNo=" + supplierBusinessNo + ", division=" + division + ", amountValue="
				+ amountValue + ", vatValue=" + vatValue + ", businessNo=" + businessNo + ", sendArray="
				+ Arrays.toString(sendArray) + ", purchaseDate=" + purchaseDate + "]";
	}
	
	
	
	
	
	
	
	
}
