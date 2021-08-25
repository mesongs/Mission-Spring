package kr.ac.kopo.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.board.vo.ReplyVO;

@Service
public class BoardServiceImpl implements BoardService  {
	
	@Autowired
	private BoardDAO boardDAO;
	
	
	public List<BoardVO> selectAllBoard() {
		
		List<BoardVO> boardList = boardDAO.searchAll();
		
		return boardList;
	}

	
	public BoardVO selectDetailBoard(int boardNo) {
		
		// 여기 boardDAO는 BoardDAOImpl의 메소드에 접근할 수 있는 객체
		BoardVO board = boardDAO.searchDetail(boardNo);
		
		return board;
	}


	public void boardDelete(int boardNo) {
		
		boardDAO.boardDelete(boardNo);
	}


	public void boardWrite(BoardVO board) {
		
		boardDAO.boardWrite(board);
		
	}


	public int boardReplyWrite(ReplyVO reply) {
		
		int cnt = boardDAO.boardReplyWrite(reply);
		
		return cnt;
	}


	public List<ReplyVO> boardReplyList(int boardNo) {
		
		List<ReplyVO> replyList = boardDAO.boardReplyList(boardNo);
		
		return replyList;
	}
	
	
	
	
	
	
}
