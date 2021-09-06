package kr.ac.kopo.member.vo;

public class MemberVO {
	
	//회원_TB
	private String userId;
	private String userPassword;
	private String name;
	private String type;
	private String phone;
	private String emailId;
	private String domain;
	private String fRrn;
	private String bRrn;
	private String taxAgentEmailId;
	private String taxAgentDomain;
	
	// 사업장_TB
	private String businessNo;
	private String storeName;
	private String zipCode;
	private String addrRoad;
	private String addrJibun;
	private String addrDetail;
	private String openDate;
	
	
	
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getfRrn() {
		return fRrn;
	}
	public void setfRrn(String fRrn) {
		this.fRrn = fRrn;
	}
	public String getbRrn() {
		return bRrn;
	}
	public void setbRrn(String bRrn) {
		this.bRrn = bRrn;
	}
	public String getTaxAgentEmailId() {
		return taxAgentEmailId;
	}
	public void setTaxAgentEmailId(String taxAgentEmailId) {
		this.taxAgentEmailId = taxAgentEmailId;
	}
	public String getTaxAgentDomain() {
		return taxAgentDomain;
	}
	public void setTaxAgentDomain(String taxAgentDomain) {
		this.taxAgentDomain = taxAgentDomain;
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
		return "MemberVO [userId=" + userId + ", userPassword=" + userPassword + ", name=" + name + ", type=" + type
				+ ", phone=" + phone + ", emailId=" + emailId + ", domain=" + domain + ", fRrn=" + fRrn + ", bRrn="
				+ bRrn + ", taxAgentEmailId=" + taxAgentEmailId + ", taxAgentDomain=" + taxAgentDomain + ", businessNo="
				+ businessNo + ", storeName=" + storeName + ", zipCode=" + zipCode + ", addrRoad=" + addrRoad
				+ ", addrJibun=" + addrJibun + ", addrDetail=" + addrDetail + ", openDate=" + openDate + "]";
	}
	
	
}
