package com.kflix.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kflix.member.dao.MemberDao;
import com.kflix.member.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDao memberDao;
	
	@Override
	public int register(Member member) {
		return memberDao.register(member);
	}

	@Override
	public Member login(Member member) {
		
		return memberDao.login(member);
	}

}
