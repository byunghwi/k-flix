package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.genre.domain.Genre;

public interface GenreMapper {

	// 전체 리스트
	List<Genre> getAllGenreList(char status);
	
	/*
	 *  mapper 쿼리문 작성후 서비스 까지 쭉
	 */
	String getGenreName(@Param("genre_id_num") int genre_id_num,
						@Param("movie_id") int moive_id);
}
