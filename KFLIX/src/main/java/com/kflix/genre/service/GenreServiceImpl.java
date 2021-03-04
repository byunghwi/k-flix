package com.kflix.genre.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.genre.domain.Genre;
import com.kflix.mapper.GenreMapper;
import com.kflix.util.pagenation.domain.PageNation;

@Service
public class GenreServiceImpl implements GenreService {

	@Autowired
	GenreMapper gr_mapper;
	
	@Override
	public List<Genre> selectAllGenreList(char status) {
		return gr_mapper.getAllGenreList(status);
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

	@Override
	public String getGenreName(int genre_id) {
		return gr_mapper.getNameById(genre_id);
	}

	@Override
	public List<Genre> selectPageGenreList(PageNation pagenation, char status) {
		return gr_mapper.getAllPageGenreList(pagenation.getPage(), pagenation.getAmount(), status);
	}

	@Override
	public int getCountGenre(char status) {
		return gr_mapper.getGerneCnt(status);
	}

	@Override
	public List<Genre> getFindGenreList(String genre_name, char status) {
		genre_name = "%" + genre_name + "%";
		return gr_mapper.getFindGenreList(genre_name, status);
	}

	@Override
	public List<Genre> selectAllGenreListNotStatus() {
		return gr_mapper.getGenreList();
	}

}
