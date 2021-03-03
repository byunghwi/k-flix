package com.kflix.manage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kflix.manage.domain.TicketBoard;
import com.kflix.mapper.ManageMapper;

@Service
public class ManageServiceImpl implements ManageService {

	@Inject
	ManageMapper mg_mapper;
	
	@Override
	public List<TicketBoard> getTicketBoard() {
		return mg_mapper.getAllTicketBoard();
	}

}
