package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

@Controller
public class BoardController {
	
	// BoardService 인터페이스를 상속받고 있는 BoardServiceImpl이 생성되어 있기 때문에 이게 달라붙음
	@Autowired
	private BoardService service;
	
	@RequestMapping("/board")
	public ModelAndView selectAll() {
		
		List<BoardVO> boardList = service.selectAllBoard();
		
		ModelAndView mav = new ModelAndView("board/list");
		
		mav.addObject("list",boardList);
		
		return mav;
	}
	
	// rest 방식으로 하기 전, 우리가 했던 방식으로 detail 호출(바로 아래에)
	@RequestMapping("/board/detail")
	public void selectByNo(@RequestParam("no") int no) {
		
		// 이럴 때 사용하는 @RequestParam 어노테이션, "no"라는 이름으로 날아오는 것을 int no에 넣어줘!
		// 그럼 날아오는 파라미터가 많은 경우는?
		
		// 이거는 HttpServletRequest request해서 사용한 것임
		//int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("no : " + no);
		
		// 파라미터로 넘어온 번호를 알아내야지
		// 원하면 스프링에 요구해라
		
	}
	
	// 이 부분은 REST 방식으로 게시글 상세 조회
	// http://loacalhost:9999/Mission-Spring/board/12
	// 이런식으로 날아옴, 뭔가 값이 들어온다 {no} 이런식으로
	// url중 여러 개 값 가져오고 싶으면,
	// @PathVariable("no") int no, @PathVariable("name") String name
	// url이 유연하게 움직이고 있음
	
	@RequestMapping("/board/{no}")
	public ModelAndView selectByNo2(@PathVariable("no") int no) {
		
		// 여기서는 ?로 날아오는게 아니고, url로 날아옴 => @PathVariable
		//System.out.println("no: " + no);
		
		ModelAndView mav = new ModelAndView("board/detail");
		
		// service => dao 거쳐서 해당하는 게시물의 값을 받아와서 mav로 공유영역에 저장
		BoardVO board = service.selectDetailBoard(no);
		
		mav.addObject("board", board);
		
		return mav;
		
	}
	
	@RequestMapping("/board/delete/{no}")
	public String boardDelete(@PathVariable("no") int no) {
		
		// no를 service => dao에 전달해서 해당하는 게시물 삭제
		
		service.boardDelete(no);
		
		// 삭제한 후에 redirect해서 게시글 list를 DB에서 읽어오도록 해야함
		return "redirect:/board";
	}
	
	@RequestMapping("/board/writeForm")
	public String boardWriteForm() {
		
		// http://localhost:9999/Mission-Spring/board/writeForm
		// WEB-INF/jsp//board/writeForm.jsp
		
	
		return "/board/writeForm";
		
	}
	
	@RequestMapping("/board/write")
	public String boardWrite(@RequestParam("title") String title, @RequestParam("writer") String writer, @RequestParam("content") String content) {
		
		// 변신
		// BoardVO에 setter로 값을 넣어서 들고 오는거 했다가 변경
		// @ModelAttribute로 공유영역에 저장되는 이름을 설정안해주면, boardVO이렇게 들어감
		// 공유영역에 저장할 필요없음, redirect할꺼고, 공유영역에 저장된 값을 출력해줄 필요없음
		
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		
		// 처음에 파라미터 변수를 boardVO board이렇게해서.. 다른 것 없이 바로 boardWrite(board);로 넘기니까 안됐었음..
		
		service.boardWrite(board);
		
		
		return "redirect:/board";
		
	}
	
	
	
}
