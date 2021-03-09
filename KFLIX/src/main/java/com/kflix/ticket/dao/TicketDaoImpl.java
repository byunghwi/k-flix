package com.kflix.ticket.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kflix.ticket.domain.Ticket;

@Repository
public class TicketDaoImpl implements TicketDao {

	private static final String NAMESPACE = "com.kflix.mapper.TicketMapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<Ticket> getAllTickets() {
		return sqlSession.selectList(NAMESPACE + ".ticketAll");
	}

	@Override
	public Ticket getTicket(int ticket_id) {
		System.out.println("ticketDao 들엉모");
		return sqlSession.selectOne(NAMESPACE + ".getTicket", ticket_id);
	}

}
