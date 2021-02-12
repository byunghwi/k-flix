package com.kflix.member.dao;

import com.kflix.member.domain.Member;

public interface MemberDao {
	//회원가입
	void register(Member member);
}
