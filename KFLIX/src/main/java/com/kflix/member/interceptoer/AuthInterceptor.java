package com.kflix.member.interceptoer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter {

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
			
			response.sendRedirect("/kflix");

			return false;
		}

		return true;

	}

}
