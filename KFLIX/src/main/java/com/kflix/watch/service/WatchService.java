package com.kflix.watch.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.genre.domain.Genre;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.domain.WishVO;

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
	
	public int createWish(WishVO wish);
	
	public List<WishVO> getSelectWish(String email);
	
	public int deleteWish(WishVO wish);
	
	public WishVO getSelectWishUser(String email, int movie_id);
	
	public List<Genre> getAllGenre();
}