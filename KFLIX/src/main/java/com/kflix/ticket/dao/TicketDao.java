package com.kflix.ticket.dao;

import java.util.List;

import com.kflix.ticket.domain.Ticket;

public interface TicketDao {
	List<Ticket> getAllTickets();
	Ticket getTicket(int ticket_id);
}
