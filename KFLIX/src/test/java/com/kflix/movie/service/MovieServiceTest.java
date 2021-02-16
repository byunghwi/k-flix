package com.kflix.movie.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.inject.Inject;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.mapper.MovieMapper;
import com.kflix.movie.domain.Movie;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class MovieServiceTest {

	@Autowired
	MovieService mv_service;
	
	@Inject
	MovieMapper mapper;

	@Test
	@Ignore
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
	
	@Test
	@Ignore
	public void testCountMovie() {
		int result = mv_service.getCountMovie('Y');
		assertTrue(result > 0);
		log.info(result);
	}
	
	
	@Test
	public void testPageing() {
		List<Movie> list = mapper.getPageMovieView(1, 5, 'N');
		assertNotNull(list);
		for(Movie m : list) {
			log.info(m);
		}
	}
}
