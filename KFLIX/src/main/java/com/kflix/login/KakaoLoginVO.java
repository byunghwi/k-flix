package com.kflix.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;

import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.protocol.HTTP;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.JsonObject;


@Component
public class KakaoLoginVO {
	/* [카카오] 인증 요청문을 구성하는 파라미터 */
	// client_id: String / 앱 생성 시 발급받은 REST API 키
	// response_type: String / code로 고정
	// redirect_uri: String / 인가 코드가 리다이렉트될 URI

	/// oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code
	private final static String CLIENT_ID = "ab797bb7c662ff625fd22e4e520ce0d8";
	private final static String REDIRECT_URI = "http://localhost:8081/kflix/kakao/callback";
	private final static String KAKAOAPIURL = "https://kauth.kakao.com";

	/* 카카오 아이디로 인증 URL 생성 Method */
	public String getAuthorizationUrl() {
		// https://kauth.kakao.com/oauth/authorize
		// https://kauth.kakao.com/oauth/authorize?client_id=b5f85af25d1bdf961d4f2016bafe3c6e&redirect_uri=http://localhost:8000/login&response_type=code

		String requestUrl = KakaoLoginApi.instance().getAuthorizationBaseUrl() + "?client_id=" + CLIENT_ID
				+ "&redirect_uri=" + REDIRECT_URI + "&response_type=code";
		return requestUrl;
	}

	/* 카카오 아이디로 Callback 처리 및 AccessToken 획득 Method */
	public String getAccessToken(String code) throws IOException {
		String accessToken = "";

		RestTemplate restTemplate = new RestTemplate();

		String requestUrl = "/oauth/token";
		URI uri = URI.create(KAKAOAPIURL + requestUrl);

		HttpHeaders headers = new org.springframework.http.HttpHeaders();

		MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
		parameters.set("grant_type", "authorization_code");
		parameters.set("client_id", CLIENT_ID);
		parameters.set("redirect_uri", REDIRECT_URI);
		parameters.set("code", code);

		HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(
				parameters, headers);
		ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);

		JSONObject responseBody = apiResponse.getBody();

		accessToken = (String) responseBody.get("access_token");

		return accessToken;
	}

//	// 카카오 사용자 id 추출
//	public Member getKakaoUniqueNo(String accessToken) throws Exception {
//
//		String kakaoUniqueNo = "";
//
//		// restTemplate을 사용하여 API 호출
//		RestTemplate restTemplate = new RestTemplate();
//		String reqUrl = "/v2/user/me";
//		URI uri = URI.create(KAKAOAPIURL + reqUrl);
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.set("Authorization", "bearer " + accessToken);
//		headers.set("bearer", accessToken);
//
//		MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
//		parameters.add("property_keys", "[\"kakao_account\"]");
//
//		HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<>(parameters, headers);
//		ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
//		JSONObject responseBody = apiResponse.getBody();
//
//		System.out.println("[KakaoLoginVO] responseBody 객체 > " + responseBody);
//		kakaoUniqueNo = responseBody.get("kakao_account").toString();
//
//		return null;
//
//	}

	public JSONObject getKakaoUserInfo(String accessToken) throws ParseException{
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		//post.addHeader("Content-Type", "application/json;charset=UTF-8");
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);

		//JsonNode returnNode = null;
		JSONParser jsonParser = new JSONParser();
		JSONObject myObject = null;
		
		String result = null;
		try {
			final HttpResponse response = client.execute(post);
			org.apache.http.HttpEntity entity = response.getEntity();

            InputStream instream = entity.getContent();
            result = convertStreamToString(instream);
           
            Object obj = jsonParser.parse( result );
            myObject = (JSONObject) obj;

            System.out.println("RESPONSE: " + myObject);
            
            instream.close();

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
		}

		return myObject;
	}
	
	
	private static String convertStreamToString(InputStream is) {

	    BufferedReader reader = new BufferedReader(new InputStreamReader(is));
	    StringBuilder sb = new StringBuilder();

	    String line = null;
	    try {
	        while ((line = reader.readLine()) != null) {
	            sb.append(line + "\n");
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            is.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    return sb.toString();
	}
}
