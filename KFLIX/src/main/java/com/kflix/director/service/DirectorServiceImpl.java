package com.kflix.director.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.director.domain.Director;
import com.kflix.mapper.DirectorMapper;
import com.kflix.util.pagenation.domain.PageNation;

@Service
public class DirectorServiceImpl implements DirectorService {

	@Autowired
	DirectorMapper dt_mapper;
	
	@Override
	public List<Director> selectAllDirectorList(char status) {
		return dt_mapper.getAllDirectorList(status);
	}

	@Override
	public String getDirectorName(int director_id) {
		return dt_mapper.getNameById(director_id);
	}

	@Override
	public List<Director> selectPageDirectorList(PageNation pagenation, char status) {
		return dt_mapper.getAllPageDirectorList(pagenation.getPage(), pagenation.getAmount(), status);
	}

	@Override
	public int getCountDirector(char status) {
		return dt_mapper.getDirectorCnt(status);
	}

	@Override
	public List<Director> getFindDirectorList(String director_name, char status) {
		director_name = "%" + director_name + "%";
		return dt_mapper.getFindDirectorList(director_name, status);
	}

	@Override
	public int addDirector(String director_name) {
		return dt_mapper.insertDirector(director_name);
	}

	@Override
	public int updateDirector(int director_id, String director_name) {
		return dt_mapper.updateDirector(director_id, director_name);
	}

	@Override
	public int deleteOrRecovertDirector(int director_id, char status) {
		return dt_mapper.deleteOrRecoveryDirector(director_id, status);
	}

}
