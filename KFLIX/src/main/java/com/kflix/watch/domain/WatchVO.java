package com.kflix.watch.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class WatchVO {
	private int watch_id;
	private String watch_type;
	private int movie_id;
	private String email;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date watch_date;
	private double view_point;
	private String result;
}