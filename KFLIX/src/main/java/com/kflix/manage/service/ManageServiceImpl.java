package com.kflix.manage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kflix.manage.domain.MemberGender;
import com.kflix.manage.domain.MemberView;
import com.kflix.manage.domain.TicketBoard;
import com.kflix.mapper.ManageMapper;
import com.kflix.ticket.domain.Ticket;

@Service
public class ManageServiceImpl implements ManageService {

	@Inject
	ManageMapper mg_mapper;
	
	@Override
	public List<TicketBoard> getTicketBoard() {
		return mg_mapper.getAllTicketBoard();
	}

	@Override
	public int getMemberCnt() {
		return mg_mapper.getMemberCnt();
	}

	@Override
	public List<MemberGender> getMemberGender() {
		return mg_mapper.getMemberGender();
	}

	@Override
	public List<MemberView> getMemberView() {
		return mg_mapper.selectMemberView();
	}

	@Override
	public List<MemberView> getPageMemView(int page, int amount) {
		return mg_mapper.selectPageMemView(page, amount);
	}

	@Override
	public int changeRecommend(Ticket ticket) {
		return mg_mapper.updateTicketRecommend(ticket);
	}

	@Override
	public int changeStatus(Ticket ticket) {
		return mg_mapper.updateTicketStatus(ticket);
	}
	
	@Override
	public int changeTicket(Ticket ticket) {
		return mg_mapper.updateTicket(ticket);
	}

	@Override
	public int addTicket(Ticket ticket) {
		return mg_mapper.insertTicket(ticket);
	}
	
	@Override
	public List<Ticket> ticketViewAll() {
		return mg_mapper.ticketViewAll();
	}

}
