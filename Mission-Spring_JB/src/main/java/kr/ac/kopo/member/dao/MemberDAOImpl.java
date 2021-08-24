package kr.ac.kopo.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public MemberVO login(MemberVO member) {
		
		MemberVO userVO = sqlSessionTemplate.selectOne("member.memberDAO.login",member);
		
		return userVO;
	}

}
