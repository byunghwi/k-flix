package com.kflix.genre.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kflix.genre.service.GenreService;
import com.kflix.util.pagenation.domain.PageNation;
import com.kflix.util.pagenation.domain.PageNation.PageDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/genre/*")
public class GenreController {

	@Inject
	GenreService genre_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	@GetMapping("genreindex")
	public String genreIndex(Model model, PageNation pagenation) {
		pagenation.setAmount(10);
		model.addAttribute("genre", genre_service.selectPageGenreList(pagenation, ENABLED));
		model.addAttribute("page", pagenation.getPageData(10, genre_service.getCountGenre(ENABLED)));
		return "genre/genreindex";
	}
	
	
	@GetMapping("deletedList")
	public String deletedGenreList(Model model, PageNation pagenation) {
		pagenation.setAmount(10);
		model.addAttribute("genre", genre_service.selectPageGenreList(pagenation, DISABLED));
		model.addAttribute("page", pagenation.getPageData(10, genre_service.getCountGenre(DISABLED)));
		return "genre/deletedGenre";
	}

	
}
