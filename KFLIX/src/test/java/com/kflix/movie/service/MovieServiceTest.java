package com.kflix.movie.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.log4j.Log4j;

@Log4j
public class MovieServiceTest {

	@Autowired
	MovieService mv_service;
	
	@Test
	public void testView() {		
		log.info(mv_service.selectAllMovieVeiw());
	}
	
}
