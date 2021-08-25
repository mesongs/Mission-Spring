package kr.ac.kopo.board.dao;

import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.board.vo.ReplyVO;

// 변화에 민감하지 않게 하기 위해 인터페이스로 구성
public interface BoardDAO {
	
	/**
	 * 전체게시글 조회
	 * @return DB에서 반환된 BoardVO 
	 */
	
	List<BoardVO> searchAll();
	
	
	/**
	 * 상세 게시글 조회
	 * @return BoardVO
	 */
	BoardVO searchDetail(int boardNo);
	
	
	/**
	 * 게시글 삭제
	 * @param boardNo
	 */
	void boardDelete(int boardNo);
	
	
	/**
	 * 새글 등록
	 * @param board
	 */
	void boardWrite(BoardVO board);
	
	/**
	 * 답글 등록
	 * @param reply
	 */
	int boardReplyWrite(ReplyVO reply);
	
	
	List<ReplyVO> boardReplyList(int boardNo);
}	
