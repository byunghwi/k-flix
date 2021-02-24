package com.kflix.watch.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class WishVO {
	
		private int wish_id;
		private int movie_id;
		private String email;
		private String result;
		
}
