package kr.ac.kopo.financial.vo;

public class SalesReportVO {
	
	// 사업장에서 발생한 카드 매출 데이터
	// sql로부터 얻어오는 resultSet VO
	// 서비스단에서 처리할 데이터(이전에 하려고 했던 방식)
	// 이거는 지워도 될 듯?
	private String dealDate;
	private String dealTime;
	private String byTime; // 시간대
	private String cardName;
	private int approvalAmount;
	private String visitedCount;
	private String customerKind;
	
	public int getApprovalAmount() {
		return approvalAmount;
	}
	public void setApprovalAmount(int approvalAmount) {
		this.approvalAmount = approvalAmount;
	}
	public String getDealDate() {
		return dealDate;
	}
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	public String getDealTime() {
		return dealTime;
	}
	public void setDealTime(String dealTime) {
		this.dealTime = dealTime;
	}
	public String getByTime() {
		return byTime;
	}
	public void setByTime(String byTime) {
		this.byTime = byTime;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getVisitedCount() {
		return visitedCount;
	}
	public void setVisitedCount(String visitedCount) {
		this.visitedCount = visitedCount;
	}
	public String getCustomerKind() {
		return customerKind;
	}
	public void setCustomerKind(String customerKind) {
		this.customerKind = customerKind;
	}
	@Override
	public String toString() {
		return "SalesReportVO [dealDate=" + dealDate + ", dealTime=" + dealTime + ", byTime=" + byTime + ", cardName="
				+ cardName + ", approvalAmount=" + approvalAmount + ", visitedCount=" + visitedCount + ", customerKind="
				+ customerKind + "]";
	}
	
	
	
}
