package kr.ac.kopo.taxAgent.vo;

public class TaxCustomerVO {
	
	private String userId;
	private String name;
	private String phone;
	private String email;
	private String businessNo;
	private String storeName;
	private String openDate;
	private String zipCode;
	private String addrRoad;
	private String addrJibun;
	private String addrDetail;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddrRoad() {
		return addrRoad;
	}
	public void setAddrRoad(String addrRoad) {
		this.addrRoad = addrRoad;
	}
	public String getAddrJibun() {
		return addrJibun;
	}
	public void setAddrJibun(String addrJibun) {
		this.addrJibun = addrJibun;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	
	@Override
	public String toString() {
		return "TaxCustomerVO [userId=" + userId + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", businessNo=" + businessNo + ", storeName=" + storeName + ", openDate=" + openDate + ", zipCode="
				+ zipCode + ", addrRoad=" + addrRoad + ", addrJibun=" + addrJibun + ", addrDetail=" + addrDetail + "]";
	}
	
	
	
	
	
	
}
