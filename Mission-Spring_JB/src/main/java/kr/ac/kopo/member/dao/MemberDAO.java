package kr.ac.kopo.member.dao;

import java.util.List;

import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.receipt.vo.ReceiptVO;

public interface MemberDAO {
	
	LoginVO login(LoginVO login);
	
	LoginVO kakaoLogin(LoginVO login);
	
	String idCheck(String inputId);
	
	void signUpMember(MemberVO member);
	
	void signUpBusiness(MemberVO member);
	
	
}
