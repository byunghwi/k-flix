package com.kflix.actor.service;

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

import com.kflix.actor.domain.Actor;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class ActorServiceTest {

	@Autowired
	ActorService service;
	
	@Test
	public void actorTest() {
		List<Actor> list = service.selectAllActorList('Y');
		assertNotNull(list);
		for(Actor ac : list) {
			log.info(ac);
		}
	}
	
	@Test
	@Ignore
	public void testPageList() {
		PageNation pagenation = new PageNation();
		pagenation.setPage(1);
		pagenation.setAmount(10);
		List<Actor> list = service.selectPageActorList(pagenation, 'Y');
		
		assertNotNull(list);
		
		log.info("========== PageList =========");
		for(Actor ac : list) {
			log.info(ac);
		}
	}
	
	@Test
	@Ignore
	public void testGetCnt() {
		int result = service.getCountActor('Y');
		assertTrue(result > 0);
		log.info(result);
	}
	
	@Test 
	@Ignore
	public void testFindList() {
		List<Actor> list = service.getFindActorList("김", 'Y');
		assertNotNull(list);
		log.info("========== testFindList =========");
		log.info(list);
	}
	
	@Test
	@Ignore
	public void testAddActor() {
		int result = service.addActor("신세경");
		assertEquals(result, 1);
	}
	
	@Test
	@Ignore
	public void testUpdateActor() {
		int result = service.updateActor(5, "둘리");
		assertEquals(result, 1);
	}
	
	@Test
	@Ignore
	public void testDRActor() {
		int result = service.deleteOrRecovertActor(6, 'N');
		assertEquals(result, 1);
	}
}
