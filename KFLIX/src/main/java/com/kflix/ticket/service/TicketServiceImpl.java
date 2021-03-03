package com.kflix.ticket.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.kflix.ticket.dao.TicketDao;
import com.kflix.ticket.domain.MailUtils;
import com.kflix.ticket.domain.Ticket;

@Service
public class TicketServiceImpl implements TicketService {

	private int size;

	@Inject
	private JavaMailSenderImpl mailSender;
	
	@Inject
	private TicketDao ticketDao;

	@Override
	public String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}

	@Override
	public String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;

		while (buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}

		return buffer.toString();
	}

	@Override
	public boolean sendAuthMail(String email) {
		
		System.out.println("[TicketServiceImpl] 이메일 주소 >>>>> " + email);

		// 인증메일 보내기
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[KFLIX] 본인인증");
			sendMail.setText(new StringBuffer().append("<h1>[본인 인증]</h1>").append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:8081/kflix/member/signUpConfirm?email=").append(email).append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("KFLIX", "KFLIX");
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;

	}

	@Override
	public List<Ticket> getAllTickets() {
		
		return ticketDao.getAllTickets();
	}
}
