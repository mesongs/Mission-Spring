package kr.ac.kopo.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.board.vo.ReplyVO;

// component-scan할 때 만들어줘야지
@Repository
public class BoardDAOImpl implements BoardDAO{
	
	// 이미 테스트해봐서 잘되는거 앎
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "board.BoardDAO";
	
	public List<BoardVO> searchAll() {
		
		List<BoardVO> list = sqlSessionTemplate.selectList("board.BoardDAO.selectAll");
		
		return list;
	}
	
	
	public BoardVO searchDetail(int boardNo) {
		
		
		// boardNo에 해당하는 게시물의 정보를 BoardVO에 저장한 후 return
		BoardVO board = sqlSessionTemplate.selectOne("board.BoardDAO.selectByNo", boardNo);

		return board;
	}


	public void boardDelete(int boardNo) {
		
		
		sqlSessionTemplate.delete( namespace + ".deleteByNo", boardNo);
		
	}


	public void boardWrite(BoardVO board) {
		
		sqlSessionTemplate.insert(namespace + ".writeBoard", board);
		
	}


	public int boardReplyWrite(ReplyVO reply) {
		
		int cnt = sqlSessionTemplate.insert(namespace + ".writeReply", reply);
		
		return cnt;
	}


	public List<ReplyVO> boardReplyList(int boardNo) {
		
		List<ReplyVO> replyList = sqlSessionTemplate.selectList(namespace+ ".replyList", boardNo); 
		
		return replyList;
	}

	
	
	
}
