package com.kflix.watch.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kflix.mapper.WatchMapper;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WatchServiceImpl implements WatchService {

	WatchMapper mapper;
	
	@Override
	public List<MovieVO> getAllmovie() {
		return mapper.getAllmovie();
	}
	
	@Override
	public MovieVO getmovie(int movie_id) {
		return mapper.getmovie(movie_id);
	}

	@Override
	public int createWatch(WatchVO watch) {
		return mapper.createWatch(watch);
	}

	@Override
	public List<WatchVO> getAllwatch() {
		return mapper.getAllwatch();
	}

	@Override
	public List<WatchVO> getSelectWatch(String email) {
		return mapper.getSelectWatch(email);
	}

	@Override
	public int updateWatch(WatchVO watch) {
		return mapper.updateWatch(watch);
	}

	@Override
	public int deleteWatch(WatchVO watch) {
		return mapper.deleteWatch(watch);
	}

	@Override
	public WatchVO getSelectWatchUser(String email, int movie_id) {
		return mapper.getSelectWatchUser(email, movie_id);
	}
}
