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
			sendMail.setText(new StringBuffer()
					.append("<h1>[본인 인증]</h1><br><br>")
					.append("<p><b> \""+ email + "\" <b>님 안녕하세요.</p><br>")
					.append("<p>KFLIX 본인확인을 위한 E-MAIL인증 절차입니다.</p><br>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p><br><br><br>")
					.append("<a href='http://localhost:8081/kflix/member/signUpConfirm?email=")
					.append(email)
					.append("' style='text-align: center; background-color: rgb(46, 52, 60); border: none; text-decoration: none; padding: 30px 10px 30px 10px; margin-bottom: 40px; color: white; border-radius: 7px;' target='_blenk'>KFLIX로 이동</a><br><br><br><br>")
					.append("<p>감사합니다.<br>KFLIX 드림. </p><br>")
					.append("본 메일은 발신 전용이므로 메일로 문의 시 확인이 불가능합니다.<br/>KFLIX Copyright ⓒ 2021 by KFLIX, Inc. All rights reserved.").toString());

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

	@Override
	public Ticket getTicket(int ticket_id) {
		return ticketDao.getTicket(ticket_id);
	}
}
