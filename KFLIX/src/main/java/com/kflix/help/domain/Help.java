package com.kflix.help.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Help {
 
	private int help_id;
	private String help_type;
	private String help_title;
	private String help_content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date help_date;
	
	
}
