package com.kflix.member.dao;

import java.util.Date;

import com.kflix.member.domain.Member;

public interface MemberDao {
	//회원가입
	int register(Member member);
	Member login(Member member);
	void keepLogin(String email, String session_id, Date next);
	Member checkMemWithSessionKey(String value);
}
