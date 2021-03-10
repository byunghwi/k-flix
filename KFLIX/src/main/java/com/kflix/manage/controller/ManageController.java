package com.kflix.manage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kflix.inquiry.service.InquiryService;
import com.kflix.manage.domain.MemberView;
import com.kflix.manage.domain.TicketBoard;
import com.kflix.manage.service.ManageService;
import com.kflix.movie.service.MovieService;
import com.kflix.ticket.domain.Ticket;
import com.kflix.ticket.service.TicketService;
import com.kflix.util.pagenation.domain.PageNation;

@Controller
public class ManageController {

	@Inject
	MovieService mv_service;
	
	@Inject
	InquiryService iq_service;
	
	@Inject
	ManageService mg_service;
	
	@Inject
	TicketService tk_service;
	
	static final PageNation PAGENATION;
	static {
		PAGENATION = new PageNation(1, 20);
	}

	@RequestMapping(value="/accessError")
	public String accessError() {
		return "manage/forbidden";
	}
	
	@RequestMapping(value="/management", method=RequestMethod.GET)
	public String manageMain(Model model) {
		model.addAttribute("movie", mv_service.getTop5Movie());
		model.addAttribute("movieTotal", mv_service.getCountMovie('Y'));
		model.addAttribute("inqTotal", iq_service.getAllInqCnt());
		model.addAttribute("ticket", mg_service.getTicketBoard());
		model.addAttribute("memTotal", mg_service.getMemberCnt());
		
		return "manage/managemain";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/ticketChart", method=RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public List<TicketBoard> chart(){
		System.out.println("chartTicket");
		return mg_service.getTicketBoard();
	}

	
	@RequestMapping(value="/memberindex", method=RequestMethod.GET)
	public String memberView(Model model) {
		System.out.println("============= 멤버뷰");
		model.addAttribute("mem", mg_service.getMemberView());
		model.addAttribute("memTotal", mg_service.getMemberCnt());
		model.addAttribute("page", PAGENATION.getPage());
		model.addAttribute("amount", PAGENATION.getAmount());
		
		return "manage/memberindex";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/memberindex", method=RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, Object> memberView(@RequestBody PageNation pagen){
		System.out.println("memberView");
		Map<String, Object> list = new HashMap<>();
		list.put("len", mg_service.getMemberCnt());
		list.put("pagenation", pagen);
		list.put("mem", mg_service.getPageMemView(pagen.getPage(), pagen.getAmount()));
		
		return list;
	}
	
	
	@RequestMapping(value="/ticketindex", method=RequestMethod.GET)
	public String ticketView(Model model) {
		System.out.println("============= 티켓뷰");
		model.addAttribute("ticket", mg_service.ticketViewAll());
		model.addAttribute("total", mg_service.ticketViewAll().size());
		model.addAttribute("page", PAGENATION.getPage());
		model.addAttribute("amount", PAGENATION.getAmount());
		
		return "manage/ticketindex";
	}
	
	@ResponseBody
	@RequestMapping(value="/ticketindex", method=RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, Object> ticketView(@RequestBody PageNation pagen){
		System.out.println("memberView");
		Map<String, Object> list = new HashMap<>();
		list.put("len", mg_service.ticketViewAll().size());
		list.put("pagenation", pagen);
		list.put("tk", mg_service.ticketViewAll());
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/changeTicketReco", method=RequestMethod.PATCH, consumes = "application/json", produces = "application/json; charset=UTF-8")
	public List<String> ticketChangeRecommend(@RequestBody Ticket ticket){
		System.out.println("================== ticketChangeRecommend");

		String msg = "성공";
		
		int result = mg_service.changeRecommend(ticket);
		if (result < 0) {
			msg = "실패";
		}
		
		List<String> list = new ArrayList<>();
		list.add(msg);
		
		return list;
	}
		
	@ResponseBody
	@RequestMapping(value="/changeTicketStatus", method=RequestMethod.PATCH, consumes = "application/json", produces = "application/json; charset=UTF-8")
	public List<String> ticketChangeStatus(@RequestBody Ticket ticket){
		System.out.println("================== ticketChangeRecommend");

		String msg = "성공";
		
		int result = mg_service.changeStatus(ticket);
		if (result < 0) {
			msg = "실패";
		}
		
		List<String> list = new ArrayList<>();
		list.add(msg);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/addTicket", method=RequestMethod.PATCH, consumes = "application/json", produces = "application/json; charset=UTF-8")
	public  Map<String, Object> addTicket(@RequestBody Ticket ticket){
		System.out.println("================== addTicket");
		
		Map<String, Object> list = new HashMap<>();
		
		mg_service.addTicket(ticket);
		
		list.put("len", mg_service.ticketViewAll().size());
		list.put("tk", tk_service.getTicket(ticket.getTicket_id()));
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateTicket", method=RequestMethod.PATCH, consumes = "application/json", produces = "application/json; charset=UTF-8")
	public  Map<String, Object> updateTicket(@RequestBody Ticket ticket){
		System.out.println("================== updateTicket");
		Map<String, Object> list = new HashMap<>();
		
		mg_service.changeTicket(ticket);
		
		list.put("len", mg_service.ticketViewAll().size());
		list.put("tk", mg_service.ticketViewAll());
		return list;
	}
}
