package com.kflix.watch.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AlarmVO {

	private int alarm_id;
	private String email;
	private String alarm_type;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date alarm_date;
	private int alarm_count;

}
