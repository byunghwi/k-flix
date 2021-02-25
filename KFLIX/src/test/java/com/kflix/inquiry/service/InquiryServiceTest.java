package com.kflix.inquiry.service;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class InquiryServiceTest {

	@Inject
	InquiryService in_service;
	
	@Test
	public void testConstraint() {
		List<String> con = in_service.getInquiryCosntraint();
		for (int i = 0; i < con.size(); i++) {
			log.info(con.get(i));
		}
	}
	
}
