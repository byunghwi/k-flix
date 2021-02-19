package com.kflix.movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.movie.domain.Movie;
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
	public List<Movie> findMovieByTitle(@RequestBody PageNation pagenation,  Model model) {
		log.info("=========== findMovieByTitle ============");

		String word = pagenation.getSearching_word();
	
		mv_service.getCountMovie(ENABLED);
		
		if (word == null || word.equals("")) {
			return mv_service.selectPageMovieView(pagenation, ENABLED);
			
		} else {
			return mv_service.findMovieByTitle(pagenation, word, ENABLED);			
		}
	}
	
	@PostMapping(value = "setpage",
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public List<Movie> setPage(@RequestBody PageNation pagenation, Model model) {
		
		log.info("=========== setPage ============");

		model.addAttribute("page", pagenation.getPageData(10, mv_service.getCntFindMovieTitle(pagenation.getSearching_word(), ENABLED)));
		String word = pagenation.getSearching_word();
		if (word == null || word.equals("")) {
			return mv_service.selectPageMovieView(pagenation, ENABLED);
			
		} else {
			return mv_service.findMovieByTitle(pagenation, word, ENABLED);			
		}
	}
	
	
}
