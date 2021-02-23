package com.kflix.ticket.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kflix.member.domain.Member;
import com.kflix.member.service.MemberService;
import com.kflix.ticket.service.TicketService;

@Controller
@RequestMapping(value = "/ticket")
public class TickectController {
	
	@Inject
	private TicketService ticketService;
	
	@Inject
	private MemberService memberService;

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String TicketPage(Model model, HttpSession session, @RequestParam(value = "sendChk", required = false) String sendChk) {
		
		String email = ((Member) session.getAttribute("login")).getEmail();
		
		//회원정보빼오기
		Member member = memberService.getMemberByEmail(email);
		
		model.addAttribute("member", member);
		model.addAttribute("sendChk", sendChk);
		return "/ticket/infoPage";	
	}
	
	@RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
	public String sendEmail(HttpSession session, Model model) {
		
		String email = ((Member) session.getAttribute("login")).getEmail();
		
		//본인인증 이메일 발송성공시.
		if(ticketService.sendAuthMail(email)) {
			model.addAttribute("sendChk", "OK");  
	        return "redirect:/ticket/info";
		}
		
		return "/ticket/emailAuthFail";

	}

}
