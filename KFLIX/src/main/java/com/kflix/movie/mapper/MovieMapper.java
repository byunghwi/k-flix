package com.kflix.movie.mapper;

import java.util.List;

import com.kflix.movie.domain.Movie;

public interface MovieMapper {

	// 전체
	List<Movie> getAllMovieView();
	
	// 상세
	Movie getMovieById(int movie_id);
	
	// 추가
	int addMovie(Movie movie);
	
	// 삭제
	int deleteMovie(int movie_id);
	
	// 수정
	int updateMovie(Movie movie);
	
}
