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
import com.kflix.watch.domain.AlarmVO;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.service.WatchService;

@Component
public class alarmSchedule {

	@Inject
	private WatchService alarmService;

	@Scheduled(cron = "0 0 0 ? * MON" /* cron = "0 0/1 * * * *" / "0 0 0 ? * MON" */)
	public void alarmScheduling() {
		System.out.println("[alarmScheduling] 진입");
		
		// 회원 리스트 새로운 알림 업데이트 - 매주 월요일 00:00 테이블에 있는 전체 회원
		List<AlarmVO> AlarmMember = alarmService.getSelectAlarm();
		List<MovieVO> newMovie = alarmService.getNewmovie();
		
		System.out.println("신규콘텐츠 갯수 : " + newMovie.size());
		
		for (AlarmVO alarmVO : AlarmMember) {
			alarmVO.setAlarm_count(newMovie.size());
			int result = alarmService.updateAlarm(alarmVO);
			System.out.println(alarmVO);
			System.out.println("성공? : " + result);
		}
 
	}

}
