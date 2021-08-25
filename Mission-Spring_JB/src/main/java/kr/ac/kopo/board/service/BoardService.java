package kr.ac.kopo.board.service;

import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.board.vo.ReplyVO;

public interface BoardService {

	List<BoardVO> selectAllBoard();
	
	BoardVO selectDetailBoard(int boardNo);
	
	void boardDelete(int boardNo);
	
	void boardWrite(BoardVO board);
	
	int boardReplyWrite(ReplyVO reply);
	
	List<ReplyVO> boardReplyList(int boardNo);
	
}
