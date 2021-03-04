package com.kflix.manage.service;

import java.util.List;

import com.kflix.manage.domain.TicketBoard;

public interface ManageService {

	public List<TicketBoard> getTicketBoard();
	
	public int getMemberCnt();
}
