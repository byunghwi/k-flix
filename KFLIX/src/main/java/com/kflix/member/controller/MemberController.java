package com.kflix.member.controller;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kflix.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/member/*")
@Log4j
public class MemberController {

	@Inject
	MemberService memberService;
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String registerGET() {
		log.info("이쪽으로 들어옴");
		return "/member/register";
	}
	
}
