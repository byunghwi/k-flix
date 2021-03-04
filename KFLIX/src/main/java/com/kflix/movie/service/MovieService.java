package com.kflix.movie.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.movie.domain.Movie;
import com.kflix.movie.domain.TopFiveMovie;
import com.kflix.util.pagenation.domain.PageNation;

public interface MovieService {

	// 활성화된 목록, 삭제된 목록
	public List<Movie> selectAllMovieVeiw(char status);

	// 상세
	public Movie selectMovieById(int movie_id);
	public Movie selectMovieViewById(int movie_id);
	
	// 등록
	public int insertNewMovie(Movie movie);
		
	// 삭제, 복구
	public int deleteOrRecoveryMovieById(int movie_id, char status);

	// 수정
	public int updateMovie(Movie movie);

	// 활성화된 영화의 개수
	public int getCountMovie(char status);
	
	// 페이징 무비
	public List<Movie> selectPageMovieView(PageNation pagenation, char status);

	/*
	 * 날짜체크
	 */
	boolean checkDate(Movie movie);
	
	// 검색
	public List<Movie> findPageMovieByTitle(PageNation pagenation, String movie_title, char status);
	
	
	public int getCntFindMovieTitle(String word, char status);
	
	// 검색
	public List<Movie> findMovieByTitle(String word, char status);

	public List<Movie> findMovieByRegDate(String reg_date, char status);
	
	public List<Movie> findMovieByGenreName(String genre_name, char status);
	
	public List<Movie> findMovieByDirectName(String director_name, char status);

	public List<TopFiveMovie> getTop5Movie();
}
