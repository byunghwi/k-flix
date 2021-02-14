package com.kflix.director.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class DirectorServiceTest {

	@Autowired
	DirectorService service;
	
	@Test
	public void serviceTest() {
		assertNotNull(service.selectAllDirectorList());
		log.info(service.selectAllDirectorList());
	}
}
