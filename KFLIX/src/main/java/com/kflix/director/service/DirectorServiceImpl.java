package com.kflix.director.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.director.domain.Director;
import com.kflix.mapper.DirectorMapper;

@Service
public class DirectorServiceImpl implements DirectorService {

	@Autowired
	DirectorMapper dt_mapper;
	
	@Override
	public List<Director> selectAllDirectorList() {
		return dt_mapper.getAllDirectorList();
	}

}
