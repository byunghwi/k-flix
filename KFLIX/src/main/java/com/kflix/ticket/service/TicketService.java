package com.kflix.ticket.service;

import java.util.List;

import com.kflix.ticket.domain.Ticket;

public interface TicketService {
	String getKey(int size);
	String getAuthCode();
	boolean sendAuthMail(String email);
	List<Ticket> getAllTickets();
	Ticket getTicket(int ticket_id);
}
