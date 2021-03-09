package com.kflix.member.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Member {
	String email;
	String pwd;
	String nick;
	String birth;
	int member_age;
	String gender;
	String cert;
	String ban;
	Date join_date;
	int ticket_id;
	String kakao;
	String naver;
	String save_status;
	String pay_sid;//정기결제 고유키
	Date pay_exp_date;//정기결제 만료일
	Date pay_remove_dt;//정기결제 해지일
	int alarm_count;
}
