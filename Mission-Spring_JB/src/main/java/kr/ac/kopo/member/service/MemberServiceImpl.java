package kr.ac.kopo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	// MemberDAO에 해당하는 값 알아서 찾아서 넣어줌
	// Impl2 만들어서 기존의 Impl을 변경해줄 때 유용
	
	
	
	public MemberVO login(MemberVO member) {
		
		MemberVO userVO = memberDAO.login(member);
		
		return userVO;
	}

}
