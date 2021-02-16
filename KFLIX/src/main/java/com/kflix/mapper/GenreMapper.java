package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.genre.domain.Genre;

public interface GenreMapper {

	// 전체 리스트
	List<Genre> getAllGenreList(char status);
	
	int insertGenre(String genre_name);
	
	int updateGenre(
			@Param("genre_id") int genre_id,
			@Param("genre_name") String genre_name
	);
	
	int deleteOrRecoveryGenre(
			@Param("genre_id") int genre_id,
			@Param("status") char status
	);
	
	List<Genre> getGenreByName(String genre_name);
	
	/*
	 *  재검토
	 */
	String getGenreName(@Param("genre_id_num") int genre_id_num,
						@Param("movie_id") int movie_id);
}
