package com.kflix.watch.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.service.WatchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class WatchController {
	
	WatchService service;
	
	@GetMapping("/browse")
	public String getbrowse(Model model) {
		model.addAttribute("movie", service.getAllwatch()); 
		log.info(service.getAllwatch());
		return "/watch/browse";
	}
	
	@PostMapping("/browse/{currentTime:.+}")
	public String getbrowse1(Model model, @PathVariable("currentTime") double currentTime) {
		model.addAttribute("movie", service.getAllwatch()); 
		log.info(currentTime);
		System.out.println(currentTime);
		return "/watch/browse";
	}
	
	
	@GetMapping(value = "/browse/watch/{movie_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getwatch(Model model, @PathVariable("movie_id") int movie_id) {
		model.addAttribute("watch", service.getwatch(movie_id)); 
		
		return "/watch/video";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	private static final Logger logger = LoggerFactory.getLogger(WatchController.class);
	
//	@RequestMapping(value = "/watch")
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
}
