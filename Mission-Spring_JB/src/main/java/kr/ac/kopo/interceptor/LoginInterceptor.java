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
		
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		if(userVO == null) {
			
			// url은 바뀌지만, 넘어가지 않음
			// 이동시켜줘야함
			
			
			// 새글등록 -> 로그인 -> 하면, 메인으로보냄.. 새글등록 할 수 있도록 가야지!
			String uri = request.getRequestURI();
			uri = uri.substring(request.getContextPath().length());
			System.out.println("uri : " + uri);
			
			// 목적지의 경로를 기억시킨다
			session.setAttribute("dest", uri);
			
			// /board/detail?no=3 이렇게 날아올 수 있는데
			// uri : /board/detail 이렇게 날아오는데,  ==> request.getRequestURI()
			// query : no=3 ==> request.getQueryString()
			
			// if(query !=null) uri = uri + "?" + query 이런식으로 함
			
			//MemberController2를 확인해보자
			
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		// return true라고 하면 통과
		return true;
	}
	
	
	
}
