package com.kflix.inquiry.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.inquiry.domain.Inquiry;
import com.kflix.inquiry.service.InquiryService;

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
		return in_service.getFindInq(type, date);

	}
	
	@PatchMapping(value="inquiry/reply",
				consumes = "application/json",
				produces = "application/json; charset=UTF-8")
	public List<Inquiry> replyAndSave(@RequestBody Inquiry inquiry) {
		
		// inq 객체 보내서 메일보내기
		boolean send = in_service.sendReplyMail(inquiry);
		// inq 객체 보내서 db업데이트
//		int result = in_service.updateReplyInq(inquiry);
//		
//		if(send && result == 1) {
//			log.info("메일 저장 둘다 성공");
//		} else if(result < 0) {
//			log.info("DB 저장실패");
//		}
		
		// 통과하면 업데이트된 List<Inq>객체 반환
		return in_service.getAllInq();
	}
	

}
