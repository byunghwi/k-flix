package com.kflix.mapper;

import java.util.List;

import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;

public interface WatchMapper {
	
	public List<MovieVO> getAllmovie();
	
	public MovieVO getmovie(int movie_id);
	
	public int createWatch(WatchVO watch);
	
	public List<WatchVO> getAllwatch();
	
	public List<WatchVO> getSlectWatch(String Email);
	
}
