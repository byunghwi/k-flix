package com.kflix.director.service;

import java.util.List;

import com.kflix.director.domain.Director;
import com.kflix.util.pagenation.domain.PageNation;

public interface DirectorService {

	public List<Director> selectAllDirectorList(char status);
	
	public String getDirectorName(int director_id);

//	// 페이지
	public List<Director> selectPageDirectorList(PageNation pagenation, char status);
//	
//	// 페이지위한 전체 수
	public int getCountDirector(char status);
	
//	// 배우 이름으로 찾기 스탯 
	public List<Director> getFindDirectorList(String director_name, char status);
	
//	// 추가
	public int addDirector(String director_name);
	
//	// 수정
	public int updateDirector(int director_id, String director_name);

	//	// 삭제 복구 
	public int deleteOrRecovertDirector(int director_id, char status);
}
