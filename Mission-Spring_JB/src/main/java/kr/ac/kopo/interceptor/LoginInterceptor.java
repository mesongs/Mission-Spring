package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.member.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		//System.out.println("로그인 인터셉터 처리...");	
		// 로그인 여부 판단!
		
		HttpSession session = request.getSession();
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		
		// 로그인 되어있지 않은 경우 => return false
		if(userVO == null) {
			
			// url은 바뀌지만, 넘어가지 않음
			// 이동시켜줘야함
			
			// 새글등록 -> 로그인 진행 -> 하면, 메인으로보냄.. 새글등록 할 수 있도록 가야지!
			String uri = request.getRequestURI();
			
			//사용자가 요청한 전체 URI
			System.out.println("getRequestURI : " + request.getRequestURI());
			// /Mission-Spring
			System.out.println("getContextPath : " + request.getContextPath());
			
			// 사용자가 입력한 uri 얻어오기
			uri = uri.substring(request.getContextPath().length());
			System.out.println("dest에 기록하는 uri : " + uri);
			
			// 사용자가 로그인한 후, 가고싶은 경로를 기억시킴, MemberController 1
			session.setAttribute("dest", uri);
			
			// /board/detail?no=3 이렇게 날아올 수 있는데
			// uri : /board/detail 이렇게 날아오는데,  => request.getRequestURI()
			// query : no=3 ==> request.getQueryString()
			
			// if(query != null) uri = uri + "?" + query 이런식으로 함
			
			//MemberController2를 확인해보자
			
			//로그인 하도록 redirect
			response.sendRedirect(request.getContextPath() + "/login");
			
			// 일단 인터셉터 작동안하게 하자
			return true;
		}
		
		// return true라고하면 통과
		return true;
	}
	
	
	
}
