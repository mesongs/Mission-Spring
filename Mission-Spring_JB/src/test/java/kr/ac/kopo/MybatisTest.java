package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.board.vo.BoardVO;


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
			
	// 내가 만든 객체의 어느 메소드가 잘실행되는지 테스트해보고 싶다
	// 컨트롤러 서비스 dao 거쳐야하는데, 언제 기다려..
	@Ignore
	@Test
	public void DataSource생성테스트() throws Exception{
		
		// System.out.println("dataSource : " +  dataSource);
		// 리턴값이 null이 아닌지 확인, 제대로 만들어졌으면 null이 아님
		assertNotNull(dataSource);
	}
	
	// 이미 테스트 했던 위에꺼 안하고 싶을때는 @Ignore
	@Ignore
	@Test
	public void mybatis연동테스트() throws Exception{
		
//		assertNotNull(sqlFactory);
		assertNotNull(sessionTemplate);
	}
	
	@Ignore
	@Test
	public void 상세게시글조회Test() throws Exception{
		
		BoardVO board = sessionTemplate.selectOne("board.BoardDAO.selectByNo", 186); 
		System.out.println(board);
	}
	
	@Test
	public void 게시글삭제Test() throws Exception{
		
		sessionTemplate.delete("board.BoardDAO.deleteByNo", 186);
	}
	
 
	
}
