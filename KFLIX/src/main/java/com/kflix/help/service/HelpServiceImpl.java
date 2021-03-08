package com.kflix.help.service;

import java.util.ArrayList;
import java.util.Collections;
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
		help.setHelp_title("Q." + help.getHelp_title());
		help.setHelp_content("A." + help.getHelp_content());
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
		String[] data = {"이용안내", "결제", "환불", "이용권", "계정", "컨텐츠", "재생", "서비스"};
		List<String> constraints = new ArrayList<>();
		Collections.addAll(constraints, data);
		Collections.sort(constraints);
		return constraints;
	}

	@Override
	public List<Help> getHelpWithRownum(String type) {
		return hMapper.getHelpWithRownum(type);
	}


	
}
