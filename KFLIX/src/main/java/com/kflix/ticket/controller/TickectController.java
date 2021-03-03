package com.kflix.ticket.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kflix.kakaoPay.domain.KakaoPayApprovalVO;
import com.kflix.kakaoPay.service.KakaoPay;
import com.kflix.member.domain.Member;
import com.kflix.member.service.MemberService;
import com.kflix.ticket.domain.Ticket;
import com.kflix.ticket.service.TicketService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/ticket")
public class TickectController {
	
	@Inject
	private TicketService ticketService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private KakaoPay kakaoPayService;
	
	@Inject
	KakaoPayApprovalVO kakaoPayApprovalVO;

	@RequestMapping(value = "/info", method = {RequestMethod.GET,RequestMethod.POST})
	public String TicketPage( HttpServletRequest request, Model model, HttpSession session, @RequestParam(value = "sendChk", required = false) String sendChk) {
		
		//리다이렉트로 addFlashAttribute에 담겨진 데이터를 꺼낼 때 사용.
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);

		if(session.getAttribute("login") != null){
			String email = ((Member) session.getAttribute("login")).getEmail(); // 세션으로 이메일 가져와서하게되면 브라우저가 달라졌을 때 못가져옴			
			model.addAttribute("member", memberService.getMemberByEmail(email));
			System.out.println("[TicketController] session 있을 때 > " + email);
		}
		if(redirectMap != null) {
			model.addAttribute("member", redirectMap.get("member"));
			
			//브라우저 변경돼서 login이름의 member객체가 없을 때를 대비해서 생성해주자.
			session.setAttribute("login", redirectMap.get("member"));
			
			System.out.println("[TicketController] member 객체 있을 때 > " + redirectMap.get("member"));
		}
		
		List<Ticket> tickets = ticketService.getAllTickets();
		System.out.println("[TicketController] /info시 ticket들 다 뽑기 > " + tickets.toString());
		
		model.addAttribute("sendChk", sendChk);
		model.addAttribute("tickets", tickets);
		return "/ticket/infoPage";	
	}

	@RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
	public String sendEmail(HttpSession session, Model model) {
		
		String email = ((Member) session.getAttribute("login")).getEmail();
		
		//본인인증 이메일 발송성공시.
		if(ticketService.sendAuthMail(email)) {
			model.addAttribute("sendChk", "OK");  
	        return "redirect:/ticket/info";
		}
		
		return "/ticket/emailAuthFail";

	}
	
	//본인인증 여부 확인
	@RequestMapping(value = "/cert", method = RequestMethod.POST)
	@ResponseBody
	public String TicketPage(String email) {
		String result ="";
		System.out.println("[TicketController] > " + email);
		//회원정보빼오기
		Member member = memberService.getMemberByEmail(email);
		
		result = member.getCert();
		System.out.println("[TicketController] 본인인증여부 확인하러 옴 > " + result);
		return result;	
	}

	//티켓구매 폼 페이지
	@RequestMapping(value = "/buyForm", method = RequestMethod.GET)
	public String TicketBuyForm(HttpSession session, Model model) {
		
		String email = ((Member) session.getAttribute("login")).getEmail();
		
		//회원정보빼오기
		Member member = memberService.getMemberByEmail(email);
		
		model.addAttribute("member", member);
		
		return "/ticket/buyForm";
	}
	
	//카카오페이 요청 성공 페이지
	@RequestMapping(value = "/kakaoSuccess", method = RequestMethod.GET)
	public void kakaoSuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
		log.info("kakaoPaySuccess get...............");
		log.info("kakaoPaySuccess pg_tocken : " + pg_token);
		
		//정기결제 1회차에만 결제승인요청 함
		if(pg_token != null) {
			String email = ((Member) session.getAttribute("login")).getEmail();
			//회원정보빼오기
			Member member = memberService.getMemberByEmail(email);
			
			kakaoPayApprovalVO = kakaoPayService.kakaoPayInfo(pg_token);
			
			member.setPay_sid(kakaoPayApprovalVO.getSid());
			
			if(memberService.updatePayMember(member) == 1) {
				System.out.println("[TicketController] pay관련 member 업데이트 성공...");
			}else {
				System.out.println("[TicketController] pay관련 member 업데이트 실패...");
			}

			model.addAttribute("kakaoPayInfo", kakaoPayApprovalVO);
		}
	}
	
	//카카오페이 버튼 클릭시 이동페이지
	@RequestMapping(value = "/kakaoPay", method = RequestMethod.POST)
	public String kakaoPayPost(HttpSession session, Model model, Ticket ticket) {
		String email = ((Member) session.getAttribute("login")).getEmail();
		//회원정보빼오기
		Member member = memberService.getMemberByEmail(email);
		
		System.out.println("[TicketController] /kakaoPay 경로 , ticket > " + ticket);
		System.out.println("[TicketController] /kakaoPay 경로 , member > " + member);
		
		//테스트용
		ticket.setTicket_id("10");
		ticket.setTicket_name("베이식");
		ticket.setTicket_price(7500);
		
		return "redirect:" + kakaoPayService.kakaoPayReady(ticket, member);
	}
	
	//카카오페이 정기결제 해제 
	@RequestMapping(value = "/removeKakaoPay", method = RequestMethod.POST)
	public void removekakaoPay(HttpSession session, Model model, Ticket ticket) {
		String email = ((Member) session.getAttribute("login")).getEmail();
		//회원정보빼오기
		Member member = memberService.getMemberByEmail(email);
		
		System.out.println("[TicketController] 카카오페이 정기결제 해제");
		
		kakaoPayService.removeKakaoPay(member);

		memberService.removePayMember(email);
	}
}
