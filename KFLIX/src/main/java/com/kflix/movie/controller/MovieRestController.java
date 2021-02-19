package com.kflix.movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	public List<Movie> findMovieByTitle(@RequestBody Search search, PageNation pagenation, Model model) {
		log.info("=========== findMovieByTitle ============");
		log.info(pagenation.getAmount());
		log.info(pagenation.getPage());
		log.info(search.getSearching_index());
		log.info(search.getSearching_word());
		
		model.addAttribute("page", pagenation.getPageData(10, mv_service.getCntFindMovieTitle(search.getSearching_word(), ENABLED)));
		
		return mv_service.findMovieByTitle(pagenation, search.getSearching_word(), ENABLED);
	}
	
	@PostMapping(value = "setpage",
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public PageDTO setPage(@RequestBody PageNation pagenation, Search search) {
		
		log.info("=========== setPage ============");
	
		log.info(pagenation.getAmount());
		log.info(pagenation.getPage());
		return pagenation.getPageData(10, mv_service.getCntFindMovieTitle(search.getSearching_word(), ENABLED));
	}
	
	
}
