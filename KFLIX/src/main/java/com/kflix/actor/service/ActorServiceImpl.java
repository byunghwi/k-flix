package com.kflix.actor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.actor.domain.Actor;
import com.kflix.mapper.ActorMapper;

@Service
public class ActorServiceImpl implements ActorService{

	@Autowired
	ActorMapper at_mapper;
	
	@Override
	public List<Actor> selectAllActorList() {
		return at_mapper.getAllActorList();
	}

	@Override
	public String getActorName(int actor_id) {
		return at_mapper.getNameById(actor_id);
	}

}
