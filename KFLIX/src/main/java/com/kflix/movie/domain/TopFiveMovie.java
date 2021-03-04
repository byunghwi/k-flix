package com.kflix.movie.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TopFiveMovie {

	private String movie_title;
	private String poster_path;
	private int like_cnt;
	
}
