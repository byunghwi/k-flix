package com.kflix.mapper;

import java.util.List;

import com.kflix.manage.domain.TicketBoard;
import com.kflix.member.domain.Member;
public interface ManageMapper {

	List<TicketBoard> getAllTicketBoard();
	
	int getMemberCnt();
}
