package com.kflix.inquiry.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kflix.inquiry.domain.Inquiry;
import com.kflix.inquiry.service.InquiryService;
import com.kflix.member.domain.Member;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class InquiryController {

	@Inject
	InquiryService in_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	static final PageNation PAGENATION;
	static {
		PAGENATION = new PageNation(1, 10);
	}

	
	@RequestMapping(value = "/inquiry",  method = RequestMethod.POST)
	public String sendInquiry(Inquiry inquiry, RedirectAttributes rttr) {
		log.info("============= 문의접수 =============");
		String msg = "";
		
		// 정규식 유효검사
		if (in_service.formRegExp(inquiry)) {
			// 문의 내용 저장후 결과 페이지 리턴
			int result = in_service.receiptInquiry(inquiry);
			msg = "접수 되었습니다.";
			
		} else {
			msg = "잘못된 접근이 감지 되었습니다.";
	
		}
		
		rttr.addFlashAttribute("inqCheck", msg);
	
		return "redirect:/myinquiry";
	}
	
	
	
	@RequestMapping(value = "/inquiry/index",  method = RequestMethod.GET)
	public String inquiryManagement(Model model, Inquiry inquiry) {
		log.info("============ 문의 관리 ============");
		
		model.addAttribute("page", PAGENATION.getPage());
		model.addAttribute("amount", PAGENATION.getAmount());
		model.addAttribute("total", in_service.getAllInqCnt());
		model.addAttribute("inq", in_service.getPageInq(PAGENATION));
		model.addAttribute("category", in_service.getInquiryCosntraint());
		return "inquiry/inquiryindex";
	}
	
	@RequestMapping(value="/myinquiry", method = RequestMethod.GET)
	public String sendInquiry(Model model, HttpSession session) {
		// 세션, 문의테이블(이메일로 select)
		Member member = (Member) session.getAttribute("login");
		String email =  member.getEmail();
		Inquiry inq = new Inquiry();
		inq.setEmail(email);
		inq.setInquiry_type("all");
		model.addAttribute("inq", in_service.getInqByEmail(PAGENATION, inq, "all"));
		model.addAttribute("total", in_service.selectUserInqCnt(email, inq.getInquiry_type(), "all"));
		model.addAttribute("category", in_service.getInquiryCosntraint());
		return "inquiry/userinq";
	}
}
