package com.kflix.movie.service;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.mapper.MovieMapper;
import com.kflix.movie.domain.Movie;
import com.kflix.util.fileupload.FileUploadServiceImpl;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class MovieServiceTest {

	@Inject
	MovieService mv_service;
	
	@Inject
	MovieMapper mapper;
	
	@Inject
	Movie movie;

	@Test
	public void testView() {		
		assertNotNull(mv_service.selectAllMovieVeiw('N'));
		log.info(mv_service.selectAllMovieVeiw('N'));

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
	@Ignore
	public void testPageing() {
		List<Movie> list = mapper.getPageMovieView(1, 5, 'N');
		assertNotNull(list);
		for(Movie m : list) {
			log.info(m);
		}
	}
	
	
	@Test
	@Ignore
	public void testCheckDate() {
		Date today = new Date();
		
		Calendar compare_date = Calendar.getInstance();
		compare_date.setTime(today);
		compare_date.add(Calendar.DATE, -1);
		
		movie.setReg_date(compare_date.getTime());
		movie.setMovie_release(compare_date.getTime());
		
		assertFalse(mv_service.checkDate(movie));
	}

	@Test
	@Ignore
	public void testfind() {
		List<Movie> reg = mv_service.findMovieByRegDate("21/", 'Y');
		List<Movie> genre = mv_service.findMovieByGenreName("코", 'Y');
		List<Movie> direc = mv_service.findMovieByDirectName("봉", 'Y');
		
		assertNotNull(direc);
		assertNotNull(reg);
		assertNotNull(genre);
		
		log.info("reg_date - 21/");
		for(Movie mv : reg) {
			log.info(mv);
		}
		
		log.info("genre - 코");
		for(Movie mv : genre) {
			log.info(mv);
		}
		
		log.info("direc - 봉");
		for(Movie mv : direc) {
			log.info(mv);
		}
	}

}
