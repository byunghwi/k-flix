package com.kflix.kakaoPay.service;

import com.kflix.kakaoPay.domain.KakaoPayApprovalVO;
import com.kflix.member.domain.Member;
import com.kflix.ticket.domain.Ticket;

public interface KakaoPay {
	public String kakaoPayReady(Ticket ticket, Member member);
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token);
	public void removeKakaoPay(Member member);
}
