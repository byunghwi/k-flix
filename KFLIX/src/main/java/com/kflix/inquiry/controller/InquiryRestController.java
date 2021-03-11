package com.kflix.inquiry.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.inquiry.domain.Inquiry;
import com.kflix.inquiry.service.InquiryService;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class InquiryRestController {

	@Inject
	InquiryService in_service;
	
	@PostMapping(value="inquiry/index",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public List<Inquiry> findOrAllInq(@RequestBody Inquiry inquiry){
		log.info("======================= findOrAllInq =================");
		String type = inquiry.getInquiry_type();
		String date = inquiry.getReply_status();
		log.info("type : " + type);
		log.info("date : " + date);
		log.info(in_service.getFindInq(type, date).size());
		return in_service.getFindInq(type, date);
	}
	
	@PatchMapping(value="inquiry/reply",
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public List<Inquiry> replyAndSave(@RequestBody Inquiry inquiry) {

		log.info("매니저이메일: "+inquiry.getManager_email());
		// inq 객체 보내서 메일보내기
		boolean send = in_service.sendReplyMail(inquiry);

		if(send) {
			// inq 객체 보내서 db업데이트
			in_service.updateReplyInq(inquiry);
			log.info("메일 저장 둘다 성공");
			
		} else {
			log.info("DB 저장실패");
		}
		
		// 통과하면 업데이트된 List<Inq>객체 반환
		return in_service.getAllInq();
	}
	
	
	@PostMapping(value="inquiry/user",
			consumes = "application/json",
			produces = "application/json; charset=UTF-8")
	public Map<String, Object> userView(@RequestBody Map<String, String> vo) {
		log.info("유저 뷰------------------------");
		log.info(vo);
		Map<String, Object> list = new HashMap<>();
		
		PageNation page = new PageNation();
		int pnum = Integer.parseInt(vo.get("page"));
		if (vo.get("page") == null) {
			pnum = 1;
		}
		page.setPage(pnum);
		page.setAmount(Integer.parseInt(vo.get("amount")));
		Inquiry inq = new Inquiry();
		
		inq.setEmail((String)vo.get("email"));
		inq.setInquiry_type((String)vo.get("inquiry_type"));
		inq.setReply_status((String)vo.get("reply_status"));
		
		log.info(inq.getEmail());
		list.put("inq", in_service.getInqByEmail(page, inq, (String)vo.get("reply_status")));
		list.put("len", in_service.selectUserInqCnt((String)vo.get("email"), (String)vo.get("inquiry_type"), (String)vo.get("reply_status")));
		return list;
	}

}
