package com.kflix.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.mapper.MovieMapper;
import com.kflix.movie.domain.Movie;
import com.kflix.util.pagenation.domain.PageNation;


@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieMapper mv_mapper;
	
	/*
	 * 활성화된 목록, 삭제된 목록
	 */
	@Override
	public List<Movie> selectAllMovieVeiw(char status) {
		return mv_mapper.getAllMovieView(status);
	}
	
	/*
	 * 상세
	 */
	@Override
	public Movie selectMovieById(int movie_id) {
		return mv_mapper.getMovieById(movie_id);
	}
	
	/*
	 * 등록
	 */
	@Override
	public int insertNewMovie(Movie movie) {
		return mv_mapper.addMovie(movie);
	}

	/*
	 *  삭제, 복구
	 */
	@Override
	public int deleteOrRecoveryMovieById(int movie_id, char status) {
		return mv_mapper.deleteOrRecoveryMovie(movie_id, status);
	}

	/*
	 * 수정
	 */
	@Override
	public int updateMovie(Movie movie) {
		return mv_mapper.updateMovie(movie);
	}

	
	/*
	 * 영화의 개수
	 */
	@Override
	public int getCountMovie(char status) {
		return mv_mapper.countMovie(status);
	}

	@Override
	public List<Movie> selectPageMovieView(PageNation pagenation, char status) {
		return mv_mapper.getPageMovieView(pagenation.getPage(), pagenation.getAmount(), status);
	}

}
