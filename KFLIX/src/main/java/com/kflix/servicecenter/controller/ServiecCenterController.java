package com.kflix.servicecenter.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kflix.help.service.HelpService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ServiecCenterController {

	@Inject
	HelpService help_service;

	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	@RequestMapping("/service")
	public String serviecCenter(Model model) {
		log.info("============= serviceCenter ==========");
		
		model.addAttribute("help_play", help_service.getHelpWithRownum("재생")); 
		model.addAttribute("info", help_service.getHelpWithRownum("이용안내"));
		model.addAttribute("payment", help_service.getHelpWithRownum("결제"));
		return "center/service";
	}
}
