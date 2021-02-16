package com.kflix.genre.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.genre.domain.Genre;

public interface GenreService {

	public List<Genre> selectAllGenreList(char status);
	
	public int deleteOrRecovertGenre(int gerne_id, char status);
	
	public int addGenre(String genre_name);
	
	public int updateGenre(int gerne_id, String genre_name);
	
	public List<Genre> findGenreByName(String genre_name, char status);
	
	
	
	public String selectGenereName(int genre_id_num, int movie_id);
	
}
