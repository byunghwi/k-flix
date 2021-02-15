package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.movie.domain.Movie;

public interface MovieMapper {

	/*
	 * 전체 리스트 , Y or N
	 */
	List<Movie> getAllMovieView(char status);
	
	// 상세
	Movie getMovieById(int movie_id);
	
	// 추가
	int addMovie(Movie movie);
	
	/*
	 * 삭제 / 복구 , Y or N
	 */
	int deleteOrRecoveryMovie(
						@Param("movie_id") int movie_id, 
						@Param("status") char status);
	
	// 수정
	int updateMovie(Movie movie);

	
}
