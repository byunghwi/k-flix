package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.manage.domain.MemberGender;
import com.kflix.manage.domain.MemberView;
import com.kflix.manage.domain.TicketBoard;
import com.kflix.ticket.domain.Ticket;
public interface ManageMapper {

	List<TicketBoard> getAllTicketBoard();
	
	int getMemberCnt();
	
	List<MemberGender> getMemberGender();
	
	List<MemberView> selectMemberView();
	
	List<MemberView> selectPageMemView(@Param("page") int page, @Param("amount") int amount);	

	int updateTicketRecommend(Ticket ticket);
	
	int updateTicketStatus(Ticket ticket);
	
	int insertTicket(Ticket ticket);
	
	int updateTicket(Ticket ticket);
	
	List<Ticket> ticketViewAll();
}
