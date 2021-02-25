package com.kflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kflix.inquiry.domain.Inquiry;
import com.kflix.util.pagenation.domain.PageNation;

public interface InquiryMapper {

	int insertInquiry(Inquiry inquiry);
	
	// 총 개수 status
	int selectAllInqCnt();
	
	// 페이지 네이트 pagenation status
	List<Inquiry> selectPageInq(PageNation pagenation); 
	
	int updateInq(Inquiry inquiry);
	
	List<Inquiry> selectAllInq();
	
	List<Inquiry> selectAllInqByTypeAndDate(
			@Param("type") String type, @Param("reply_status") String reply_status);
}
