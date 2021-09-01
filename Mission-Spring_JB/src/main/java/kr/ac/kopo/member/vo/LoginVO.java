package kr.ac.kopo.member.vo;

public class LoginVO {
	
	// session에 등록할 회원의 정보 추가해야함
	// select할 때, 가져와야하는 data
	private String id;
	private String password;
	

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
	
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + "]";
	}

	
	
}
