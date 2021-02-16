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
	public List<Genre> selectAllGenreList(char status) {
		return gr_mapper.getAllGenreList(status);
	}

	@Override
	public String selectGenereName(int genre_id_num, int movie_id) {
		return gr_mapper.getGenreName(genre_id_num, movie_id);
	}

	@Override
	public int addGenre(String genre_name) {
		return gr_mapper.insertGenre(genre_name);
	}

	@Override
	public int updateGenre(int gerne_id, String genre_name) {
		return gr_mapper.updateGenre(gerne_id, genre_name);
	}

	@Override
	public int deleteOrRecovertGenre(int gerne_id, char status) {
		return gr_mapper.deleteOrRecoveryGenre(gerne_id, status);
	}

	@Override
	public List<Genre> findGenreByName(String genre_name, char status) {
		return gr_mapper.getGenreByName(genre_name, status);
	}

}
