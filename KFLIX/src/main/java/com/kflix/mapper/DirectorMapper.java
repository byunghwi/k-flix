package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.director.domain.Director;

public interface DirectorMapper {
	
	List<Director> getAllDirectorList(char status);

	// 페이지
	List<Director> getAllPageDirectorList(
			@Param("page") int page,
			@Param("amount") int amount,
			@Param("status") char status);
	
	// 페이지위한 전체 수
	int getDirectorCnt(char status);
	
	// 배우 이름으로 찾기 스탯 
	List<Director> getFindDirectorList(@Param("director_name") String director_name, @Param("status") char status);
	
	// 추가
	int insertDirector(String director_name);
	
	// 수정
	int updateDirector(
			@Param("director_id") int director_id,
			@Param("director_name") String director_name
	);
	
	// 삭제 복구 
	int deleteOrRecoveryDirector(
			@Param("director_id") int director_id,
			@Param("status") char status
	);
	
	
	String getNameById(int director_id);
}
