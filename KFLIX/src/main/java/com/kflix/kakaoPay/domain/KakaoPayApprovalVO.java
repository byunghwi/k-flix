package com.kflix.kakaoPay.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class KakaoPayApprovalVO {

	private String aid;
	private String tid;
	private String cid;
	private String sid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private AmountVO amount;
	private CardVO card_info;
	private String item_name;
	private String item_code;
	private String payload;
	private int quantity;
	private int tax_free_amount;
	private int vat_amount;
	private Date created_at;
	private Date approved_at;

}
