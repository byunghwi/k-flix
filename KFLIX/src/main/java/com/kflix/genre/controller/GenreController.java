package com.kflix.genre.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kflix.genre.service.GenreService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/genre*")
public class GenreController {

	@Inject
	GenreService genre_service;
	
	@GetMapping
	public String genreIndex(Model model) {
		model.addAttribute("genre", genre_service.selectAllGenreList('Y'));	
		return "genre/genreindex";
	}
	
	@GetMapping("/deletedList")
	public String deletedGenreList(Model model) {
		model.addAttribute("genre", genre_service.selectAllGenreList('N'));
		return "genre/deletedGenre";
	}
	
	@PostMapping("/add")
	public String addGenre(String genre_name) {
		genre_service.addGenre(genre_name);
		return "redirect:/genre";
	}
	
	@PostMapping("/update")
	public String updateGenre(String genre_name, int genre_id) {
		log.info("업뎃 왔다감");
		log.info(genre_name);
		log.info(genre_id);
		genre_service.updateGenre(genre_id, genre_name);
		
		return "redirect:/genre";
	}
	
	@PostMapping("/delete")
	public String deleteGenre(int genre_id) {
		log.info("업뎃 왔다감");
		log.info(genre_id);
		genre_service.deleteOrRecovertGenre(genre_id, 'N');
		
		return "redirect:/genre";
	}
	
	@PostMapping("/find")
	public String findGenre(Model model, String genre_name) {
		model.addAttribute("genre", genre_service.findGenreByName(genre_name));
		return "redirect:/genre";
	}
}
