package com.kflix.member.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kflix.member.domain.Member;

public interface MemberDao {
	//회원가입
	int register(Member member);
	
	//회원가입 중복이메일 체크
	int checkEmail(String email);
	
	//이메일 인증 
	int emailAuth(String email);
	
	//로그인
	Member login(Member member);
	
	//이메일로 회원정보 추출
	Member getMemberByEmail(String email);
	
	void keepLogin(String email, String session_id, Date next);
	
	Member checkMemWithSessionKey(String value);
	
	int updatePayMember(Member member);
	
	int removePayMember(String email);
	
	List<Member> schedulePayMemList();
	
	List<Member> scheduleDelPayMemList();
	
	int modifyMem(Member member);
}
