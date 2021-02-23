package com.kflix.genre.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.genre.domain.Genre;
import com.kflix.genre.service.GenreService;
import com.kflix.movie.domain.Movie;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/genre/*")
@Log4j
public class GenreRestController {

	@Inject
	GenreService genre_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';

	@PostMapping(value = "findindex",
					consumes = "application/json",
					produces = "application/json; charset=UTF-8")
	public List<Genre> enabledGenreRestCon(@RequestBody Genre genre) {
		log.info("=========== enabledGenreRestCon ============");

		String word = genre.getGenre_name();
		log.info(word);

		if (word == null || word.equals("")) {
			log.info("전체보기");
			return genre_service.selectAllGenreList(ENABLED);
			
		} else {
			return genre_service.getFindGenreList(word, ENABLED);
		}
		
	}
	

	@PostMapping(value = "findDeletedindex",
					consumes = "application/json",
					produces = "application/json; charset=UTF-8")
	public List<Genre> disabledGenreRestCon(@RequestBody Genre genre) {
		log.info("=========== disabledGenreRestCon ============");

		String word = genre.getGenre_name();
		log.info(word);

		if (word == null || word.equals("")) {
			log.info("전체보기");
			return genre_service.selectAllGenreList(DISABLED);
			
		} else {
			return genre_service.getFindGenreList(word, DISABLED);
		}
		
	}
	
	@PatchMapping(value = "add", 
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Genre> addGenre(@RequestBody Genre genre){
		log.info("========= addGenre ===========");
		
		String word = genre.getSearching_word();
		
		genre_service.addGenre(genre.getGenre_name());
		
		if (word == null || word.equals("")) {
			return genre_service.selectAllGenreList(ENABLED);
			
		} else {
			return  genre_service.getFindGenreList(word, ENABLED);
		}		
	}
	
	
	@PatchMapping(value = "update", 
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Genre> updateGenre(@RequestBody Genre genre){
		log.info("========= updateGenre ===========");
		
		String word = genre.getSearching_word();
		
		genre_service.updateGenre(genre.getGenre_id(), genre.getGenre_name());
		
		if (word == null || word.equals("")) {
			return genre_service.selectAllGenreList(ENABLED);
			
		} else {
			return  genre_service.getFindGenreList(word, ENABLED);
		}
	}
	
	
	@PatchMapping(value = "delete", 
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Genre> deleteGenre(@RequestBody Genre genre){
		log.info("========= deleteGenre ===========");
		String word = genre.getSearching_word();
		
		genre_service.deleteOrRecovertGenre(genre.getGenre_id(), DISABLED);
		
		if (word == null || word.equals("")) {
			return genre_service.selectAllGenreList(ENABLED);
			
		} else {
			return  genre_service.getFindGenreList(word, ENABLED);
		}
	}
	
	
	@PatchMapping(value = "recovery", 
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Genre> recoveryGenre(@RequestBody Genre genre){
		log.info("========= recoveryGenre ===========");
		
		String word = genre.getSearching_word();
		
		genre_service.deleteOrRecovertGenre(genre.getGenre_id(), ENABLED);
		
		if (word == null || word.equals("")) {
			return genre_service.selectAllGenreList(DISABLED);
			
		} else {
			return  genre_service.getFindGenreList(word, DISABLED);
		}
	}
}
