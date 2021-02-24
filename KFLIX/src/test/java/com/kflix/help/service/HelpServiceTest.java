package com.kflix.help.service;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.help.domain.Help;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class HelpServiceTest {

	@Inject
	HelpService service;
	
	int result;
	List<Help> list;
	Help help;
	
	@Before
	public void init() {
		help =  new Help();
		result = 2;
		list = new ArrayList<>();
	}
	
	@Test
	@Ignore
	public void testGetCnt() {
		result = service.getCntHelpList('Y');
		assertTrue(result > 0);
		log.info("총 갯수 : " + result);
	}
	
	@Test
	public void testGetAllHelp() {
		list = service.getAllHelpList('Y');
		assertNotNull(list);
		
		log.info("========= AllHelpTest");
		for (Help h : list ) {
			log.info(h);
		}
	}
	
	@Test
	@Ignore
	public void testGetAllHelpByType() {
		list = service.getAllHelpListByType("video", 'Y');
		
		assertNotNull(list);
		
		log.info("========= AllHelpByTypeTest");
		for (Help h : list ) {
			log.info(h);
		}
	}
	
	@Test
	@Ignore
	public void testAddHelp() {
		help.setHelp_type("contents");
		help.setHelp_title("Q. 동영상이 안멈춥니다.");
		help.setHelp_content("정지 버튼을 눌러보세요!");
		result = service.addHelp(help);
		assertEquals(result, 1);
		
		log.info("============ AddHelp");
		log.info("추가 됨 : "+result);
	}
	
	@Test
	@Ignore
	public void testUpdateHelp() {
		help.setHelp_type("video");
		help.setHelp_title("Q. 재생이 안되요 ㅛㅠㅛㅠ");
		help.setHelp_content("마우스를 사서 클릭해 보쇼!");
		help.setHelp_id(2);
		result = service.updateHelp(help);
		assertEquals(result, 1);
		
		log.info("============ UpdateHelp");
		log.info("변경 됨 : "+result);
	}
	
	@Test
	@Ignore
	public void testDelHelp() {
		result = service.delOrReHelp(2, 'N');
		assertEquals(result, 1);
		
		log.info("============ DEleteHelp");
		log.info("삭제 됨 : "+result);
		
	}
}
