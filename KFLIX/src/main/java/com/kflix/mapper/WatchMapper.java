package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.genre.domain.Genre;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.domain.WishVO;

public interface WatchMapper {

	// 영화 전체 들고오기
	public List<MovieVO> getAllmovie();
	
	// 영화 top10 들고오기
	public List<MovieVO> getmovieRanking();

	// 영화아이디 영화 검색
	public MovieVO getmovie(int movie_id);

	// 이어보기 전체 들고오기
	public List<WatchVO> getAllwatch();

	// 이메일별 이어보기 전체 들고오기
	public List<WatchVO> getSelectWatch(String email);

	// 이메일의 영화 이어보기 들고오기
	public WatchVO getSelectWatchUser(@Param("email") String email, @Param("movie_id") int movie_id);

	// 이메일의 영화 이어보기 생성
	public int createWatch(WatchVO watch);

	// 이메일의 영화 이어보기 업데이트
	public int updateWatch(WatchVO watch);

	// 이메일의 영화 이어보기 삭제
	public int deleteWatch(WatchVO watch);

	// 이메일의 영화 찜하기 생성
	public int createWish(WishVO wish);

	// 이메일의 영화 찜하기 삭제
	public int deleteWish(WishVO wish);

	// 이메일별 이어보기 전체 들고오기
	public List<WishVO> getSelectWish(String email);
	
	// 이메일의 영화 이어보기 들고오기
	public WishVO getSelectWishUser(@Param("email") String email, @Param("movie_id") int movie_id);
	
	public List<Genre> getAllGenre(); 

}
