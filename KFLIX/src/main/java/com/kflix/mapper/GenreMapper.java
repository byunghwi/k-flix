package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.genre.domain.Genre;

public interface GenreMapper {

	
	List<Genre> getGenreList();
	
	// 전체 리스트
	List<Genre> getAllGenreList(char status);
	
	List<Genre> getAllPageGenreList(
			@Param("page") int page,
			@Param("amount") int amount,
			@Param("status") char status);
	
	int getGerneCnt(char status);
	
	List<Genre> getFindGenreList(@Param("genre_name") String genre_name, @Param("status") char status);
	
	int insertGenre(String genre_name);
	
	int updateGenre(
			@Param("genre_id") int genre_id,
			@Param("genre_name") String genre_name
	);
	
	int deleteOrRecoveryGenre(
			@Param("genre_id") int genre_id,
			@Param("status") char status
	);
	
	List<Genre> getGenreByName(
			@Param("genre_name") String genre_name,
			@Param("status") char status
		);
	
	
	String getNameById(int genre_id);
}
