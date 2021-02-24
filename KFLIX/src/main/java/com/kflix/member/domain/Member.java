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
}
