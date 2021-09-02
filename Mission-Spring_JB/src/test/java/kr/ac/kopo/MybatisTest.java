package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.receipt.service.ReceiptService;
import kr.ac.kopo.receipt.vo.ReceiptVO;


// 스프링 기반의 junit으로 test한다
// @ContextConfiguration 컨테이너에서 읽어온다?
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class MybatisTest {
	
	// 객체가 올바르게 만들어져있다면 주입할 수 있음
	// 객체를 생성해보는 테스트 생성한 뒤 주입 => 제대로 안만들어졌으면, 주입이 안되겠지
	// spring-mvc에서 선언한 bean객체가 제대로 생성되었으면, @Autowired에 의해 달라붙음
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private SqlSessionFactory sqlFactory;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
			
	@Autowired
	private ReceiptService receiptService;
	
	@Autowired
	private MemberService memberService;

	@Ignore
	@Test
	public void 로그인테스트() throws Exception{
		
		LoginVO login = new LoginVO();
		
		login.setId("jb8049");
		login.setPassword("1");
		
		LoginVO userVO = sessionTemplate.selectOne("member.memberDAO.login",login);
		System.out.println(userVO);
	}
	
	@Test
	public void 영수증최종등록(HttpSession session) throws Exception{
		
		int receiptNo = sessionTemplate.selectOne("receipt.receiptDAO.getReceiptNo");
		
		ReceiptVO receipt = new ReceiptVO();
		
		LoginVO login = new LoginVO();
		
		login.setBusinessNo("126346");
		
		LoginVO userVO = memberService.login(login);
		
		session.setAttribute("userVO", userVO);


		receipt.setFileSize(12322);
		receipt.setFilePath("123");
		receipt.setFileSaveName("214214");
		receipt.setFileOriginalName("214214");
		receipt.setPurpose("1");
		receipt.setMemo("123");
		receipt.setAmount(123);
		receipt.setReceiptKind("1");
		receipt.setStoreName("종범");
		receipt.setSupplierBusinessNo("650");
		receipt.setReceiptDate("23");
		receipt.setAmount(123);
		receipt.setVat(456);
		
		
		//receiptNo는 직접 안넣어줘도 됨
		
		receiptService.receiptResgister(receipt);
		
		
		System.out.println("영수증 seq 번호 : " + receiptNo);
		
		
	
		
	}
	
	
	
	
	
}
