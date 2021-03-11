package com.kflix.watch.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kflix.member.domain.Member;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AlarmServicelmpl implements AlarmService {

	@Inject
	private WatchService alarmService;
	
	@Override
	public void alarmScheduling() {
		System.out.println("[alarmNewUpdate] 진입");

		List<Member> AlarmMember = alarmService.getSelectAlarm();

		// 모든 회원 뽑아서 1 추가
		for (Member alarm : AlarmMember) {
			alarm.setAlarm_count(1);
			int result = alarmService.updateAlarm(alarm);
			System.out.println(alarm);
			System.out.println("성공? : " + result);
		}

	}

}
