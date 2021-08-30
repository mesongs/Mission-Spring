package kr.ac.kopo.member.vo;

public class MemberVO {

	private String userId;
	private String user_password;
	private String name;
	private String type;
	private String phone;
	private String emailId;
	private int domain;
	private String frrn;
	private String brrn;
	private String taxAgentEmailId;
	private int taxAgentDomain;
	// 사업장_TB
	private String businessNo;
	private String zipcode;
	private String addrRoad;
	private String addrJibun;
	private String addrDetail;
	
	public String getUserId() {
		return userId;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
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
	public int getDomain() {
		return domain;
	}
	public void setDomain(int domain) {
		this.domain = domain;
	}
	public String getFrrn() {
		return frrn;
	}
	public void setFrrn(String frrn) {
		this.frrn = frrn;
	}
	public String getBrrn() {
		return brrn;
	}
	public void setBrrn(String brrn) {
		this.brrn = brrn;
	}
	public String getTaxAgentEmailId() {
		return taxAgentEmailId;
	}
	public void setTaxAgentEmailId(String taxAgentEmailId) {
		this.taxAgentEmailId = taxAgentEmailId;
	}
	public int getTaxAgentDomain() {
		return taxAgentDomain;
	}
	public void setTaxAgentDomain(int taxAgentDomain) {
		this.taxAgentDomain = taxAgentDomain;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", user_password=" + user_password + ", name=" + name + ", type=" + type
				+ ", phone=" + phone + ", emailId=" + emailId + ", domain=" + domain + ", frrn=" + frrn + ", brrn="
				+ brrn + ", taxAgentEmailId=" + taxAgentEmailId + ", taxAgentDomain=" + taxAgentDomain + ", businessNo="
				+ businessNo + ", zipcode=" + zipcode + ", addrRoad=" + addrRoad + ", addrJibun=" + addrJibun
				+ ", addrDetail=" + addrDetail + "]";
	}
	
}
