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
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.service.WatchService;

@Component
public class alarmSchedule {

	@Inject
	private WatchService alarmService;
	
	/* 
	  1분마다
	  cron = "0 0/1 * * * *" 
	 
	  매주 월요일 00:00
	  cron = "0 0 0 ? * MON" */
	@Scheduled(cron = "0 0 0 ? * MON" )
	public void alarmScheduling() {
		System.out.println("[alarmNewUpdate] 진입");
		
		List<Member> AlarmMember = alarmService.getSelectAlarm();
		List<MovieVO> newMovie = alarmService.getNewUpdatemovie();
		
		System.out.println("신규콘텐츠 갯수 : " + newMovie.size());
		
		// 모든 회원 뽑아서 
		for (Member alarm : AlarmMember) {
			alarm.setAlarm_count(newMovie.size());
			int result = alarmService.updateAlarm(alarm);
			System.out.println(alarm);
			System.out.println("성공? : " + result);
		}
	}

}
