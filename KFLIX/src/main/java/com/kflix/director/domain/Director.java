package com.kflix.director.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Director {

	private int director_id;
	private String director_name;
	private char director_status;
	private String searching_word;
}
