package com.kflix.inquiry.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kflix.inquiry.service.InquiryService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class InquiryController {

	@Inject
	InquiryService in_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	@RequestMapping(value = "/inquiry",  method = RequestMethod.GET)
	public String inqure(Model model) {
		log.info("============ form ============");
		
		model.addAttribute("constraint", in_service.getInquiryCosntraint());
		return "inquiry/form";
	}
	
	@RequestMapping(value = "/inquiry",  method = RequestMethod.POST)
	public String sendInquiry() {
		log.info("============= sendForm =============");
		// 문의 내용 저장후 결과 페이지 리턴
		
		return "redirect:/service";
	}
}
