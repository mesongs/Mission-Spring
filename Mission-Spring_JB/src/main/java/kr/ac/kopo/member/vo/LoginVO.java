package kr.ac.kopo.member.vo;

public class LoginVO {

	private String id;
	private String password;
	private String businessNo;
	private String storeName;
	private String name;
	private String phone;
	private String email; // 자신의 email
	private String taxAgentEmail; // 세무대리인 email
	private String bankingAgreement;
	private String homtaxAgreement;
	private String userStatus; // role 구분
	

	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
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
	public String getTaxAgentEmail() {
		return taxAgentEmail;
	}
	public void setTaxAgentEmail(String taxAgentEmail) {
		this.taxAgentEmail = taxAgentEmail;
	}
	public String getBankingAgreement() {
		return bankingAgreement;
	}
	public void setBankingAgreement(String bankingAgreement) {
		this.bankingAgreement = bankingAgreement;
	}
	public String getHomtaxAgreement() {
		return homtaxAgreement;
	}
	public void setHomtaxAgreement(String homtaxAgreement) {
		this.homtaxAgreement = homtaxAgreement;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + ", businessNo=" + businessNo + ", storeName="
				+ storeName + ", name=" + name + ", phone=" + phone + ", email=" + email + ", taxAgentEmail="
				+ taxAgentEmail + ", bankingAgreement=" + bankingAgreement + ", homtaxAgreement=" + homtaxAgreement
				+ ", userStatus=" + userStatus + "]";
	}
	
	
	
}
