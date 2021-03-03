package com.kflix.kakaoPay.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.inject.Inject;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kflix.kakaoPay.domain.KakaoPayApprovalVO;
import com.kflix.kakaoPay.domain.KakaoPayVO;
import com.kflix.member.domain.Member;
import com.kflix.ticket.domain.Ticket;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KakaoPayServiceImpl implements KakaoPay {

	private static final String HOST = "https://kapi.kakao.com";
	private static final String SUBSCRIP_CID = "TCSUBSCRIP"; // 정기결제시 테스트용 CID
	private static final String SINGLEPAY_CID = "TC0ONETIME"; // 단건 결제시 테스트용 CID

	@Inject
	KakaoPayVO kakaoPayVO;
	
	@Inject
	KakaoPayApprovalVO kakaoPayApprovalVO;

	@Override
	public String kakaoPayReady(Ticket ticket, Member member) {

		RestTemplate restTemplate = new RestTemplate();

		// 서버에 요청할 Header setting
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "7d19fde413f81cee3fba6099e2cc8803"); //ADMIN KEY 입력
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버에 요청할 Body setting
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", SUBSCRIP_CID); // 테스트용
		//정기결제일 경우 sid 추가 
		if(member.getPay_sid() != null) {
			System.out.println("kakaoPayReady sid 값 있을 때 > " + member.getPay_sid());
			params.add("sid", member.getPay_sid()); // 정기결제 키, 20자	
		}
		params.add("partner_order_id", "1111"); // 가맹점 주문번호, 최대 100자	
		params.add("partner_user_id", "KFLIXTEST"); // 가맹점 회원 id, 최대 100자
		params.add("item_name", ticket.getTicket_name()); // 상품명, 최대 100자
		params.add("quantity", "1"); // 상품 수량
		params.add("total_amount", Integer.toString(ticket.getTicket_price())); // 상품 총액
		params.add("tax_free_amount", "0"); // 상품 비과세 금액
		params.add("approval_url", "http://localhost:8081/kflix/ticket/kakaoSuccess"); // 결제 성공 시 redirect url, 최대 255자
		params.add("cancel_url", "http://localhost:8081/kflix/ticket/kakaoCancel"); // 결제 취소 시 redirect url, 최대 255자
		params.add("fail_url", "http://localhost:8081/kflix/ticket/kakaoFail"); // 결제 실패 시 redirect url, 최대 255자

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			String uri;
			//정기결제 2회차부터는 uri 달라짐
			if(member.getPay_sid() != null) {
				uri = "/v1/payment/subscription";
			}else {
				//정기결제 최초 
				uri = "/v1/payment/ready";
			}
			
			kakaoPayVO = restTemplate.postForObject(new URI(HOST + uri), body, KakaoPayVO.class);
			
			System.out.println("kakaoPayReady 응답값 > " + kakaoPayVO);
            
			//정기결제 1회차 처음에만 Next_redirect_pc_url 값 들어옴.
			if(kakaoPayVO.getNext_redirect_pc_url() != null) {
				return kakaoPayVO.getNext_redirect_pc_url(); //https://mockup-pg-web.kakao.com/v1/c08a198fa1d81ba818cf2973e29d47c3f02ee42f53206bf245652c743813b8df/info
			}

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/pay";
	}
	
	@Override
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
		 
	        log.info("KakaoPayInfoVO............................................");
	        log.info("-----------------------------");
	        
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "7d19fde413f81cee3fba6099e2cc8803");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", SUBSCRIP_CID);
	        params.add("tid", kakaoPayVO.getTid()); // 결제 고유번호
	        params.add("partner_order_id", "1111");
	        params.add("partner_user_id", "KFLIXTEST");
	        params.add("pg_token", pg_token);
	        //params.add("total_amount", "7500");
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
	            System.out.println("kakaoPayInfo 응답값 > " + kakaoPayApprovalVO);
	          
	            return kakaoPayApprovalVO;
	        
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return null;
	    }

	@Override
	public void removeKakaoPay(Member member) {
		
		RestTemplate restTemplate = new RestTemplate();

		// 서버에 요청할 Header setting
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "7d19fde413f81cee3fba6099e2cc8803"); //ADMIN KEY 입력
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버에 요청할 Body setting
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		
		params.add("cid", SUBSCRIP_CID); // 테스트용
		//정기결제일 경우 sid 추가 
		if(member.getPay_sid() != null) {
			params.add("sid", member.getPay_sid()); // 정기결제 키, 20자	
		}

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			String uri = "/v1/payment/manage/subscription/inactive";

			
			kakaoPayVO = restTemplate.postForObject(new URI(HOST + uri), body, KakaoPayVO.class);
			
			System.out.println("removeKakao 응답값 > " + kakaoPayVO);
            
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
