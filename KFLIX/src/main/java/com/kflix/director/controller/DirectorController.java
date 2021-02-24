package com.kflix.director.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kflix.director.service.DirectorService;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/director/*")
public class DirectorController {

	@Inject
	DirectorService dt_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	@GetMapping("directorindex")
	public String directorIndex(Model model, PageNation pagenation) {
		pagenation.setAmount(10);
		model.addAttribute("director", dt_service.selectPageDirectorList(pagenation, ENABLED));
		model.addAttribute("page", pagenation.getPageData(10, dt_service.getCountDirector(ENABLED)));
		return "director/directorindex";
	}
	
	@GetMapping("deletedDirector")
	public String deletedDirectorIndex(Model model, PageNation pagenation) {
		pagenation.setAmount(10);
		model.addAttribute("director", dt_service.selectPageDirectorList(pagenation, DISABLED));
		model.addAttribute("page", pagenation.getPageData(10, dt_service.getCountDirector(DISABLED)));
		return "director/deletedDirector";
	}
	
}
