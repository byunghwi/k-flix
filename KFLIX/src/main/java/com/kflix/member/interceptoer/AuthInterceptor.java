package com.kflix.member.interceptoer;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.kflix.member.domain.Member;
import com.kflix.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Inject
	MemberService memberService;
	
	private void saveDestination(HttpServletRequest req) {
		
		if (req.getMethod().equals("GET")) {
			String uri = req.getRequestURI();
			String query = req.getQueryString();

			log.info("원래 가려고 했던 페이지 > " + uri);
			log.info(" queryString > " + query);

			query = (query == null || query.equals("null")) ? "" : "?" + query;
			
			log.info("원래 목적지 > " + uri + query);
			req.getSession().setAttribute("destination", uri+query);
		}

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("login") == null) {
			log.info("================로그인되지 않은 상태입니다.==================");

			//원래 가고가했던 페이지.
			saveDestination(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			log.info("AuthInterCepor 쿠키 가져오기 > " + loginCookie);
			
			if(loginCookie != null) {
				
				Member memberVO = memberService.checkLoginBefore(loginCookie.getValue());
				
				log.info("member > " + memberVO);
				
				if(memberVO != null) {
					session.setAttribute("login", memberVO);
					return true;
				}			
			}
			
			response.sendRedirect("/kflix");

			return false;
		}

		return true;
	}

}
