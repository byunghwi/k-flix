package com.kflix.inquiry.service;

import java.util.List;

import com.kflix.inquiry.domain.Inquiry;

public interface InquiryService {

	public List<String> getInquiryCosntraint();
	
	public int receiptInquiry(Inquiry inquiry);
}
