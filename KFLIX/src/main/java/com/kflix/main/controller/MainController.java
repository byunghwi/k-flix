package com.kflix.main.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kflix.login.NaverLoginVO;
import com.kflix.member.domain.Member;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	/* NaverLoginBO */
	private NaverLoginVO naverLoginVO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginVO(NaverLoginVO naverLoginVO) {
		this.naverLoginVO = naverLoginVO;
	}
	
	@Inject
	Member memberVO;

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		// return "login";
		return "/main/index";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes rttr)
			throws IOException, ParseException, org.json.simple.parser.ParseException {
		
		System.out.println("여기는 callback");

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginVO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginVO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		
		// response의 nickname값 파싱
		System.out.println("callback 시 넘어오는 데이터 > " + response_obj);
		String nickname = (String) response_obj.get("nickname");
		String email = (String) response_obj.get("email");
		String birth = (String) response_obj.get("birth");
		//int age = (int) response_obj.get("age");
		
		memberVO.setEmail(email);
		memberVO.setNaver(email);
		memberVO.setBirth(birth);
		//memberVO.setMember_age(age);
		System.out.println("네이버 로그인 멤버객체 > " + memberVO);
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", session.getId()); // 세션 생성
		System.out.println("세션 아이디 sessionId > "+ session.getAttribute("sessionId"));
		
		
		session.setAttribute("login", memberVO); // 세션 생성
		System.out.println("세션 아이디 memberVO> "+ session.getAttribute("login"));
		
		model.addAttribute("result", apiResult);

		System.out.println("오류잡기1");
		rttr.addFlashAttribute("naverMem", memberVO);
		System.out.println("오류잡기2");
		
		//return "login";
		return "redirect:/member/loginPost";
	}
	
	// 로그인 폼 보여주기
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(Model model, HttpSession session) {
		System.out.println("로그인 폼 보여주기");
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "/main/loginForm";
	}
	

}
