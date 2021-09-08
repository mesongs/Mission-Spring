package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import java.util.List;

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

import kr.ac.kopo.financial.service.FinancialService;
import kr.ac.kopo.financial.vo.SalesReportVO;
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
	private FinancialService financialService;
	
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
	public void 매출보고서() throws Exception{
		
		String businessNo = "6052355236";
		
		List<SalesReportVO> salesReportList = financialService.getSalesInfo(businessNo);
		
		System.out.println(salesReportList);
		
	}
	
	
	
	
	
}
