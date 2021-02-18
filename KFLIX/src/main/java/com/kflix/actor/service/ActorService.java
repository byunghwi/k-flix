package com.kflix.actor.service;

import java.util.List;

import com.kflix.actor.domain.Actor;

public interface ActorService {
	
	public List<Actor> selectAllActorList();
	
	public String getActorName(int actor_id);

}
