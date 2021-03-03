package com.kflix.genre.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.genre.domain.Genre;
import com.kflix.util.pagenation.domain.PageNation;

public interface GenreService {
	
	public List<Genre> selectAllGenreListNotStatus();

	public List<Genre> selectAllGenreList(char status);
	
	public List<Genre> selectPageGenreList(PageNation pagenation, char status);
	
	public int getCountGenre(char status);
	
	public List<Genre> getFindGenreList(String genre_name, char status);
	
	public int deleteOrRecovertGenre(int gerne_id, char status);
	
	public int addGenre(String genre_name);
	
	public int updateGenre(int gerne_id, String genre_name);
	
	public List<Genre> findGenreByName(String genre_name, char status);
	
	public String getGenreName(int genre_id);
	
	
}
