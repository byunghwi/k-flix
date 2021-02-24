package com.kflix.actor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.actor.domain.Actor;
import com.kflix.mapper.ActorMapper;
import com.kflix.util.pagenation.domain.PageNation;

@Service
public class ActorServiceImpl implements ActorService{

	@Autowired
	ActorMapper at_mapper;
	
	@Override
	public List<Actor> selectAllActorList(char status) {
		return at_mapper.getAllActorList(status);
	}

	@Override
	public String getActorName(int actor_id) {
		return at_mapper.getNameById(actor_id);
	}

	@Override
	public List<Actor> selectPageActorList(PageNation pagenation, char status) {
		return at_mapper.getAllPageActorList(pagenation.getPage(), pagenation.getAmount(), status);
	}

	@Override
	public int getCountActor(char status) {
		return at_mapper.getActorCnt(status);
	}

	@Override
	public List<Actor> getFindActorList(String actor_name, char status) {
		actor_name = "%" + actor_name + "%";
		return at_mapper.getFindActorList(actor_name, status);
	}

	@Override
	public int addActor(String actor_name) {
		return at_mapper.insertActor(actor_name);
	}

	@Override
	public int updateActor(int actor_id, String actor_name) {
		return at_mapper.updateActor(actor_id, actor_name);
	}

	@Override
	public int deleteOrRecovertActor(int actor_id, char status) {
		return at_mapper.deleteOrRecoveryActor(actor_id, status);
	}

}
