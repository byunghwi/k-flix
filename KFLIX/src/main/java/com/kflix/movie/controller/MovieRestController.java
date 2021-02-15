package com.kflix.movie.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.movie.domain.Movie;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/movie/*")
@Log4j
public class MovieRestController {

	/*
	 * 원하는 조건 검색
	 */
	@GetMapping("findTitle")
	public String findMovieByTitle() {
		

		return "";
	}
	
	
}
