package com.kflix.main.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;
import com.kflix.login.KakaoLoginVO;
import com.kflix.login.NaverLoginVO;
import com.kflix.member.domain.Member;
import com.kflix.member.service.MemberService;
import com.kflix.ticket.domain.Ticket;
import com.kflix.ticket.service.TicketService;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	/* NaverLoginVO */
	private NaverLoginVO naverLoginVO;
	private String apiResult = null;
	
	// KakaoLoginVO
	private KakaoLoginVO kakaoLoginVO;
	
	@Autowired
	private void setKakoLoginVO(KakaoLoginVO kakaoLoginVO) {
		this.kakaoLoginVO = kakaoLoginVO;
	}

	@Autowired
	private void setNaverLoginVO(NaverLoginVO naverLoginVO) {
		this.naverLoginVO = naverLoginVO;
	}
	
	@Inject
	TicketService ticketService;


	@Inject
	MemberService memberService;

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		// session에 로그인 정보가 있으면 바로 메인페이지, 로그인 안돼있으면 로그인페이지
		return (session.getAttribute("login") != null) ? "redirect:/browse" : "/main/index";

	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			RedirectAttributes rttr) throws IOException, ParseException, org.json.simple.parser.ParseException {
		
		Member memberVO = new Member();
		
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

		// 네이버 아이디마다 고유하게 발급되는 유니크한 일련번호값. 이 유니크한 일련번호값으로 자체적으로 회원정보를 구성해야함.
		String unique_id = (String) response_obj.get("id");

		String nickname = (String) response_obj.get("nickname");
		String email = (String) response_obj.get("email");
		String birth = ((String) response_obj.get("birthyear") + (String) response_obj.get("birthday"));
		String gender = (String) response_obj.get("gender");

		memberVO.setEmail(email);
		memberVO.setNaver(unique_id);
		memberVO.setBirth(birth);
		memberVO.setGender(gender);
		memberVO.setNick(nickname);

		// 네이버 고유 id로 로그인 체크시 없으면 회원가입페이지로 바로 이동.
		if (memberService.login(memberVO) == null) {
			System.out.println("[MainController] 네이버 로그인 시 가입된 naver 필드 없으므로 회원가입창으로 바로 이동");
			model.addAttribute("naver", memberVO);
			return "/main/registerForm"; // 테스트
		}

		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", session.getId()); // 세션 생성
		System.out.println("[MainController] 세션 아이디 sessionId > " + session.getAttribute("sessionId"));

//		session.setAttribute("login", memberVO); // 세션 생성
//		System.out.println("[MainController] 세션 아이디 memberVO> " + session.getAttribute("login"));

		model.addAttribute("result", apiResult);

		rttr.addFlashAttribute("naverMem", memberVO);

		// return "login";
		return "redirect:/loginPost";
	}
	
	// 카카오 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/kakao/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoCallback(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "code") String code, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		Member memberVO = new Member();
		
		System.out.println("[MainController] 카카오 콜백 접근");
		
		System.out.println("[MainController] 리퀘스트 안에 code > " + request.getParameter("code"));
		System.out.println("[MainController] 요청 결과의 code > " + code);
		
		String accessToken = kakaoLoginVO.getAccessToken(code);
		System.out.println("[MainController] 요청 결과의 accessToken > " + accessToken);
		
		JSONObject kakaoprofile = kakaoLoginVO.getKakaoUserInfo(accessToken);
		System.out.println("[MainController] 요청 결과의 kakaoprofile > " + kakaoprofile);
		
		
		String id = kakaoprofile.get("id").toString();
		JSONObject kakao_account = (JSONObject)kakaoprofile.get("kakao_account");
		String email = kakao_account.get("email").toString();
		String gender = kakao_account.get("gender").toString();
	
		if(gender.equals("male")) {
			gender = "M";
		}else if(gender.equals("female")) {
			gender = "F";
		}

		System.out.println("[MainController] 요청 결과의 id > " + id);
		System.out.println("[MainController] 요청 결과의 email > " + email);
		System.out.println("[MainController] 요청 결과의 gender > " + gender);
	
		memberVO.setKakao(id);
		memberVO.setEmail(email);
		memberVO.setGender(gender);
		System.out.println("[MainController] 만든 member객체  > " + memberVO);
		
		// 카카오 고유 id로 로그인 체크시 없으면 회원가입페이지로 바로 이동.
		if (memberService.login(memberVO) == null) {
			System.out.println("[MainController] 카카오 로그인 시 가입된 kakao 필드 없으므로 회원가입창으로 바로 이동");
					model.addAttribute("kakao", memberVO);
					return "/main/registerForm";
		}
		
		rttr.addFlashAttribute("kakaoMem", memberVO);

		return "redirect:/loginPost";

	}
	
/////////////////////////////////////////////사용자용 로그인 관련 시작 ////////////////////////////////////////////////////////////////////////////
	// 로그인 폼 보여주기
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		
		// 카카오아이디로 인증 url가져오기
		String kakaoUrl = kakaoLoginVO.getAuthorizationUrl();
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125

		System.out.println("[MainController] 네이버:" + naverAuthUrl);
		System.out.println("[MainController] 카카오:" + kakaoUrl);
		
		// 네이버, 카카오 인증 url
		model.addAttribute("naver_url", naverAuthUrl);
		model.addAttribute("kakao_url", kakaoUrl);
		
		return "/main/loginForm";
	}

	// 로그인
	@RequestMapping(value = "/loginPost", method = { RequestMethod.POST, RequestMethod.GET })
	public void loginPOST(Member member, HttpSession session, Model model,
			@RequestParam(value = "userCookie", required = false) String userCookie, HttpServletRequest request) {

		Member memberVO = null;

		System.out.println("[MainController] loginPost member > " + member);
		// 1. addFlashAttribute > redirect 후 소멸 (세션기반)

		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);

		if (redirectMap != null) {
			for (String key : redirectMap.keySet()) {
				System.out.println(String.format("[MainController] 키 : %s, 값 : %s", key, redirectMap.get(key)));
				
				if((Member) redirectMap.get("naverMem") != null) {
					memberVO = memberService.login((Member) redirectMap.get("naverMem")); // 오브젝트 타입이라 캐스팅해줌
					System.out.println("[MainController]네이버로 로그인시 member객체 > " + memberVO);
					break;
				}else if((Member) redirectMap.get("kakaoMem") != null){
					memberVO = memberService.login((Member) redirectMap.get("kakaoMem")); // 오브젝트 타입이라 캐스팅해줌
					System.out.println("[MainController]카카오로 로그인시 member객체 > " + memberVO);
					break;
				}
			}

		} else {

			memberVO = memberService.login(member);
			System.out.println("[MainController] 일반 로그인시 member객체 > " + memberVO);
			if (memberVO == null) {
				log.info("[MainController] login failed....");
				return;
			}
			if (userCookie != null) {

				int amount = 60 * 60 * 24; // 쿠키 유지 1일
				Date sesionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

				// loginCookie 값이 유지되는 시간 정보 DB저장.
				memberService.keepLogin(member.getEmail(), session.getId(), sesionLimit);
			}
		}
		
		List<Ticket> tickets = ticketService.getAllTickets();
		model.addAttribute("memberVO", memberVO);// 멤버객체를 가지고 loginInterceptor로 이동
		model.addAttribute("tickets", tickets); //티켓객체를 가지고 loginInterceptor로 이동

		System.out.println("[MainController] 어디부터 실행되는가 / 멤버컨트롤러");
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		session.invalidate();
		return "redirect:/";
	}
	
/////////////////////////////////////////////사용자용 로그인 관련 끝 ////////////////////////////////////////////////////////////////////////////
	

/////////////////////////////////////////////관리자용 로그인 관련 시작 ////////////////////////////////////////////////////////////////////////////
	// 관리자용 로그인 폼 보여주기
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminloginForm(Model model, HttpSession session) {
	
		return "/main/loginForm_Admin";
	}
	
	// 관리자용 로그인
	@RequestMapping(value = "/adminLoginPost", method = { RequestMethod.POST, RequestMethod.GET })
	public void adminLoginPost(Member member, HttpSession session, Model model,
			@RequestParam(value = "userCookie", required = false) String userCookie, HttpServletRequest request) {

			Member memberVO = null;

			System.out.println("[MainController] adminLoginPost member > " + member);


			memberVO = memberService.login(member);
			
			System.out.println("[MainController] 일반 로그인시 admin 객체 > " + memberVO);
			if (memberVO == null) {
				log.info("[MainController] Admin login failed....");
				return;
			}
			if (userCookie != null) {

				int amount = 60 * 60 * 24; // 쿠키 유지 1일
				Date sesionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

				// loginCookie 값이 유지되는 시간 정보 DB저장.
				memberService.keepLogin(member.getEmail(), session.getId(), sesionLimit);
			}
		
		List<Ticket> tickets = ticketService.getAllTickets();
		model.addAttribute("memberVO", memberVO);// 멤버객체를 가지고 adminloginInterceptor로 이동
		model.addAttribute("tickets", tickets); //티켓객체를 가지고 adminloginInterceptor로 이동

	}
	
	// 관리자용 로그아웃
	@RequestMapping(value = "/logoutAdmin", method = { RequestMethod.GET, RequestMethod.POST })
	public String logoutAdmin(HttpSession session) throws IOException {
		session.invalidate();
		return "redirect:/admin";
	}
/////////////////////////////////////////////관리자용 로그인 관련 끝 ////////////////////////////////////////////////////////////////////////////

}
