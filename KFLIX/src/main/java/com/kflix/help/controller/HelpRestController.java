package com.kflix.help.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.help.domain.Help;
import com.kflix.help.service.HelpService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/FQARest/*")
@Log4j
public class HelpRestController {

	@Inject
	HelpService h_service;

	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';

	@PostMapping(value = "index",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Help> indexHelp(@RequestBody Help help) {
		log.info("============ indexHelp ============");
		String word = help.getSearching_word();
		
		if(word.equals("all")) {
			log.info(word);
			return h_service.getAllHelpList(ENABLED);
			
		} else {
			log.info(word);
			return h_service.getAllHelpListByType(word, ENABLED);
		}
		
	}
	
	@PostMapping(value = "dindex",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Help> indexDeletedHelp(@RequestBody Help help) {
		log.info("============ indexHelp ============");
		String word = help.getSearching_word();
		
		if(word.equals("all")) {
			log.info(word);
			return h_service.getAllHelpList(DISABLED);
			
		} else {
			log.info(word);
			return h_service.getAllHelpListByType(word, DISABLED);
		}
		
	}
	
	@PostMapping(value = "add",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Help> addHelp(@RequestBody Help help){
		log.info("========== add =========");
		
		h_service.addHelp(help);
		String word = help.getSearching_word();
		
		if(word.equals("all")) {
			log.info(word);
			return h_service.getAllHelpList(ENABLED);
			
		} else {
			log.info(word);
			return h_service.getAllHelpListByType(word, ENABLED);
		}
	}
	
	
	@PatchMapping(value = "update",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Help> updateHelp(@RequestBody Help help){
		log.info("========== update =========");
		
		h_service.updateHelp(help);
		
		String word = help.getSearching_word();
		
		if(word.equals("all")) {
			log.info(word);
			return h_service.getAllHelpList(ENABLED);
			
		} else {
			log.info(word);
			return h_service.getAllHelpListByType(word, ENABLED);
		}
	}
	
	@PatchMapping(value = "delete",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Help> deleteHelp(@RequestBody Help help){
		log.info("========== delete =========");
		
		h_service.delOrReHelp(help.getHelp_id(), DISABLED);
		
		String word = help.getSearching_word();
		
		if(word.equals("all")) {
			log.info(word);
			return h_service.getAllHelpList(ENABLED);
			
		} else {
			log.info(word);
			return h_service.getAllHelpListByType(word, ENABLED);
		}
	}
	
	@PatchMapping(value = "reco",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Help> recoHelp(@RequestBody Help help){
		log.info("========== delete =========");
		
		h_service.delOrReHelp(help.getHelp_id(), ENABLED);
		
		String word = help.getSearching_word();
		
		if(word.equals("all")) {
			log.info(word);
			return h_service.getAllHelpList(DISABLED);
			
		} else {
			log.info(word);
			return h_service.getAllHelpListByType(word, DISABLED);
		}
	}
	
}
