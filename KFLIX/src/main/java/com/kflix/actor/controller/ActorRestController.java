package com.kflix.actor.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.actor.domain.Actor;
import com.kflix.actor.service.ActorService;
import com.kflix.genre.controller.GenreRestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/actor/*")
@Log4j
public class ActorRestController {

	@Inject
	ActorService ac_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	@PostMapping(value = "findindex",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Actor> enabledAcotrRestCon(@RequestBody Actor actor) {
		log.info("=========== enabledAcotrRestCon ============");
		String word = actor.getActor_name();
		log.info(word);
		
		if (word == null || word.equals("")) {
			return ac_service.selectAllActorList(ENABLED);
			
		} else {
			return ac_service.getFindActorList(word, ENABLED);
		}
		
	}
	
	
	@PostMapping(value = "findDeletedindex",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Actor> disabledAcotrRestCon(@RequestBody Actor actor) {
		log.info("=========== disabledAcotrRestCon ============");
		String word = actor.getActor_name();
		log.info(word);
		
		if (word == null || word.equals("")) {
			return ac_service.selectAllActorList(DISABLED);
			
		} else {
			return ac_service.getFindActorList(word, DISABLED);
		}
		
	}
	
	
	@PatchMapping(value = "add", 
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public List<Actor> addActor(@RequestBody Actor actor) {
		String word = actor.getSearching_word();

		ac_service.addActor(actor.getActor_name());
		
		if (word == null || word.equals("")) {
			return ac_service.selectAllActorList(ENABLED);
			
		} else {
			return ac_service.getFindActorList(word, ENABLED);
		}
		
	}
	
	@PatchMapping(value = "update", 
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public List<Actor> updateActor(@RequestBody Actor actor) {
		String word = actor.getSearching_word();

		ac_service.updateActor(actor.getActor_id(), actor.getActor_name());
		
		if (word == null || word.equals("")) {
			return ac_service.selectAllActorList(ENABLED);
			
		} else {
			return ac_service.getFindActorList(word, ENABLED);
		}
	}
	
	
	
	@PatchMapping(value = "delete", 
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public List<Actor> deleteActor(@RequestBody Actor actor) {
		String word = actor.getSearching_word();

		ac_service.deleteOrRecovertActor(actor.getActor_id(), DISABLED);
		
		if (word == null || word.equals("")) {
			return ac_service.selectAllActorList(ENABLED);
			
		} else {
			return ac_service.getFindActorList(word, ENABLED);
		}
	}
	
	
	@PatchMapping(value = "recovery", 
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public List<Actor> recoveryActor(@RequestBody Actor actor) {
		String word = actor.getSearching_word();

		ac_service.deleteOrRecovertActor(actor.getActor_id(), ENABLED);
		
		if (word == null || word.equals("")) {
			return ac_service.selectAllActorList(DISABLED);
			
		} else {
			return ac_service.getFindActorList(word, DISABLED);
		}
	}
	
}
