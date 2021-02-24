package com.kflix.director.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.director.domain.Director;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class DirectorServiceTest {

	@Autowired
	DirectorService service;
	
	@Test
	public void serviceTest() {
		assertNotNull(service.selectAllDirectorList('N'));
		log.info(service.selectAllDirectorList('N'));
	}
	
	@Test
	@Ignore
	public void testPageList() {
		PageNation pagenation = new PageNation();
		pagenation.setPage(1);
		pagenation.setAmount(10);
		List<Director> list = service.selectPageDirectorList(pagenation, 'Y');
		
		assertNotNull(list);
		
		log.info("========== PageList =========");
		for(Director ac : list) {
			log.info(ac);
		}
	}
	
	@Test
	@Ignore
	public void testGetCnt() {
		int result = service.getCountDirector('Y');
		assertTrue(result > 0);
		log.info(result);
	}
	
	@Test 
	@Ignore
	public void testFindList() {
		List<Director> list = service.getFindDirectorList("븐", 'Y');
		assertNotNull(list);
		log.info("========== testFindList =========");
		log.info(list);
	}
	
	@Test
	@Ignore
	public void testAddActor() {
		int result = service.addDirector("데이빗 베니오프");
		assertEquals(result, 1);
	}
	
	@Test
	@Ignore
	public void testUpdateActor() {
		int result = service.updateDirector(5, "브라이언 커크");
		assertEquals(result, 1);
	}
	
	@Test
	@Ignore
	public void testDRActor() {
		int result = service.deleteOrRecovertDirector(6, 'N');
		assertEquals(result, 1);
	}
}
