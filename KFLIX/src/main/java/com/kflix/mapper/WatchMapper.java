package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;

public interface WatchMapper {
	
	// 영화 전체 들고오기
	public List<MovieVO> getAllmovie();
	
	// 영화아이디 영화 검색
	public MovieVO getmovie(int movie_id);
	
	// 이어보기 생성
	public int createWatch(WatchVO watch);
	
	// 이어보기 전체 들고오기
	public List<WatchVO> getAllwatch();
	
	// 이메일별 이어보기 전체 들고오기
	public List<WatchVO> getSelectWatch(String email);
	
	// 이메일의 영화 이어보기 들고오기
	public WatchVO getSelectWatchUser(@Param("email") String email, @Param("movie_id") int movie_id);
	
	// 이메일의 영화 이어보기 업데이트
	public int updateWatch(WatchVO watch);
	
	// 이메일의 영화 이어보기 삭제
	public int deleteWatch(WatchVO watch);
	/*
	 * // 영화 장르 들고오기 public MovieVO getmovieGenre(int movie_id);
	 */
	
	
}
