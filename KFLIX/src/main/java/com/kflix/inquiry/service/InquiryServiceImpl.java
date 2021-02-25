package com.kflix.inquiry.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.kflix.inquiry.domain.Inquiry;
import com.kflix.mapper.InquiryMapper;
import com.kflix.ticket.domain.MailUtils;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class InquiryServiceImpl implements InquiryService {

	@Inject
	InquiryMapper in_mapper;

	@Inject 
	private JavaMailSenderImpl mailSender;
	
	@Override
	public List<String> getInquiryCosntraint() {		
		String[] data = {"결제문의", "환불문의", "이용권문의", "계정문의", "컨텐츠문의", "영상문의", "서비스문의"};
		List<String> constraints = new ArrayList<>();
		Collections.addAll(constraints, data);
		return constraints;
	}

	@Override
	public int receiptInquiry(Inquiry inquiry) {
		return in_mapper.insertInquiry(inquiry);
	}

	@Override
	public int getAllInqCnt() {
		return in_mapper.selectAllInqCnt();
	}

	@Override
	public List<Inquiry> getPageInq(PageNation pagenation) {
		return in_mapper.selectPageInq(pagenation);
	}

	@Override
	public boolean sendReplyMail(Inquiry inquiry) {
		log.info("============== 답변 메일 ================");
		log.info("답변 제목: "+inquiry.getReply_title());
		log.info("답변 내용: "+inquiry.getReply_content());
		log.info("매니저이메일: "+inquiry.getManager_email());
		log.info("회원 이메일:"+inquiry.getEmail());
		
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject(inquiry.getReply_title());// 제목
			// 내용
			sendMail.setText(new StringBuffer().append(inquiry.getReply_content()).toString().replaceAll("/", "<br>"));
			sendMail.setFrom(inquiry.getManager_email(), "KFLIX"); // 이메일 이름
			sendMail.setTo(inquiry.getEmail()); // 받는사람
			sendMail.send();
			
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	@Override
	public int updateReplyInq(Inquiry inquiry) {
		return in_mapper.updateInq(inquiry);
	}

	@Override
	public List<Inquiry> getAllInq() {
		return in_mapper.selectAllInq();
	}

	@Override
	public List<Inquiry> getFindInq(String type, String reply_status) {
		return in_mapper.selectAllInqByTypeAndDate(type, reply_status);
	}

}
