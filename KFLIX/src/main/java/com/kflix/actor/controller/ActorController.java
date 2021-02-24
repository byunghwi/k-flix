package com.kflix.actor.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kflix.actor.service.ActorService;
import com.kflix.genre.controller.GenreController;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/actor/*")
public class ActorController {

	@Inject
	ActorService ac_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	@GetMapping("actorindex")
	public String actorIndex(Model model, PageNation pagenation) {
		pagenation.setAmount(10);
		model.addAttribute("actor", ac_service.selectPageActorList(pagenation, ENABLED));
		model.addAttribute("page", pagenation.getPageData(10, ac_service.getCountActor(ENABLED)));
		return "actor/actorindex";
	}
	
	@GetMapping("deletedActor")
	public String deletedActorIndex(Model model, PageNation pagenation) {
		pagenation.setAmount(10);
		model.addAttribute("actor", ac_service.selectPageActorList(pagenation, DISABLED));
		model.addAttribute("page", pagenation.getPageData(10, ac_service.getCountActor(DISABLED)));
		return "actor/deletedActor";
	}
	
	
}
