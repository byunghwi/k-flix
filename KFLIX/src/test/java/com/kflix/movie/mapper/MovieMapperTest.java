package com.kflix.movie.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.log4j.Log4j;

@Log4j
public class MovieMapperTest {

	@Autowired
	MovieMapper mv_mapper;
	

	@Test
	public void testMovieView() {
		log.info(mv_mapper.getAllMovieView());
		
	}
	
}
