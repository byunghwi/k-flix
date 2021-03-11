package com.kflix.member.interceptoer;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kflix.member.domain.Member;
import com.kflix.ticket.domain.Ticket;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdminLoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Member memberVO = (Member) modelMap.get("memberVO"); // MainController에서 채운 member객체가 있음
		List<Ticket> ticketList = (List<Ticket>) modelMap.get("tickets");

		System.out.println("[AdminLoginInterceptor] posthandle admin 객체 > " + memberVO);

		// MainController에서 로그인이 정상적으로 됐다면 redirect / 제대로 안됐다면 MainController로 넘어간 뒤
		// loginPost.jsp로 이동.( 인터셉터의 postHandle은 컨트롤러의 처리가 끝나고 뷰로 이동하기 전에 실행 되기 때문 )
		if (memberVO != null) {
			log.info("[AdminLoginInterceptor] ===========================new admin login success=============================");
			session.setAttribute(LOGIN, memberVO);
			session.setAttribute("tickets", ticketList);

			if (request.getParameter("userCookie") != null) {

				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/"); // 쿠키의 path 값을 지정하면 지정해준 하위 디렉토리까지 쿠키 전송
				loginCookie.setMaxAge(60 * 60 * 24); // 1일 동안 유지

				response.addCookie(loginCookie);
				log.info("[AdminLoginInterceptor] =========================Cookie 생성=========================");
			}

			String destination = (String) session.getAttribute("destination");
			System.out.println("[AdminLoginInterceptor] 로그인인터셉터 destination > " + destination);
			response.sendRedirect((destination != null) ? destination : "/kflix/management");
		}

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("[LoginInterceptor] login인터셉터 prehandle 접근");
		HttpSession session = request.getSession();

		if (session.getAttribute(LOGIN) != null) {
			log.info("[LoginInterceptor] 기존에 있는 HttpSession 정보 삭제 > " + session.getAttribute(LOGIN));
			session.removeAttribute(LOGIN);
		}
		return true;
	}
}

