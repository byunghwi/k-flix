package com.kflix.manage.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class TicketBoard {

	private String ticket_name;
	private int ticket_using;
	
}
