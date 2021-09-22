package kr.ac.kopo.taxAgent.vo;

public class customerPurchaseVO {
	
	// 고객 통합 매입 조회
	// 기간에 따른, 발급 유형별 조회
	
	private String receiptCode;
	private String storeName;
	private int amount;				
	private int vat;
	private int calSum;
	private String receiptDate;
	private String supplierBusinessNo;
	
	// 부가세 포함된 값 총 액
	private int purchaseSum;   
	
	private int purchaseAmountSum;
	private int purchaseVatSum;
	
	// 영수증별 구매 금액 
	private int receiptKindPurchase;

	
	
	

	public int getPurchaseAmountSum() {
		return purchaseAmountSum;
	}

	public void setPurchaseAmountSum(int purchaseAmountSum) {
		this.purchaseAmountSum = purchaseAmountSum;
	}

	public int getPurchaseVatSum() {
		return purchaseVatSum;
	}

	public void setPurchaseVatSum(int purchaseVatSum) {
		this.purchaseVatSum = purchaseVatSum;
	}

	public int getPurchaseSum() {
		return purchaseSum;
	}

	public void setPurchaseSum(int purchaseSum) {
		this.purchaseSum = purchaseSum;
	}

	public String getReceiptCode() {
		return receiptCode;
	}

	public void setReceiptCode(String receiptCode) {
		this.receiptCode = receiptCode;
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

	public int getReceiptKindPurchase() {
		return receiptKindPurchase;
	}

	public void setReceiptKindPurchase(int receiptKindPurchase) {
		this.receiptKindPurchase = receiptKindPurchase;
	}
	
	
	
	
	
	
}
