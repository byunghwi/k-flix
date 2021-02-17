package com.kflix.mapper;

import java.util.List;

import com.kflix.watch.domain.WatchVO;

public interface WatchMapper {
	
	List<WatchVO> getAllwatch();
	WatchVO getwatch(int movie_id);
	
}
