package kr.ac.kopo.receipt.vo;

public class HomeTaxInfoVO {
	
	private String hometaxId;
	private String hometaxPassword;
	private String businessNo;
	public String getHometaxId() {
		return hometaxId;
	}
	public void setHometaxId(String hometaxId) {
		this.hometaxId = hometaxId;
	}
	public String getHometaxPassword() {
		return hometaxPassword;
	}
	public void setHometaxPassword(String hometaxPassword) {
		this.hometaxPassword = hometaxPassword;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	
	@Override
	public String toString() {
		return "HomeTaxInfoVO [hometaxId=" + hometaxId + ", hometaxPassword=" + hometaxPassword + ", businessNo="
				+ businessNo + "]";
	}
	
	
	
}
