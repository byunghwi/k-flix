package com.kflix.director.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.director.domain.Director;
import com.kflix.director.service.DirectorService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/director/*")
@Log4j
public class DirectorRestController {

	@Inject
	DirectorService dt_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	
	@PostMapping(value = "findindex",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Director> enabledDirectorRestCon(@RequestBody Director director) {
		log.info("=========== enabledDirectorRestCon ============");
		String word = director.getDirector_name();
		log.info(word);
		
		if (word == null || word.equals("")) {
			return dt_service.selectAllDirectorList(ENABLED);
			
		}else {
			return dt_service.getFindDirectorList(word, ENABLED);
		}
	}
	
	@PostMapping(value = "findDeletedindex",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Director> disabledDirectorRestCon(@RequestBody Director director) {
		log.info("=========== disabledDirectorRestCon ============");
		String word = director.getDirector_name();
		log.info(word);
		
		if (word == null || word.equals("")) {
			return dt_service.selectAllDirectorList(DISABLED);
			
		}else {
			return dt_service.getFindDirectorList(word, DISABLED);
		}
	}
	
	@PatchMapping(value = "add", 
					consumes = "application/json",
					produces = "application/json; charset=UTF-8")
	public List<Director> addDirector(@RequestBody Director director) {	
		String word = director.getSearching_word();
		
		dt_service.addDirector(director.getDirector_name());
		
		if (word == null || word.equals("")) {
			return dt_service.selectAllDirectorList(ENABLED);				
			
		} else {
			return dt_service.getFindDirectorList(word, ENABLED);
		}
	}
	
	
	@PatchMapping(value = "update", 
					consumes = "application/json",
					produces = "application/json; charset=UTF-8")
	public List<Director> updateDriector(@RequestBody Director director) {
		String word = director.getSearching_word();
		
		dt_service.updateDirector(director.getDirector_id(), director.getDirector_name());
		
		if (word == null || word.equals("")) {
			return dt_service.selectAllDirectorList(ENABLED);				
			
		} else {
			return dt_service.getFindDirectorList(word, ENABLED);
		}
	}
	
	@PatchMapping(value = "delete", 
					consumes = "application/json",
					produces = "application/json; charset=UTF-8")
	public List<Director> deleteDirector(@RequestBody Director director) {
		String word = director.getSearching_word();
		
		dt_service.deleteOrRecovertDirector(director.getDirector_id(), DISABLED);
		
		if (word == null || word.equals("")) {
			return dt_service.selectAllDirectorList(ENABLED);				
			
		} else {
			return dt_service.getFindDirectorList(word, ENABLED);
		}
	}
	
	@PatchMapping(value = "recovery", 
					consumes = "application/json",
					produces = "application/json; charset=UTF-8")
	public List<Director> recoveryDirector(@RequestBody Director director) {
		String word = director.getSearching_word();
		
		dt_service.deleteOrRecovertDirector(director.getDirector_id(), ENABLED);
		
		if (word == null || word.equals("")) {
			return dt_service.selectAllDirectorList(DISABLED);				
			
		} else {
			return dt_service.getFindDirectorList(word, DISABLED);
		}
	}
}
