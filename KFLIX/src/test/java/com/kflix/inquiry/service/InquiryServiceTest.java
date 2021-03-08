package com.kflix.inquiry.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.inquiry.domain.Inquiry;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class InquiryServiceTest {

	@Inject
	InquiryService in_service;
	
	@Inject
	Inquiry inquiry;
	
	int result = 0;
	
	List<Inquiry> list;
	
	@Test
	@Ignore
	public void testConstraint() {
		List<String> con = in_service.getInquiryCosntraint();
		for (int i = 0; i < con.size(); i++) {
			log.info(con.get(i));
		}
	}
	
	
	@Test
	@Ignore
	public void testInsert() {
		inquiry.setEmail("rladudghgh2@naver.com");
		inquiry.setInquiry_type("이용권문의");
		inquiry.setInquiry_title("테스트 제목입니다.");
		inquiry.setInquiry_content("테스트 내용입니다.");
		result = in_service.receiptInquiry(inquiry);
		assertEquals(result, 1);
		
		log.info(inquiry);
	}
	
	@Test
	@Ignore
	public void testGetCnt() {
		result = in_service.getAllInqCnt();
		assertTrue(result > 0);
		log.info("총 문의 개수 : " + result);
	}
	
	@Test
	@Ignore
	public void testPageInq() {
		PageNation page = new PageNation(1, 10);
		list = in_service.getPageInq(page);
		assertNotNull(page);
		
		for(Inquiry p : list) {
			log.info(p);
		}
	}
	
	@Test
	public void testDateNull() {
	
	}
}
