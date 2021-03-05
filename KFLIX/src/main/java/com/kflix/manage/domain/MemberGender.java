package com.kflix.manage.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberGender {

	private String gender;
	private int gender_cnt;
	
}
