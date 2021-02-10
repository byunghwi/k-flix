package com.kflix.member;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.Date;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kflix.mapper.MemberMapper;
import com.kflix.member.domain.Member;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
@Log4j
public class DatabaseConnectTest {

	@Autowired
	private DataSource ds;

	@Autowired
	private SqlSessionFactory sqlFactory;

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private Member mem;

	@Test
	public void test() throws Exception {

		Connection conn = ds.getConnection();
		log.info(conn);

	}

	@Test
	public void factoryTest() {
		log.info(sqlFactory);
	}

	@Test
	public void sessionTest() {
		SqlSession session = sqlFactory.openSession();

		log.info(session.selectOne("com.kflix.mapper.MemberMapper.getMemberByEmail", "123456"));

	}

}
