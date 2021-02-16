package com.kflix.member.interceptoer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kflix.member.domain.Member;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String LOGIN = "login";
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Member memberVO = (Member)modelMap.get("memberVO");
		
		if(memberVO != null) {
			log.info("===========================new login success=============================");
			session.setAttribute(LOGIN, memberVO);
			log.info("session id >"+ session.getId());
			
			String destination = (String) session.getAttribute("destination");
			response.sendRedirect((destination != null) ? destination : "/kflix/browse");
		}else {
			log.info("로그인 에러 ");
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			log.info("기존에 있는 HttpSession 정보 > " + session.getAttribute(LOGIN) );
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
}
