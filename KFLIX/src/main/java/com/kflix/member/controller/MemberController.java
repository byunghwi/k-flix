package com.kflix.member.controller;

import java.io.IOException;
import java.io.Reader;
import java.net.URLDecoder;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

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
		System.out.println("[MemberController] member 객체 > " + member);
		int result = memberService.register(member);

		if (result == 1) {
			redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		}

		//return "redirect:/";
		return "redirect:/login";
	}
	
	// 이메일 중복 확인
	@RequestMapping(value = "emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(@RequestBody String email, RedirectAttributes redirectAttributes) throws Exception {
		//System.out.println("이메일중복확인 컨트롤러 1> " + email);

		int result = memberService.checkEmail(email);

		return result;
	}
}
