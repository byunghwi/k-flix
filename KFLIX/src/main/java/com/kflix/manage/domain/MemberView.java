package com.kflix.manage.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberView {

	private String email;
	private String nick;
	private String gender;
	private int member_age;
	private String cert;
	private String ticket_name;
	private String ban;
	private String save_status;
	private String pay_sid;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date join_date;
	
}
