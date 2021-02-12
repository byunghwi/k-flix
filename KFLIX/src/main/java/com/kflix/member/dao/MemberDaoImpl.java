package com.kflix.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kflix.member.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	private static final String NAMESPACE = "com.flix.mapper.MemberMapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void register(Member member) {
		sqlSession.insert(NAMESPACE + ".register", member);
	}

}
