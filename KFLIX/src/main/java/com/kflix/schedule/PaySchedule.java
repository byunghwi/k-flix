package com.kflix.schedule;

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
	private MemberService memberService;

	@Inject
	private TicketService ticketService;

	@Inject
	private KakaoPay kakaoPayService;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void payScheduling() {
		Member member = null;
		Ticket ticket = null;
		System.out.println("[PaySchedule] 진입");

		// 자동결제 업데이트 돼야하는 회원 리스트 - 00:00 자정 기준 Member table의 pay_exp_date(만료일)과 현재일이
		// 일치하는 회원 + sid(1회 정기결제시 발급받은 고유코드)가 있는 경우와 ticket_id가 있는 경우
		List<Member> payUpdateMemList = memberService.schedulePayMemList();

		for (int i = 0; i < payUpdateMemList.size(); i++) {
			System.out.println("[PaySchedule] member > " + payUpdateMemList.get(i));
			member = payUpdateMemList.get(i);
			ticket = ticketService.getTicket((payUpdateMemList.get(i)).getTicket_id());

			// 정기결제 요청
			kakaoPayService.kakaoPayReady(ticket, member);

			// 정기 결제 후 회원 정보 업데이트 ( 이용권번호, 만료일, sid, 정기결제 해지일 )
			memberService.updatePayMember(member);
		}

	}
}
