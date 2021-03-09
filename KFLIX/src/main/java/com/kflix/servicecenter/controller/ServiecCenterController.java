package com.kflix.servicecenter.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kflix.help.service.HelpService;
import com.kflix.inquiry.service.InquiryService;
import com.kflix.member.domain.Member;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ServiecCenterController {

	@Inject
	HelpService help_service;
	
	@Inject
	InquiryService in_service;

	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	static final PageNation PAGENATION;
	static {
		PAGENATION = new PageNation(1, 10);
	}

	
	@RequestMapping("/service")
	public String serviecCenter(Model model, HttpSession session) {
		log.info("============= serviceCenter ==========");
		
		Member member = (Member) session.getAttribute("login");
		
		log.info("로그인 된 이메일 : " + member.getEmail());
		
		model.addAttribute("help_play", help_service.getHelpWithRownum("재생")); 
		model.addAttribute("info", help_service.getHelpWithRownum("이용안내"));
		model.addAttribute("payment", help_service.getHelpWithRownum("결제"));
		return "center/service";
	}
	
	
	@RequestMapping(value = "/inquiry",  method = RequestMethod.GET)
	public String inqure(Model model, HttpSession session) {
		log.info("============ 문의 페이지 ============");
		
		Member member = (Member) session.getAttribute("login");
		log.info("로그인 된 이메일 : " + member.getEmail());

		model.addAttribute("loginEmail", member.getEmail());
		model.addAttribute("constraint", in_service.getInquiryCosntraint());
		return "inquiry/form";
	}
	
	
	@RequestMapping(value="/FAQ", method = RequestMethod.GET)
	public String inqureUserView(Model model, HttpSession session) {
		log.info("============= faqUserView ==========");
		
		Member member = (Member) session.getAttribute("login");
		
		log.info("로그인 된 이메일 : " + member.getEmail());
		
		model.addAttribute("page", PAGENATION.getPage());
		model.addAttribute("amount", PAGENATION.getAmount());
		model.addAttribute("total", help_service.getCntHelpList(ENABLED));
		model.addAttribute("help", help_service.getPageHelp(PAGENATION, ENABLED));
		model.addAttribute("category", help_service.getAllHelpType());
		return "help/userview";
	}
}
