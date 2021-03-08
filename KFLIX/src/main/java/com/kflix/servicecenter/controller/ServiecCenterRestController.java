package com.kflix.servicecenter.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.help.domain.Help;
import com.kflix.help.service.HelpService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class ServiecCenterRestController {

	@Inject
	HelpService hp_service;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';

	@PostMapping(value="FAQ/user",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Help> userFAQView(@RequestBody Help help){
		log.info("=============== 유저 뷰 레스트 ==================");	
		String type = help.getHelp_type();
		
		
		if (type.equals("all")) {
			return hp_service.getAllHelpList(ENABLED);
			
		} else {
			return hp_service.getAllHelpListByType(type, ENABLED);
		}
	}
	
}
