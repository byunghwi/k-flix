package com.kflix.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.mapper.MovieMapper;
import com.kflix.movie.domain.Movie;


@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieMapper mv_mapper;
	
	@Override
	public List<Movie> selectAllMovieVeiw(char status) {
		return mv_mapper.getAllMovieView(status);
	}

	@Override
	public Movie selectMovieById(int movie_id) {
		return mv_mapper.getMovieById(movie_id);
	}

	@Override
	public int insertNewMovie(Movie movie) {
		return mv_mapper.addMovie(movie);
	}

	@Override
	public int deleteOrRecoveryMovieById(int movie_id, char status) {
		return mv_mapper.deleteOrRecoveryMovie(movie_id, status);
	}

	@Override
	public int updateMovie(Movie movie) {
		return mv_mapper.updateMovie(movie);
	}

}
