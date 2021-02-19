package com.kflix.watch.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;

import lombok.Data;

public interface WatchService {
	
	public List<MovieVO> getAllmovie();
	
	public List<WatchVO> getAllwatch();
	
	public MovieVO getmovie(int movie_id);
	
	public List<WatchVO> getSelectWatch(String email);
	
	public WatchVO getSelectWatchUser(String email, int movie_id);
	
	public int createWatch(WatchVO watch);
	
	public int updateWatch(WatchVO watch);
	
	public int deleteWatch(WatchVO watch);
	/*
	 * public MovieVO getmovieGenre(int movie_id);
	 */
	
}