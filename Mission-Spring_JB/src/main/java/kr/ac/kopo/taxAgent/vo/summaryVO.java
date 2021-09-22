package kr.ac.kopo.taxAgent.vo;

public class summaryVO {
	
	//매출 합계 (카드 매출만 있음)
	//매입 합계
	// 카드영수증	세금계산서	간이영수증	계산서	현금영수증 매입
	
	private int salesSum;
	
	private int purchaseSum;
	private int cardPurchase;
	private int taxBillPurchase;
	private int taxPurchase;
	private int cashPurchase;
	private int simplePurchase;
	
	private String storeName;
	private String bNo;
	
	
	
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getbNo() {
		return bNo;
	}
	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	public int getSalesSum() {
		return salesSum;
	}
	public void setSalesSum(int salesSum) {
		this.salesSum = salesSum;
	}
	public int getPurchaseSum() {
		return purchaseSum;
	}
	public void setPurchaseSum(int purchaseSum) {
		this.purchaseSum = purchaseSum;
	}
	public int getCardPurchase() {
		return cardPurchase;
	}
	public void setCardPurchase(int cardPurchase) {
		this.cardPurchase = cardPurchase;
	}
	public int getTaxBillPurchase() {
		return taxBillPurchase;
	}
	public void setTaxBillPurchase(int taxBillPurchase) {
		this.taxBillPurchase = taxBillPurchase;
	}
	public int getTaxPurchase() {
		return taxPurchase;
	}
	public void setTaxPurchase(int taxPurchase) {
		this.taxPurchase = taxPurchase;
	}
	public int getCashPurchase() {
		return cashPurchase;
	}
	public void setCashPurchase(int cashPurchase) {
		this.cashPurchase = cashPurchase;
	}
	public int getSimplePurchase() {
		return simplePurchase;
	}
	public void setSimplePurchase(int simplePurchase) {
		this.simplePurchase = simplePurchase;
	}
	@Override
	public String toString() {
		return "summaryVO [salesSum=" + salesSum + ", purchaseSum=" + purchaseSum + ", cardPurchase=" + cardPurchase
				+ ", taxBillPurchase=" + taxBillPurchase + ", taxPurchase=" + taxPurchase + ", cashPurchase="
				+ cashPurchase + ", simplePurchase=" + simplePurchase + ", storeName=" + storeName + ", bNo=" + bNo
				+ "]";
	}

	
	
	
}
