package com.kflix.mapper;

import java.util.List;

import com.kflix.manage.domain.MemberGender;
import com.kflix.manage.domain.TicketBoard;
public interface ManageMapper {

	List<TicketBoard> getAllTicketBoard();
	
	int getMemberCnt();
	
	List<MemberGender> getMemberGender();
}
