package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {
	
	LoginVO login(LoginVO login);
	
	LoginVO kakaoLogin(LoginVO login);
	
	String idCheck(String inputId);
	
	int emailCheck(String email);
	
	void signUp(MemberVO member);
	
}
