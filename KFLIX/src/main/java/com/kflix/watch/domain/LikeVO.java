package com.kflix.watch.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class LikeVO {
	private int wish_id;
	private int movie_id;
	private int movie_rank;
	private String email;
	private String result;
}
	