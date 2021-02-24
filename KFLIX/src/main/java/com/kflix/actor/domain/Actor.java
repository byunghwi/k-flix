package com.kflix.actor.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Actor {

	private int actor_id;
	private String actor_name;
	private char actor_status;
	private String searching_word;
}
