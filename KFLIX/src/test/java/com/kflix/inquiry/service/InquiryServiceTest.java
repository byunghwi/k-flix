package com.kflix.inquiry.service;

import static org.junit.Assert.assertEquals;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.inquiry.domain.Inquiry;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class InquiryServiceTest {

	@Inject
	InquiryService in_service;
	
	@Inject
	Inquiry inquiry;
	
	@Test
	@Ignore
	public void testConstraint() {
		List<String> con = in_service.getInquiryCosntraint();
		for (int i = 0; i < con.size(); i++) {
			log.info(con.get(i));
		}
	}
	
	
	@Test
	public void testInsert() {
		inquiry.setEmail("rladudghgh2@naver.com");
		inquiry.setInquiry_type("이용권문의");
		inquiry.setInquiry_title("테스트 제목입니다.");
		inquiry.setInquiry_content("테스트 내용입니다.");
		int result = in_service.receiptInquiry(inquiry);
		assertEquals(result, 1);
		
		log.info(inquiry);
	}
	
}
