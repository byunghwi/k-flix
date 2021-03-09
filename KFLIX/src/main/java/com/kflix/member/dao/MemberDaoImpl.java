package com.kflix.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kflix.member.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	private static final String NAMESPACE = "com.kflix.mapper.MemberMapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int register(Member member) {
		System.out.println("memdaoImpl까지 진입 성공");
	
		return sqlSession.insert(NAMESPACE + ".register", member);
	}

	@Override
	public Member login(Member member) {
		
		return sqlSession.selectOne(NAMESPACE + ".login", member);
	}

	@Override
	public void keepLogin(String email, String session_id, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("sessionId", session_id);
		paramMap.put("next", next);
		
		sqlSession.update(NAMESPACE + ".keepLogin", paramMap);
		
	}

	@Override
	public Member checkMemWithSessionKey(String value) {
		return sqlSession.selectOne(NAMESPACE + ".checkMemWithSessionKey", value);
	}

	@Override
	public int checkEmail(String email) {
		return sqlSession.selectOne(NAMESPACE+ ".checkEmail", email);
	}

	@Override
	public int emailAuth(String email) {
		return sqlSession.update(NAMESPACE + ".emailAuth", email);
		
	}

	@Override
	public Member getMemberByEmail(String email) {
		return sqlSession.selectOne(NAMESPACE + ".getMemberByEmail", email);
	}

	@Override
	public int updatePayMember(Member member) {
		return sqlSession.update(NAMESPACE + ".updatePayMember", member);
	}

	@Override
	public int removePayMember(String email) {
		
		return sqlSession.update(NAMESPACE + ".removePayMember", email);
	}

	@Override
	public List<Member> schedulePayMemList() {
		return sqlSession.selectList(NAMESPACE + ".schedulePayMemList");
	}

	@Override
	public List<Member> scheduleDelPayMemList() {
		return sqlSession.selectList(NAMESPACE + ".scheduleDelPayMemList");
	}

	@Override
	public int modifyMem(Member member) {
		return sqlSession.update(NAMESPACE + ".modifyMem", member);
	}

}
