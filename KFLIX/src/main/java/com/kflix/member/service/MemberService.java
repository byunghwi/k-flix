package com.kflix.member.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kflix.member.domain.Member;

public interface MemberService {
	//회원가입
	int register(Member member);
	
	//회원가입 중복이메일 체크
	int checkEmail(String email);
	
	//이메일 인증성공시 cert업데이트
	int updateAuthStatus(String email);
	
	//로그인
	Member login(Member member);
	
	//이메일로 회원정보 추출
	Member getMemberByEmail(String email);
	
	void keepLogin(String email, String session_id, Date next);
	
	Member checkLoginBefore(String value);
	
	int updatePayMember(Member member);
	
	int removePayMember(String email);
	
	List<Member> schedulePayMemList();
}
