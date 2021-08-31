package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {
	
	LoginVO login(LoginVO login);
	
	String idCheck(String inputId);
	
	void signUpMember(MemberVO member);
	
	void signUpBusiness(MemberVO member);
}
