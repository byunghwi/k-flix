package com.kflix.mapper;

import java.util.List;

import com.kflix.director.domain.Director;

public interface DirectorMapper {
	
	List<Director> getAllDirectorList();

	String getNameById(int director_id);
}
