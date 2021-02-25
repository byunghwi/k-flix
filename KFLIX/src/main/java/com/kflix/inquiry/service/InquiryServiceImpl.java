package com.kflix.inquiry.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kflix.mapper.InquiryMapper;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Inject
	InquiryMapper in_mapper;
	
	@Override
	public List<String> getInquiryCosntraint() {		
		String[] data = {"결제문의", "환불문의", "이용권문의", "계정문의", "컨텐츠문의", "영상문의", "서비스문의"};
		List<String> constraints = new ArrayList<>();
		Collections.addAll(constraints, data);
		return constraints;
	}

}
