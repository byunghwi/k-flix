package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;

public interface WatchMapper {
	
	public List<MovieVO> getAllmovie();
	
	public MovieVO getmovie(int movie_id);
	
	public int createWatch(WatchVO watch);
	
	public List<WatchVO> getAllwatch();
	
	public List<WatchVO> getSelectWatch(String email);
	
	public WatchVO getSelectWatchUser(@Param("email") String email, @Param("movie_id") int movie_id);
	
	public int updateWatch(WatchVO watch);
	
	public int deleteWatch(WatchVO watch);
	
}
