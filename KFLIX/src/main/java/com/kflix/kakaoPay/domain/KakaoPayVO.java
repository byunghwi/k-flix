package com.kflix.kakaoPay.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class KakaoPayVO {
	private String tid;
	private String next_redirect_pc_url;
	private Date created_at;
}
