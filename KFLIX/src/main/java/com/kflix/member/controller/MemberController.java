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
import org.springframework.web.servlet.ModelAndView;
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

		// 회원가입 성공
		if (result == 1) {
			redirectAttributes.addFlashAttribute("msg", "REGISTERED");

			return "/main/registerSuccess";
		}

		return "redirect:/login";
	}

	// 이메일 중복 확인
	@RequestMapping(value = "emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(@RequestBody String email, RedirectAttributes redirectAttributes) throws Exception {
		// System.out.println("이메일중복확인 컨트롤러 1> " + email);

		int result = memberService.checkEmail(email);

		return result;
	}

	// 이메일 인증
	@RequestMapping(value= "signUpConfirm", method = RequestMethod.GET)
	 public ModelAndView signUpConfirm(@RequestParam String email, ModelAndView mav){
	    
		//email가 일치할경우 Member테이블 cert = 'Y' 업데이트
	    System.out.println("[memberController] 이메일 인증 리턴 > " + email);
		int result = memberService.updateAuthStatus(email);
		
		//업데이트 성공 시 
		if(result != 0) {
			System.out.println("[memberController] 이메일 인증 성공, db cert 업데이트");
		    mav.addObject("display", "/view/member/signUp_confirm.jsp"); // key와 value를 담아 보낼 수 있다.
		    mav.setViewName("/ticket/emailAuthSuccess"); // 어떤 페이지를 보여줄 것인지
		}else {
			System.out.println("[memberController] 이메일 인증 실패  db cert 업데이트 실패 ");
			mav.setViewName("/ticket/emailAuthFail"); // 어떤 페이지를 보여줄 것인지
		}
		
		return mav;
	}
}
