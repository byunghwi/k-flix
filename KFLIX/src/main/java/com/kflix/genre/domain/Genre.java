package com.kflix.genre.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Genre {

	private int genre_id;
	private String genre_name;
	private String genre_status;
	private String searching_word;
}
