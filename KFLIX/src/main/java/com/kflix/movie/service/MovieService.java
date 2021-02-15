package com.kflix.movie.service;

import java.util.List;

import com.kflix.movie.domain.Movie;

public interface MovieService {

	// 활성화된 목록, 삭제된 목록
	public List<Movie> selectAllMovieVeiw(char status);

	// 상세
	public Movie selectMovieById(int movie_id);
	
	// 등록
	public int insertNewMovie(Movie movie);
		
	// 삭제, 복구
	public int deleteOrRecoveryMovieById(int movie_id, char status);

	// 수정
	public int updateMovie(Movie movie);

	
}
