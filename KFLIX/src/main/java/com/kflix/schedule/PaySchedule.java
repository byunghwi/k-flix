package com.kflix.schedule;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kflix.kakaoPay.service.KakaoPay;
import com.kflix.member.domain.Member;
import com.kflix.member.service.MemberService;
import com.kflix.ticket.domain.Ticket;
import com.kflix.ticket.service.TicketService;

@Component
public class PaySchedule {
	
	@Inject
	MemberService memberService;
	
	@Inject
	TicketService ticketService;
	
	@Inject
	private KakaoPay kakaoPayService;
	
	
//					//초  분  시  일  월  요일
//	@Scheduled(cron = "0 * * * * *")
//	public void test() {
//		
//		System.out.println("[PaySchedule] test");
//	}
	
	@Scheduled(cron = "0 0 0 * * *")
	public void pay() {
		Member member = null;
		Ticket ticket = null;
		System.out.println("[PaySchedule] 진입");
		// 자동결제 업데이트 돼야하는 회원 리스트
		List<Member> payUpdateMemList = memberService.schedulePayMemList();
		
		for (int i = 0; i < payUpdateMemList.size(); i++) {
			System.out.println("[PaySchedule] member > " + payUpdateMemList.get(i));
			member = payUpdateMemList.get(i);
			ticket = ticketService.getTicket((payUpdateMemList.get(i)).getTicket_id());
			 
			kakaoPayService.kakaoPayReady(ticket, member);
			
			memberService.updatePayMember(member);
		}
		
	}
}
