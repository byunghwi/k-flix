package com.kflix.mapper;

import com.kflix.member.domain.Member;

public interface MemberMapper {
	public Member getMemberByEmail(String email);
	public int register(Member member);
}