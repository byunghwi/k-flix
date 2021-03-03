package com.kflix.chart.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kflix.genre.service.GenreService;
import com.kflix.movie.service.MovieService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChartController {

	@Inject
	GenreService ge_service;
	
	@Inject
	MovieService mv_service;
	
	@RequestMapping(value="/chart",  method = RequestMethod.GET)
	public String chart() {
		return "chart/chart";
	}
}
