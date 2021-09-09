package kr.ac.kopo;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.financial.dao.FinancialDAO;
import kr.ac.kopo.financial.vo.ReturnSalesVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class BoardTest {
	
	// 스프링 컨테이너에서 자동 주입?
	// 이전의 테스트에서 sqlSessionTemplate 이미 존재하는지 확인해서 바로 자동 주입했음
//	@Autowired
//	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private FinancialDAO financialDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// BoardDAOImpl 객체가 자동주입 되고있는 거임
	// BoardDAO에 해당하는 값
	// 자동으로 만들어진(@Repository) BoardDAOImpl(BoardDAO를 상속하고 있는)
//	@Autowired
//	private BoardDAO boardDAO;
//	
//	// 만들어진 boardServiceImpl이 만들어졌는지 확인!
//	@Autowired
//	private BoardService boardService;
	
	// Test annotation 필수
//	@Test
//	@Ignore
//	public void 전체게시글조회Test() throws Exception{
//		
//		// 가져오려는 레코드의 개수가 여러 개, 네임스페이스 + id
//		//List<BoardVO> list = sqlSessionTemplate.selectList("board.BoardDAO.selectAll");
//		
//		List<BoardVO> list = boardDAO.searchAll();
//		
//		List<BoardVO> list = boardService.selectAllBoard();
//		
//		for(BoardVO board : list) {
//			
//			System.out.println(board);
//			
//		}
//		
//	}
	// test 이상없음
//	@Test
//	@Ignore
//	public void 상세게시글조회Test() throws Exception{
//		
//		BoardVO board = boardService.selectDetailBoard(186);
//		System.out.println(board);
//		
//	}
	
//	@Test
//	public void 답글Test() throws Exception{
//		
//		ReplyVO reply = new ReplyVO();
//		
//		reply.setBoardNo(190);
//		reply.setContent("제발");
//		reply.setWriter("되라");
//		
//		System.out.println(reply);
//		boardService.boardReplyWrite(reply);
//		
//		List<ReplyVO> replyList = boardService.boardReplyList(190);
//		
//		for(ReplyVO reply : replyList) {
//			System.out.println(reply);
//			
//		}
//		
//	}
	
	@Test
	public void 최근7일매출() throws Exception{
		
		
		List<ReturnSalesVO> lastWeekSales = financialDAO.getLastWeekSales("6052355236");
		System.out.println(lastWeekSales);
		
	}
	

}
