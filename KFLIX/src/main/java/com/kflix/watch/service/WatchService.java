package com.kflix.watch.service;

import java.util.List;

import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;

import lombok.Data;

public interface WatchService {
	
	public List<MovieVO> getAllmovie();
	public List<WatchVO> getAllwatch();
	
	public MovieVO getmovie(int movie_id);
	public WatchVO getwatch(String Email);
	
	public int createWatch(WatchVO watch);
	
}