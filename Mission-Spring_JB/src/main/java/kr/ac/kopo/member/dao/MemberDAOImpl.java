package kr.ac.kopo.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public LoginVO login(LoginVO login) {
		
		LoginVO userVO = sqlSessionTemplate.selectOne("member.memberDAO.login", login);
		
		return userVO;
	}
	
	@Override
	public LoginVO kakaoLogin(LoginVO login) {
		
		LoginVO userVO = sqlSessionTemplate.selectOne("member.memberDAO.kakaoLogin", login);
		
		return userVO;
	}
	
	@Override
	public String idCheck(String inputId) {
		
		String valid ="";
		
		if(sqlSessionTemplate.selectOne("member.memberDAO.idCheck",inputId) == null) {
			
			valid = "success";
			
		}else {
			
			valid ="fail";
			
		}
		
		// inputId에 해당하는 값이 존재하는지 찾음 => null이면, valid에 success 대입
		return valid;
	}

	@Override
	public void signUpMember(MemberVO member) {
		
		sqlSessionTemplate.insert("member.memberDAO.signUpMember",member);
		
	}


	@Override
	public void signUpBusiness(MemberVO member) {

		sqlSessionTemplate.insert("member.memberDAO.signUpBusiness", member);
		
	}
	
	
	

}
