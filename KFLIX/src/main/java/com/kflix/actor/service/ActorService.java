package com.kflix.actor.service;

import java.util.List;

import com.kflix.actor.domain.Actor;
import com.kflix.util.pagenation.domain.PageNation;

public interface ActorService {
	
	public List<Actor> selectAllActorList(char status);
	
	public String getActorName(int actor_id);

//	// 페이지
	public List<Actor> selectPageActorList(PageNation pagenation, char status);
//	
//	// 페이지위한 전체 수
	public int getCountActor(char status);
	
//	// 배우 이름으로 찾기 스탯 
	public List<Actor> getFindActorList(String actor_name, char status);
	
//	// 추가
	public int addActor(String actor_name);
	
//	// 수정
	public int updateActor(int actor_id, String actor_name);
//	
//	// 삭제 복구 
	public int deleteOrRecovertActor(int actor_id, char status);
}
