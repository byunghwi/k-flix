package com.kflix.mapper;

import java.util.List;
import java.util.Map;

public interface ExcelMapper {
	
	// 영화 전체맵 들고오기
	public List<Map<String, Object>> getAllmoviemap();
	
	// 멤버 전체맵 들고오기
	public List<Map<String, Object>> getAllmember();

}
