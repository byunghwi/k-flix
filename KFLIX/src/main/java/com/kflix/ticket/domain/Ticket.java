package com.kflix.ticket.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Ticket {
	int ticket_id;
	String ticket_name;
	int ticket_period;
	int ticket_price;
	String ticket_status;
	String ticket_recommend;
}
