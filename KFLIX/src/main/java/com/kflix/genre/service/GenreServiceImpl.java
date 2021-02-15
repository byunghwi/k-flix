package com.kflix.genre.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.genre.domain.Genre;
import com.kflix.mapper.GenreMapper;

@Service
public class GenreServiceImpl implements GenreService {

	@Autowired
	GenreMapper gr_mapper;
	
	@Override
	public List<Genre> selectAllGenreList() {
		return gr_mapper.getAllGenreList();
	}

}
