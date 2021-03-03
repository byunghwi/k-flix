package com.kflix.manage.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kflix.inquiry.service.InquiryService;
import com.kflix.manage.service.ManageService;
import com.kflix.movie.service.MovieService;

@Controller
public class ManageController {

	@Inject
	MovieService mv_service;
	
	@Inject
	InquiryService iq_service;
	
	@Inject
	ManageService mg_service;
	
	@RequestMapping(value="/management", method=RequestMethod.GET)
	public String manageMain(Model model) {
		model.addAttribute("movie", mv_service.getTop5Movie());
		model.addAttribute("movieTotal", mv_service.getCountMovie('Y'));
		model.addAttribute("inqTotal", iq_service.getAllInqCnt());
		model.addAttribute("ticket", mg_service.getTicketBoard());
		return "manage/managemain";
	}
	
}
