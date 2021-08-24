package kr.ac.kopo.board.vo;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class BoardVO {
	// VO와 DTO와 같음
	// VO는 굳이 만들어서 가지고 있을 필요없다! @Controller같은거 안붙일거임
	
	private int no;
	@Pattern(regexp="^[A-Za-z0-9]*$", message="특수 기호는 사용하실 수 없습니다.")
	@NotEmpty(message="필수항목 입니다.")
	private String writer;
	// 정규식도 사용가능함
	@Length(min=2, max=40, message="최소 2글자 이상 최대 40글자 가능")
	@NotEmpty(message="필수항목 입니다.")
	private String title;
	@NotEmpty(message="필수항목 입니다.")
	private String content;
	private int viewCnt;
	private String regDate;
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", writer=" + writer + ", title=" + title + ", content=" + content + ", viewCnt="
				+ viewCnt + ", regDate=" + regDate + "]";
	}
	
	

}
