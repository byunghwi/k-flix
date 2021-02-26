package com.kflix.inquiry.service;

import java.util.List;

import com.kflix.inquiry.domain.Inquiry;
import com.kflix.util.pagenation.domain.PageNation;

public interface InquiryService {

	public List<String> getInquiryCosntraint();
	
	public int receiptInquiry(Inquiry inquiry);
	
	public int getAllInqCnt();
	
	public List<Inquiry> getPageInq(PageNation pagenation);
	
	// 메일
	public boolean sendReplyMail(Inquiry inquiry);
	
	public int updateReplyInq(Inquiry inquiry);
	
	public List<Inquiry> getAllInq();
	
	public List<Inquiry> getFindInq(String type, String reply_status);
}