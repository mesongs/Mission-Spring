package kr.ac.kopo.account.service;

import java.util.List;

import kr.ac.kopo.account.vo.PolicyVO;


public interface AccountService {
	
	List<PolicyVO> policyAgree();
	
	List<PolicyVO> authPolicyAgree();
	
	int smsAuth(String phoneNumber);
	
}
