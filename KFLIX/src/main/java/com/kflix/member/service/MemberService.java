package com.kflix.member.service;

import com.kflix.member.domain.Member;

public interface MemberService {
	//회원가입
	int register(Member member);
	//로그인
	Member login(Member member);
}
