<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%> --%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KFLIX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/watch/cssbrowse.css">
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>

</head>
<body>

	<%
	/* 		String clientId = "poB4pMnJyL08tPNvHTwO";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "2sIilQ9ZED";//애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8081/kflix/browse", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		System.out.println("apiURL=" + apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
		res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
		out.println(res.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		} */
	%>
	<div style="max-width: 100%" class="container flex-row nav-bar">
		<img class="logo" alt="로고"
			src="/kflix/resources/imgs/watch/kflixlogo.png">
		<ul class="nav" style="margin: 0 300px 0 0;">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">홈</a></li>
			<li class="nav-item"><a class="nav-link" href="#">TV프로그램</a></li>
			<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#"
				tabindex="-1">NEW!요즘 대세 콘텐츠</a></li>

			<li class="nav-item"><a class="nav-link" href="#">내가 찜한 콘텐츠</a></li>
		</ul>
		<div style="float: right;" class="">
			<i class="fas fa-search color_white nav-icon"></i> <i
				class="fas fa-gift color_white nav-icon"></i> <i
				class="fas fa-bell color_white nav-icon"></i> <i
				style="background-color: white; width: 40px"
				class="fas fa-child nav-icon"></i>
		</div>
	</div>

	<div id="shadow1"></div>
	<div style="margin: 0" class="container background">
		<img id="mainimg" alt="메인사진"
			src="/kflix/resources/imgs/watch/runon1.png">
		<!-- <img alt="" src="/kflix/resources/imgs/watch/nav-shadow.png"> -->
	</div>


	<div id="list">

		<c:if test="${not empty watch}">
			<div class="list_title">"${login.email }"님의 이어보기</div>
			<div class="slide_wrapper_Watching">

				<ul class="slides_Watching">
					<c:forEach items="${watch }" var="watch" varStatus="status">
						<c:forEach items="${Allmovie }" var="Allmovie" varStatus="status">
							<c:if test="${watch.movie_id eq Allmovie.movie_id }">
								<li><a class="atag"
									href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
										<div class="atagdiv">
											<img style="margin: 0;" src="${Allmovie.poster_path }"
												class="d-block dis img1" alt="...">
											<div class="videohover">
												<video class="video" muted autoplay loop
													poster="${Allmovie.poster_path}">
													<source src="${Allmovie.teaser_path}" type="video/mp4">
												</video>
											</div>
										</div>
								</a></li>


							</c:if>
						</c:forEach>
					</c:forEach>
				</ul>

			</div>
			<p class="controls_Watching">
				<span class="prev_Watching">prev</span> <span class="next_Watching">next</span>
			</p>

		</c:if>
<div style="width: 100%; height: 167.5px;overflow: hidden;">
		<div class="list_title">모든 영화</div>
		<div class="slide_wrapper_All">
			<ul class="slides_All">
				<c:forEach items="${Allmovie }" var="Allmovie" varStatus="status">
					<li><a class="atag"
						href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
							<div class="atagdiv">
								<img style="margin: 0;" src="${Allmovie.poster_path }"
									class="d-block dis img1" alt="...">
								<div class="videohover">
									<video class="video" muted autoplay loop
										poster="${Allmovie.poster_path}">
										<source src="${Allmovie.teaser_path}" type="video/mp4">
									</video>
								</div>
							</div>

					</a></li>
				</c:forEach>


			</ul>
<p class="controls_All">
			<span class="prev_All">prev</span> <span class="next_All">next</span>
		</p>
		</div>
		</div>
		

	</div>

	<!-- 전체 틀이 계속 반복되야 하고 안에 알맹이가 바껴야 된다.. -->

	<script src="/kflix/resources/js/watch/jsbrowse.js"></script>
	<script>
		
	</script>

</body>
</html>