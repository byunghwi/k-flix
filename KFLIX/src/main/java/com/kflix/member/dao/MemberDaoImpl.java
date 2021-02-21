package com.kflix.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
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

}
