package com.kflix.director.service;

import java.util.List;

import com.kflix.director.domain.Director;

public interface DirectorService {

	public List<Director> selectAllDirectorList();
	
	public String getDirectorName(int director_id);
}
