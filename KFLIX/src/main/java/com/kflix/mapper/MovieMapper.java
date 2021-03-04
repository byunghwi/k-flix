package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.movie.domain.Movie;
import com.kflix.movie.domain.TopFiveMovie;

public interface MovieMapper {

	/*
	 * 목록 보여주기 활성 / 비활성
	 */
	List<Movie> getAllMovieView(char status);
	
	// 영화 상세
	Movie getMovieById(int movie_id);
	
	Movie getMovieViewById(int movie_id);
	
	// 영화 등록
	int addMovie(Movie movie);
	
	/*
	 * 활성 / 비활성
	 */
	int deleteOrRecoveryMovie(
						@Param("movie_id") int movie_id, 
						@Param("status") char status);
	
	// 수정
	int updateMovie(Movie movie);

	// 활성화 개수
	int countMovie(char status);

	List<Movie> getPageMovieView(
							@Param("page") int page,
							@Param("amount") int amount,
							@Param("status") char status);
	
	// 제목 검색 + 페이징
	List<Movie> findPageMovieViewByTitle(
			@Param("page") int page, @Param("amount") int amount, 
			@Param("movie_title") String movie_title, @Param("status") char status);
	
	int getCntByFindMovieTitle(@Param("word") String word, @Param("status") char status);
	
	List<TopFiveMovie> getDashboardMovie();
	
	/*
	 * 레스트
	 */
	
	// 제목 검색
	List<Movie> findMovieByTitle(@Param("search_word") String search_word, @Param("status") char status);
	// 등록일 검색
	List<Movie> findMovieByRegDate( @Param("reg_date") String  reg_date, @Param("status") char status);
	// 장르 검색
	List<Movie> findMovieByGenreName( @Param("genre_name") String  genre_name, @Param("status") char status);
	// 감독 검색
	List<Movie> findMovieByDirectName( @Param("direc_name") String  direc_name, @Param("status") char status);
}
