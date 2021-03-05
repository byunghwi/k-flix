package com.kflix.chart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.genre.service.GenreService;
import com.kflix.manage.service.ManageService;
import com.kflix.member.service.MemberService;
import com.kflix.movie.service.MovieService;

@RestController
public class ChartRestController {
	
	@Inject
	GenreService ge_service;
	
	@Inject
	MovieService mv_service;
	
	@Inject
	MemberService mem_service;
	
	@Inject
	ManageService manage;
	
	@GetMapping(value = "/chartRest",
					consumes = "application/json",
					produces = "application/json; charset=UTF-8")
	public Map<String, Object> chartRest(){
		Map<String, Object> list = new HashMap<>();
		list.put("movie", mv_service.selectAllMovieVeiw('Y'));
		list.put("genre", ge_service.selectAllGenreListNotStatus());
		list.put("gender", manage.getMemberGender());
		
		return list;
	}
}
