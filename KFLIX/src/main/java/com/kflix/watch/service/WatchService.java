package com.kflix.watch.service;

import java.util.List;

import com.kflix.watch.domain.WatchVO;

import lombok.Data;

public interface WatchService {
	
	public List<WatchVO> getAllwatch();
	public WatchVO getwatch(int movie_id);
}
