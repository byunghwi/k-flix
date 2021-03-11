package com.kflix.help.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kflix.help.domain.Help;
import com.kflix.help.service.HelpService;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HelpController {

	@Inject
	HelpService h_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	static final PageNation PAGENATION;
	static {
		PAGENATION = new PageNation(1, 10);
	}
	
	// http://localhost:8081/kflix/FAQ/index
	
	// 관리자가 볼 페이지
	@RequestMapping(value = "/FAQ/index",  method = RequestMethod.GET)
	public String faqIndex(Model model, Help help) {
		log.info("============ faqIndexCon ============");

		model.addAttribute("page", PAGENATION.getPage());
		model.addAttribute("amount", PAGENATION.getAmount());
		model.addAttribute("total", h_service.getCntHelpList(ENABLED));
		model.addAttribute("help", h_service.getPageHelp(PAGENATION, ENABLED));
		return "help/helpindex";
	}
	
	// 관리자가 볼 페이지
	@RequestMapping(value = "/FAQ/deletedindex",  method = RequestMethod.GET)
	public String faqDeletedIndex(Model model, Help help) {
		log.info("============ faqIndexCon ============");

		model.addAttribute("page", PAGENATION.getPage());
		model.addAttribute("amount", PAGENATION.getAmount());
		model.addAttribute("total", h_service.getCntHelpList(DISABLED));
		model.addAttribute("help", h_service.getPageHelp(PAGENATION, DISABLED));
		return "help/deletedhelpindex";
	}
	
	
}
