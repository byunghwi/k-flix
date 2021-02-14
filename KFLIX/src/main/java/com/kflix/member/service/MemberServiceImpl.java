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
	public void register(Member member) {
		System.out.println("memberServiceImpl까지 진입 성공 ");
		memberDao.register(member);
	}

}
