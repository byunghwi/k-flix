package com.kflix.genre.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.genre.domain.Genre;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class GenreServiceTest {
	
	@Autowired
	GenreService service;
	
	@Test
	@Ignore
	public void serviceTest() {
		assertNotNull(service.selectAllGenreList('Y'));
		log.info(service.selectAllGenreList('Y'));
	}
	
	@Test
	@Ignore
	public void genreAddTest() {
		int result = service.addGenre("");
		assertEquals(1, result);
	}
	
	
	@Test
	@Ignore
	public void genreUpdateTest	() {
		int result = service.updateGenre(45, "가족2");
		assertEquals(1, result);
		log.info(service.selectAllGenreList('N'));
	}
	
	@Test
	@Ignore
	public void genreDeleteTest	() {
		int result = service.deleteOrRecovertGenre(45, 'N');
		assertEquals(1, result);
		log.info(service.selectAllGenreList('N'));
	}
	
	@Test
	public void testGerneFind() {
		PageNation pagenation = new PageNation();
		pagenation.setPage(1);
		pagenation.setAmount(10);
		
		List<Genre> list = service.selectPageGenreList(pagenation, 'N');
		assertNotNull(list);
		log.info(list.get(0));
	}

	
}
