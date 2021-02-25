package com.kflix.inquiry.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kflix.inquiry.domain.Inquiry;
import com.kflix.inquiry.service.InquiryService;
import com.kflix.member.domain.Member;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class InquiryController {

	@Inject
	InquiryService in_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	@RequestMapping(value = "/inquiry",  method = RequestMethod.GET)
	public String inqure(Model model, HttpSession session) {
		log.info("============ form ============");
		
		Member member = (Member) session.getAttribute("login");
		log.info("로그인 된 이메일 : " + member.getEmail());

		model.addAttribute("loginEmail", member.getEmail());
		model.addAttribute("constraint", in_service.getInquiryCosntraint());
		return "inquiry/form";
	}
	
	@RequestMapping(value = "/inquiry",  method = RequestMethod.POST)
	public String sendInquiry(Inquiry inquiry) {
		log.info("============= sendForm =============");
		// 문의 내용 저장후 결과 페이지 리턴
		log.info("고객 이메일: " + inquiry.getEmail());
		log.info("문의 종류: " + inquiry.getInquiry_type());
		log.info("문의 제목: " + inquiry.getInquiry_title());
		log.info("문의 내용: " + inquiry.getInquiry_content());
		
		int result = in_service.receiptInquiry(inquiry);
		
		if (result == 1) {
			log.info("접수 성공");
			
		} else {
			log.info("접수 실패");
		}
		
		return "redirect:/service";
	}
}
