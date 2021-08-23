package kr.ac.kopo.board.service;

import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;

public interface BoardService {

	List<BoardVO> selectAllBoard();
	
	BoardVO selectDetailBoard(int boardNo);
	
	void boardDelete(int boardNo);
	
	void boardWrite(BoardVO board);
	
}
