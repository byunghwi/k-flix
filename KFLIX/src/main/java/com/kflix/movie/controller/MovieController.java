package com.kflix.movie.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kflix.movie.domain.Movie;
import com.kflix.movie.service.MovieService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
public class MovieController {

	@Autowired
	MovieService mv_service;
	
	// http://localhost:8080/kflix/movie/management
	
	/*
	 * 영화 관리 페이지
	 */
	@GetMapping("management")
	public String movieMain(Model model) {
		// mv_service.selectAllMovieVeiw();
		Movie mv = new Movie();
		mv.setMovie_id(2);
		mv.setPoster_path("포스터 경로");
		mv.setMovie_title("감자 튀김");
		mv.setGenre_id1(1);
		mv.setGenre_id2(2);
		mv.setPlay_time(3);
		mv.setMovie_release("2021-02-13");
		
		List<Movie> movie = new ArrayList<>();
		movie.add(mv);
		
		model.addAttribute("movie", movie);
		
		return "movie/management";
	}
	
	
	/*
	 * 상세보기 페이지 / post로 바꿀것
	 */
//	@GetMapping("detail/{id}") / Model model, @PathVariable("id") int movie_id
	@GetMapping("detail")
	public String detail() {
		// mv_service.selectMovieById();
		
		
		return "movie/detail";
	}
	
	
	/*
	 * 영화 등록 페이지
	 */
	@GetMapping("add")
	public String add() {
		return "movie/addMovie";
	}
	
	
	/*
	 * 수정 페이지
	 */
//	@GetMapping("update/{id}") / Model model, @PathVariable("id") int movie_id
	@GetMapping("update")
	public String update() {
		// mv_service.selectMovieById();
		
		return "movie/updateMovie";
	}
	
}

