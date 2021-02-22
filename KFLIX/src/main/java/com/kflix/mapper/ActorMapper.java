package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.actor.domain.Actor;

public interface ActorMapper {

	List<Actor> getAllActorList(char status);
	
	// 페이지
	List<Actor> getAllPageActorList(
			@Param("page") int page,
			@Param("amount") int amount,
			@Param("status") char status);
	
	// 페이지위한 전체 수
	int getActorCnt(char status);
	
	// 배우 이름으로 찾기 스탯 
	List<Actor> getFindActorList(@Param("actor_name") String actor_name, @Param("status") char status);
	
	// 추가
	int insertActor(String actor_name);
	
	// 수정
	int updateActor(
			@Param("actor_id") int actor_id,
			@Param("actor_name") String actor_name
	);
	
	// 삭제 복구 
	int deleteOrRecoveryActor(
			@Param("actor_id") int actor_id,
			@Param("status") char status
	);
	
	
	
	String getNameById(int actor_id);
}
