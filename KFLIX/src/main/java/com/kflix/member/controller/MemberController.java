package com.kflix.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kflix.member.domain.Member;
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
		return "/main/index";
	}

	// 회원가입 처리
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerPOST(Member member, RedirectAttributes redirectAttributes) throws Exception {

		int result = memberService.register(member);

		if (result == 1) {
			redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		}

		return "redirect:/main";
	}

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {

	}

	// 로그인
	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public void loginPOST(Member member, HttpSession session, Model model) {
		Member memberVO = memberService.login(member);
		if (memberVO == null) {
			return;
		}
		model.addAttribute("memberVO", memberVO);
	}

}
