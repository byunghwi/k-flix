package com.kflix.kakaoPay.service;

import com.kflix.kakaoPay.domain.KakaoPayApprovalVO;

public interface KakaoPay {
	public String kakaoPayReady(String item_name, int total_amount);
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token);
}
