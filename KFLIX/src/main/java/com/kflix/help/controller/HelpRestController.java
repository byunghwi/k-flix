package com.kflix.help.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.help.domain.Help;
import com.kflix.help.service.HelpService;
import com.kflix.util.pagenation.domain.PageNation;

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
		
		return h_service.getAllHelpList(ENABLED);
	}
}
