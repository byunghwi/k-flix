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
	
	// 정기결제 대상 회원 추출 후 정기결제 진행
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
	
	// 정기결제 해지 회원 추출 후 만료일 시점에 이용권 해지
	@Scheduled(cron = "0 0 0 * * *")
	public void removePaySchduling() {
		Member member = null;
		Ticket ticket = null;
		System.out.println("[removePaySchedule] 진입");
		
		// 정기결제 해지 회원 목록 추출 - 00:00 자정 기준 Member테이블 pay_exp_date(만료일)과 현재일이 일치 + sid 없음 + pay_remove_dt(해지일)존재 
		List<Member> delPayMemList = memberService.scheduleDelPayMemList();
		
		for (int i = 0; i < delPayMemList.size(); i++) {
			System.out.println("[removePaySchedule] member > " + delPayMemList.get(i));
			member = delPayMemList.get(i);
			
			member.setPay_exp_date(null);  // 만료일
			member.setPay_remove_dt(null); // 해지일
			member.setPay_sid(null);	   // 정기결제 id	
			member.setTicket_id(0);		   // 이용권 id

			//해지 회원 정보 업데이트 ( 이용권번호, 만료일, sid, 정기결제 해지일 모두 null처리 )
			memberService.updatePayMember(member);
		}
	}
}
