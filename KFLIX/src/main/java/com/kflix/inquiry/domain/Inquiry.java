package com.kflix.inquiry.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Inquiry {

	private int inquiry_id;
	private String email;
	private String manager_email;
	private String inquiry_type;
	private String inquiry_title;
	private String inquiry_content;
	private String reply_title;
	private String reply_content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inquiry_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reply_date;
	
	private String reply_status;
}
