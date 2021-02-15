package com.kflix.movie.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.movie.domain.Movie;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class MovieServiceTest {

	@Autowired
	MovieService mv_service;

	@Test
	public void testView() {		
		assertNotNull(mv_service.selectAllMovieVeiw('Y'));
		log.info(mv_service.selectAllMovieVeiw('Y'));

	}
	
	@Test
	@Ignore
	public void selectOne() {
		assertNotNull(mv_service.selectMovieById(4));
		log.info(mv_service.selectMovieById(4));
	}
	
}
