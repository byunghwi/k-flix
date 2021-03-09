package com.kflix.manage.service;

import java.util.List;

import com.kflix.manage.domain.MemberGender;
import com.kflix.manage.domain.MemberView;
import com.kflix.manage.domain.TicketBoard;

public interface ManageService {

	public List<TicketBoard> getTicketBoard();
	
	public int getMemberCnt();
	
	public List<MemberGender> getMemberGender();
	
	public List<MemberView> getMemberView();
	
	public List<MemberView> getPageMemView(int page, int amount);
}
