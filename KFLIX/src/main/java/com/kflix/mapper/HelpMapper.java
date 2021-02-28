package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.help.domain.Help;

public interface HelpMapper {

	List<Help> selectPageHelp(@Param("page") int page,
									@Param("amount") int amount,
									@Param("status") char status);
	
	int selectCntHelp(char status);
	
	List<Help> selectAllHelp(char status);
	
	// type별로 검색 type, status -> Help
	List<Help> selectAllHelpByType(@Param("type") String type, 
									@Param("status") char status);
	
	// 추가 Help -> int
	int insertHelp(Help help);
	
	// 수정 Help객체 -> int
	int updateHelp(Help help);
	
	// 삭제,복구 id, status -> int
	int delOrReHelp(@Param("help_id") int help_id, 
					@Param("status") char status);
	
	List<String> getAllHelpType();
	
	List<Help> getHelpWithRownum(String type);
}
