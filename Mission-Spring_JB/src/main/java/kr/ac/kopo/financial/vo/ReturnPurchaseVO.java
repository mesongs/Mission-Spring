package kr.ac.kopo.financial.vo;

public class ReturnPurchaseVO {

	private String receiptName;
	private int recentWeekSum;
	private int count;
	private int sum;
	private String receiptDate;
	private int recentMonthSum;
	private String deduction;  
	private String storeName;
	private String weekPurchaseCount;
	private String twoWeekSum;
	private String twoWeekPurchaseCount; 
	
	public String getWeekPurchaseCount() {
		return weekPurchaseCount;
	}
	public void setWeekPurchaseCount(String weekPurchaseCount) {
		this.weekPurchaseCount = weekPurchaseCount;
	}
	public String getTwoWeekSum() {
		return twoWeekSum;
	}
	public void setTwoWeekSum(String twoWeekSum) {
		this.twoWeekSum = twoWeekSum;
	}
	public String getTwoWeekPurchaseCount() {
		return twoWeekPurchaseCount;
	}
	public void setTwoWeekPurchaseCount(String twoWeekPurchaseCount) {
		this.twoWeekPurchaseCount = twoWeekPurchaseCount;
	}
	public String getDeduction() {
		return deduction;
	}
	public void setDeduction(String deduction) {
		this.deduction = deduction;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getRecentMonthSum() {
		return recentMonthSum;
	}
	public void setRecentMonthSum(int recentMonthSum) {
		this.recentMonthSum = recentMonthSum;
	}
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getReceiptName() {
		return receiptName;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public void setReceiptName(String receiptName) {
		this.receiptName = receiptName;
	}
	public int getRecentWeekSum() {
		return recentWeekSum;
	}
	public void setRecentWeekSum(int recentWeekSum) {
		this.recentWeekSum = recentWeekSum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "ReturnPurchaseVO [receiptName=" + receiptName + ", recentWeekSum=" + recentWeekSum + ", count=" + count
				+ "]";
	}
	
	
	
}
