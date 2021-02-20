package com.kflix.movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.movie.domain.Movie;
import com.kflix.movie.domain.Search;
import com.kflix.movie.service.MovieService;
import com.kflix.util.pagenation.domain.PageNation;
import com.kflix.util.pagenation.domain.PageNation.PageDTO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/movie/*")
@Log4j
public class MovieRestController {

	@Inject
	MovieService mv_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	/*
	 * 원하는 조건 검색
	 */
	@PostMapping(value = "findindex",
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public List<Movie> movieRestCon(@RequestBody Search search) {
		log.info("=========== movieRestCon ============");

		String index = search.getSearching_index();
		String word = search.getSearching_word();
		log.info(index);
		
		if (word == null || word.equals("")) {
			log.info("전체보기");
			return mv_service.selectAllMovieVeiw(ENABLED);
			
		} else if(index.equals("movie_title")) {
			log.info("제목 검색");
			log.info(word);
			return mv_service.findMovieByTitle(word, ENABLED);	
			
		} else if(index.equals("reg_date")) {
			log.info("등록일 검색");
			log.info(word);
			return mv_service.findMovieByTitle(word, ENABLED);
			
		} else if(index.equals("director_name")) {
			log.info("감독 이름");
			log.info(word);
			return mv_service.findMovieByTitle(word, ENABLED);
			
		} else {
			log.info("장르 이름");
			log.info(word);
			return mv_service.findMovieByTitle(word, ENABLED);
		}
	}

	
}
