package kr.ac.kopo.taxAgent.vo;

public class CustomerSalesVO {

	// 매출 데이터 (현재 카드 매출 데이터만 집계)
	
	private int slaesSum;
	private int approvalNo;
	private String dealDate;
	private int amount;
	private int vat;
	private int calSum;
	private String salesKind; // 매출 유형
	
	// 부가세 포함된 값 총 액
	private int salesSum;
	private int salesAmountSum;
	private int salesVatSum;
	
	
	public int getSalesSum() {
		return salesSum;
	}
	public void setSalesSum(int salesSum) {
		this.salesSum = salesSum;
	}
	public int getSalesAmountSum() {
		return salesAmountSum;
	}
	public void setSalesAmountSum(int salesAmountSum) {
		this.salesAmountSum = salesAmountSum;
	}
	public int getSalesVatSum() {
		return salesVatSum;
	}
	public void setSalesVatSum(int salesVatSum) {
		this.salesVatSum = salesVatSum;
	}
	public int getSlaesSum() {
		return slaesSum;
	}
	public void setSlaesSum(int slaesSum) {
		this.slaesSum = slaesSum;
	}
	public int getApprovalNo() {
		return approvalNo;
	}
	public void setApprovalNo(int approvalNo) {
		this.approvalNo = approvalNo;
	}
	public String getDealDate() {
		return dealDate;
	}
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
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
	public String getSalesKind() {
		return salesKind;
	}
	public void setSalesKind(String salesKind) {
		this.salesKind = salesKind;
	}
	
	
	
}
