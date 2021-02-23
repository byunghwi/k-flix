package com.kflix.ticket.service;

public interface TicketService {
	String getKey(int size);
	String getAuthCode();
	boolean sendAuthMail(String email);
}
