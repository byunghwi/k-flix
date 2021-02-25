package com.kflix.inquiry.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class InquiryController {

	
	
	@RequestMapping(value = "/inquiry",  method = RequestMethod.GET)
	public String inqure() {
		
		
		return "inquiry/form";
	}
	
}
