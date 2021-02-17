package com.kflix.watch.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kflix.mapper.WatchMapper;
import com.kflix.watch.domain.WatchVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WatchServiceImpl implements WatchService {

	WatchMapper mapper;
	
	@Override
	public List<WatchVO> getAllwatch() {
		return mapper.getAllwatch();
	}
	
	@Override
	public WatchVO getwatch(int movie_id) {
		return mapper.getwatch(movie_id);
	}

}
