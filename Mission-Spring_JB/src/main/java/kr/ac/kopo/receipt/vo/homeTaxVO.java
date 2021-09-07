package kr.ac.kopo.receipt.vo;

public class homeTaxVO {
	
	private String homeTaxId;
	private String homeTaxPassword;
	private String businessNo;
	public String getHomeTaxId() {
		return homeTaxId;
	}
	public void setHomeTaxId(String homeTaxId) {
		this.homeTaxId = homeTaxId;
	}
	public String getHomeTaxPassword() {
		return homeTaxPassword;
	}
	public void setHomeTaxPassword(String homeTaxPassword) {
		this.homeTaxPassword = homeTaxPassword;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	@Override
	public String toString() {
		return "homeTaxVO [homeTaxId=" + homeTaxId + ", homeTaxPassword=" + homeTaxPassword + ", businessNo="
				+ businessNo + "]";
	}
	
	
	
}
