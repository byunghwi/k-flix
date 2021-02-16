package com.kflix.member.dao;

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

}
