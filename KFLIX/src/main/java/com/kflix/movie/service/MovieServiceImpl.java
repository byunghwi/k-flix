package com.kflix.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.movie.domain.Movie;
import com.kflix.movie.mapper.MovieMapper;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieMapper mv_mapper;
	
	@Override
	public List<Movie> selectAllMovieVeiw() {
		return mv_mapper.getAllMovieView();
	}

}
