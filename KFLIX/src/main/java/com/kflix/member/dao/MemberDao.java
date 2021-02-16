package com.kflix.member.dao;

import com.kflix.member.domain.Member;

public interface MemberDao {
	//회원가입
	int register(Member member);
	Member login(Member member);
}
