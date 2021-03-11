package com.kflix.inquiry.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

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
		Collections.sort(constraints);
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
		log.info("============== 메일로 보낼 ================");
		log.info("문의 내용: "+inquiry.getInquiry_content());
		log.info("답변 제목: "+inquiry.getReply_title());
		log.info("답변 내용: "+inquiry.getReply_content());
		log.info("매니저이메일: "+inquiry.getManager_email());
		log.info("회원 이메일:"+inquiry.getEmail());
		
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject(inquiry.getReply_title());// 제목
			// 내용
			sendMail.setText(new StringBuffer()
												.append("<b>\""  + inquiry.getEmail() + "\" 님 안녕하세요.</b><br><br>")
												.append("문의하신 내용에 대한 답변입니다.<br><br>")
												.append("<b>[문의내용]</b><br>")
												.append(inquiry.getInquiry_content())
												.append("<br><br>============================<br><br>")
												.append("<b>[답변내용]</b><br>")							
												.append(inquiry.getReply_content().replaceAll("/", "<br>"))
												.append("<br><br><br<p>감사합니다.<br>KFLIX 드림. </p><br>")
												.append("본 메일은 발신 전용이므로 메일로 문의 시 확인이 불가능합니다.<br/>KFLIX Copyright ⓒ 2021 by KFLIX, Inc. All rights reserved.").toString());
			sendMail.setFrom(inquiry.getManager_email(), "KFLIX"); // 이메일 이름
			sendMail.setTo(inquiry.getEmail()); // 받는사람
			sendMail.send();
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
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

	@Override
	public boolean formRegExp(Inquiry inquiry) {
		String mail_reg_exp = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,6}";
		
		List<String> type_list = new ArrayList<>();
		type_list.add("결제문의");
		type_list.add("환불문의");
		type_list.add("이용권문의");
		type_list.add("계정문의");
		type_list.add("컨텐츠문의");
		type_list.add("영상문의");
		type_list.add("서비스문의");
		
		int max_title_len = 100;
		int max_content_len = 4000;
		
		boolean mail_ck = Pattern.matches(mail_reg_exp, inquiry.getEmail());
		boolean type_ck = type_list.contains(inquiry.getInquiry_type());
		boolean title_ck = getByteLength(inquiry.getInquiry_title()) <= max_title_len;
		boolean content_ck = getByteLength(inquiry.getInquiry_content()) <= max_content_len;
		
		log.info("고객 이메일: " + inquiry.getEmail());
		log.info("이메일 정규식 ? "+ mail_ck);
		log.info("문의 종류: " + inquiry.getInquiry_type());
		log.info("문의 종류 존재 ? " + type_ck);
		log.info("문의 제목: " + inquiry.getInquiry_title());
		log.info("문의 제목 제한 ? " + title_ck);
		log.info("문의 내용: " + inquiry.getInquiry_content());
		log.info("문의 내용 제한 ? " + content_ck);
		
		if (mail_ck && type_ck && title_ck && content_ck) {
			return true;
		} else {
			return false;
		}
	}

	private int getByteLength(String str) {

		int strLength = 0;

		char tempChar[] = new char[str.length()];

		for (int i = 0; i < tempChar.length; i++) {

			tempChar[i] = str.charAt(i);

			if (tempChar[i] < 128) {

				strLength++;

			} else {

				strLength += 2;

			}

		}

		return strLength;

	}

	@Override
	public List<Inquiry> getInqByEmail(PageNation pagenation, Inquiry inquiry, String status) {
		return in_mapper.selectInqByEmail(pagenation.getPage(), pagenation.getAmount(), inquiry.getEmail(), inquiry.getInquiry_type(), status);
	}

	@Override
	public int selectUserInqCnt(String email, String type, String status) {
		return in_mapper.selectUserInqCnt(email, type, status);
	}
	
}

