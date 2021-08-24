package kr.ac.kopo.board.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.board.reply.vo.ReplyVO;
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
		
		mav.addObject("list", boardList);
		
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
	
	// list에서 게시글 클릭했을 때 게시글 상세
	@RequestMapping("/board/{no}")
	public ModelAndView selectByNo2(@PathVariable("no") int no) {
		
		// 여기서는 ?로 날아오는게 아니고, url로 날아옴 => @PathVariable
		//System.out.println("no: " + no);
		
		ModelAndView mav = new ModelAndView("board/detail");
		
		// service => dao 거쳐서 해당하는 게시물의 값을 받아와서 mav로 공유영역에 저장
		BoardVO board = service.selectDetailBoard(no);
		
		
		//no(해당 게시글)에 해당하는 댓글을 가져와야함 => 공유영역에 저장, return되는 jsp에 댓글 출력하기
		// ajax로 댓글 등록하고, /board/{no}를 호출해야할 것 같은데..
		// 게시글 번호에 해당하는 댓글을 출력해주는게 필요함 ==> 이거를 이렇게 했다가 ajax로 변경했음
		//List<ReplyVO> replyList = service.boardReplyList(no);
		
		//mav.addObject("replyList", replyList);
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
	
//	@RequestMapping("/board/writeForm")
//	public String boardWriteForm() {
//		
//		// http://localhost:9999/Mission-Spring/board/writeForm
//		// WEB-INF/jsp//board/writeForm.jsp
//		
//	
//		return "/board/writeForm";
//		
//	}
//	
//	@RequestMapping("/board/write")
//	public String boardWrite(@RequestParam("title") String title, @RequestParam("writer") String writer, @RequestParam("content") String content) {
//		
//		// 변신
//		// BoardVO에 setter로 값을 넣어서 들고 오는거 했다가 변경
//		// @ModelAttribute로 공유영역에 저장되는 이름을 설정안해주면, boardVO이렇게 들어감
//		// 공유영역에 저장할 필요없음, redirect할꺼고, 공유영역에 저장된 값을 출력해줄 필요없음
//		
//		BoardVO board = new BoardVO();
//		board.setTitle(title);
//		board.setWriter(writer);
//		board.setContent(content);
//		
//		// 처음에 파라미터 변수를 boardVO board이렇게해서.. 다른 것 없이 바로 boardWrite(board);로 넘기니까 안됐었음..
//		
//		service.boardWrite(board);
//		
//		
//		return "redirect:/board";
//		
//	}

	// write 하는거 아래부터는 교수님이 해주신거
	
//	@RequestMapping(value="/board/write", method=RequestMethod.GET)
//  어노테이션이 새로나왔음, 스프링 4.3이후부터
//	@GetMapping("/board/write")
//	public String writeForm() {
//		
//		
//		return "board/write";
//	}
//	
////	@RequestMapping(value="/board/write", method=RequestMethod.POST)
//	@PostMapping("/board/write")
//	public String write(BoardVO board, Model model) {
//		
//		
//		System.out.println(board);
//		
//		// 백엔드에서 제약조건을 지킬 수 있도록 해보자
////		if(board.getTitle() == null || board.getTitle().equals("")) {
////			
////			// 만약 사용자가 제목, 작성자는 이미 등록했는데, 이거는 기억시켜야지! => model 등록
////			model.addAttribute("board", board);
////			return "board/write";
////			
////		}
//		
//		
//		
//		return "redirect:/board";
//		
//		// 리턴값이 void였을 때, uri (board/write)와 똑같은 이름의 파일을 포워드!
//	}
	
	
	// db에 저장되기 전 컨트롤러에서 올바르게 데이터를 입력했는지 판단
	// 사용자가 '제목'만 입력했고, '작성자'와 '내용'은 입력 안했으면?
	// 사용자가 이미 입력한 '제목'을 보여줘야함 => 공유영역에 객체를 등록시키는 방법 뿐
	// response 하면서 공유영역에 등록된 내용을 화면에 뿌려줌
	// 이렇게 하면 사용자가 입력한 내용을 기억하고 있는 것처럼 보임
	// 이 과정을 편하게 하는 스프링 form 태그
	
	@GetMapping("/board/write")
	public String writeForm(Model model) {
		
		//BoardVO board = new BoardVO();
		//board.setTitle("제목..");
		
		// 이 부분 뭐지?
		// write.jsp에서 modelAttribute="boardVO"를 사용할거니까
		// 여기서 객체를 생성해서, 공유영역에 저장해놓아야 write.jsp에서 사용할 수 있음
		model.addAttribute("boardVO", new BoardVO());
		
		return "board/write";
		
	}
	
	
	// BoardVO에 들어있는, 입력된 데이터가 실제 올바르게 입력된 데이터인가
	// if(board.getTitle() == null || board.getTitle().equals(""))
	// 이거를 제목, 작성자, 내용 한 개씩 다물어봐야함.. 
	// 비효율적이잖아? => 일단, VO 멤버변수로 가자
	// VO에 @NotEmpty가 붙은 멤버변수에 대해 @Valid
	// 이게 잘작동되는지 결과=> Errors or BindingResult
	@PostMapping("/board/write")
	public String write(@Valid BoardVO board, Errors error) {
		
		System.out.println(board);
		
		// 에러가 있는지 true, false로 나타냄, 문제없으면 false
		//System.out.println(error.hasErrors());
		
		if(error.hasErrors()) {
			
			// BoardVO board로 값을 받았기 때문에
			// boardVO라는 이름으로 자연스럽게 공유영역에 등록되어있음
			
			return "board/write";
		}
		
		
		return "redirect:/board";
		
	}
	
	// 댓글 insert -1
//	@PostMapping("/board/reply")
//	public void replyWrite(ReplyVO replyVO) {
//		
//		System.out.println(replyVO);
//		
//		// ajax로 보낸 파라마터를 ReplyVO에 set해서 들고옴
//		service.boardReplyWrite(replyVO);
//	
//	}
	
	// 댓글 insert -2
	@PostMapping("/board/reply")
	@ResponseBody
	public int replyWrite(ReplyVO reply){
		 
		// return 값이 .jsp가 아닌 경우 사용하는 @ResponseBody
		
		System.out.println(reply);
		// ajax로 보낸 파라마터를 ReplyVO에 set해서 들고옴
		
		int cnt = service.boardReplyWrite(reply);
		return cnt;
	}
	
	
	@GetMapping("/board/replyList/{no}")
	public ModelAndView getReplyList(@PathVariable("no") int no) {
		
		ModelAndView mav = new ModelAndView("board/replyList");
		
		List<ReplyVO> replyList = service.boardReplyList(no);
		
		mav.addObject("replyList", replyList);
		
		
		return mav;
	}
	
	
}




