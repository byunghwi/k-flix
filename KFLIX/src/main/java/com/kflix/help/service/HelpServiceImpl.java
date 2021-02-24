package com.kflix.help.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kflix.help.domain.Help;
import com.kflix.mapper.HelpMapper;
import com.kflix.util.pagenation.domain.PageNation;

@Service
public class HelpServiceImpl implements HelpService {

	@Inject
	HelpMapper hMapper;
	

	@Override
	public List<Help> getPageHelp(PageNation pagenation, char status) {
		return hMapper.selectPageHelp(pagenation.getPage(), pagenation.getAmount(), status);
	}
	
	@Override
	public int getCntHelpList(char status) {
		return hMapper.selectCntHelp(status);
	}

	@Override
	public List<Help> getAllHelpList(char status) {
		return hMapper.selectAllHelp(status);
	}

	@Override
	public List<Help> getAllHelpListByType(String type, char status) {
		return hMapper.selectAllHelpByType(type, status);
	}

	@Override
	public int addHelp(Help help) {
		return hMapper.insertHelp(help);
	}

	@Override
	public int updateHelp(Help help) {
		return hMapper.updateHelp(help);
	}

	@Override
	public int delOrReHelp(int help_id, char status) {
		return hMapper.delOrReHelp(help_id, status);
	}

	@Override
	public List<String> getAllHelpType() {
		return hMapper.getAllHelpType();
	}

	@Override
	public List<String> getHelpWithRownum(String type) {
		return hMapper.getHelpWithRownum(type);
	}


	
}
