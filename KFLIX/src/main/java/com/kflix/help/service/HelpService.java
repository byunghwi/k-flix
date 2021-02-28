package com.kflix.help.service;

import java.util.List;

import com.kflix.help.domain.Help;
import com.kflix.util.pagenation.domain.PageNation;

public interface HelpService {

	List<Help> getPageHelp(PageNation pagenation, char status);
	
	// 전체 길이 status -> int
	int getCntHelpList(char status);
	
	// 전체 조회 status -> Help
	List<Help> getAllHelpList(char status); 
	
	// type별로 검색 type, status -> Help
	List<Help> getAllHelpListByType(String type, char status);
	
	// 추가 Help -> int
	int addHelp(Help help);
	
	// 수정 Help객체 -> int
	int updateHelp(Help help);
	
	// 삭제,복구 id, status -> int
	int delOrReHelp(int help_id, char status);
	
	List<String> getAllHelpType();
	
	List<Help> getHelpWithRownum(String type);
}
