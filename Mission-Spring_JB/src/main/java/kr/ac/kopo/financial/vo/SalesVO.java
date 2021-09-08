package kr.ac.kopo.financial.vo;

public class SalesVO {
	
	// 여신금융협회 api요청 VO
	private String businessNo;
	private String dealDate;
	private String dealTime;
	private String approvalNo; 
	private String cardName;
	private String cardNumber;
	private int approvalAmount;
	private String installmentPeriod;
	
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
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
	public String getApprovalNo() {
		return approvalNo;
	}
	public void setApprovalNo(String approvalNo) {
		this.approvalNo = approvalNo;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public int getApprovalAmount() {
		return approvalAmount;
	}
	public void setApprovalAmount(int approvalAmount) {
		this.approvalAmount = approvalAmount;
	}
	public String getInstallmentPeriod() {
		return installmentPeriod;
	}
	public void setInstallmentPeriod(String installmentPeriod) {
		this.installmentPeriod = installmentPeriod;
	}
	
	@Override
	public String toString() {
		return "salesVO [businessNo=" + businessNo + ", dealDate=" + dealDate + ", dealTime=" + dealTime
				+ ", approvalNo=" + approvalNo + ", cardName=" + cardName + ", cardNumber=" + cardNumber
				+ ", approvalAmount=" + approvalAmount + ", installmentPeriod=" + installmentPeriod + "]";
	}
	
	
	
}