package com.kflix.manage.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kflix.member.domain.Member;

public class ManagerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("#################################### 매니저 인터셉터 ##################################");
		HttpSession session = request.getSession();
		String check_id = "";
		
		if (session.getAttribute("login") == null) {
			System.out.println("로그인 안되있음");
			
			response.sendRedirect("/kflix/admin");
			
			return false;
			
		} else {
			check_id = ((Member)session.getAttribute("login")).getEmail();			
		}
		
		
		
		if(check_id.equals("admin")) {
			System.out.println(check_id + "로 로그인 (매니저 아이디로 가정)");
			
		} else {
			System.out.println(check_id + " = 매니저 아이디가 아님 (가정)");
			
			response.sendRedirect("/kflix/accessError");
			
			return false;
		}
		
		return true;
	}
}
