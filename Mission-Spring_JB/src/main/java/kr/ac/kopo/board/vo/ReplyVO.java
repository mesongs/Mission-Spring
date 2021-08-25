package kr.ac.kopo.board.vo;

public class ReplyVO {

    private String content;
	private String writer;
	private String regDate;
	private int no; // 댓글 번호
	private int boardNo; // 댓글이 달리는 게시물 번호
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "ReplyVO [content=" + content + ", writer=" + writer + ", regDate=" + regDate + ", no=" + no
				+ ", boardNo=" + boardNo + "]";
	}
	
	
	
	
	
	
}
