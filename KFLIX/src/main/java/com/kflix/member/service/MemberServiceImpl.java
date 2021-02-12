package com.kflix.member.service;

import org.springframework.stereotype.Service;

import com.kflix.member.dao.MemberDao;
import com.kflix.member.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	MemberDao memberDao;
	
	@Override
	public void register(Member member) {
		memberDao.register(member);
	}

}
