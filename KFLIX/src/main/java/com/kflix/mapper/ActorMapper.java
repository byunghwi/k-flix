package com.kflix.mapper;

import java.util.List;

import com.kflix.actor.domain.Actor;

public interface ActorMapper {

	List<Actor> getAllActorList();
	
	String getNameById(int actor_id);
	
}
