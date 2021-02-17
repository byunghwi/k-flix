<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Watch in KFLIX</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
</head>
<style>
.img {
	position: relative;
	background-image: url("resources/imgs/netflix_main.jpg");
	height: 100vh;
	background-size: cover;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.img .content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 5rem;
	color: white;
	z-index: 2;
	text-align: center;
}

.our-story-header-wrapper {
	position: absolute;
	top: 10%;
	left: 92%;
	transform: translate(-10%, -90%);
	font-size: 5rem;
	color: white;
	z-index: 2;
	text-align: center;
}
</style>
<body>
	<script>
		var result = '${msg}';

		if (result === 'REGISTERED') {
			alert('등록이 완료되었습니다.');
		}
	</script>
	<div class="our-story-header-wrapper">
		<button type="button"
			class="btn btn-red nmhp-cta nmhp-cta-extra-large btn-none btn-lg"
			style="background-color: red" data-toggle="modal"
			data-target="#loginModal">로그인</button>
	</div>

	<div class="img">
		<div class="content">
			<h1 id="" class="our-story-card-title" data-uia="hero-title">영화,
				TV 프&#65279;로&#65279;그&#65279;램&#65279;을 무제한으로.</h1>
			<button type="button"
				class="btn btn-red nmhp-cta nmhp-cta-extra-large btn-none btn-lg"
				style="background-color: red" data-toggle="modal"
				data-target="#registerModal">회원가입</button>

		</div>

		<!-- 이미지 배경 어둡게 만들기 -->
		<div class="img-cover"></div>
	</div>

	<!-- 회원가입 모달 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회원가입</h4>
				</div>
				<form action="${pageContext.request.contextPath}/member/register"
					method="post">
					<div class="modal-body">

						<div class="input-group mb-2">
							<input type="email" name="email" class="form-control"
								placeholder="이메일 주소">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-exclamation"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-2">
							<input type="text" name="nick" class="form-control"
								placeholder="닉네임">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-user"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="text" name="birth" class="form-control"
								placeholder="생년월일">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="text" name="member_age" value="39"
								class="form-control" placeholder="나이">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="password" name="pwd" class="form-control"
								placeholder="비밀번호">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="password" class="form-control" placeholder="비밀번호 확인">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-1">
							성별<input type="radio" name="gender" value="N"
								class="form-control" title="남성">남성<br> <input
								type="radio" title="여성" name="gender" value="F"
								class="form-control">여성
						</div>
						<div class="row">
							<div class="col-8">
								<div class="icheck-primary">
									<input type="checkbox" id="agreeTerms" name="terms"
										value="agree"> <label for="agreeTerms">전체 약관
										동의 </label>
								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">로그인
						${pageContext.request.contextPath}</h4>
				</div>
				<form action="${pageContext.request.contextPath}/member/loginPost"
					method="post">
					<div class="modal-body">

						<div class="input-group mb-2">
							<input type="email" name="email" class="form-control"
								placeholder="이메일 주소">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-exclamation"></span>
								</div>
							</div>
						</div>

						<div class="input-group mb-3">
							<input type="password" name="pwd" class="form-control"
								placeholder="비밀번호">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<%
							String clientId = "poB4pMnJyL08tPNvHTwO";//애플리케이션 클라이언트 아이디값";
						String redirectURI = URLEncoder.encode("http://localhost:8081/kflix/browse", "UTF-8");
						SecureRandom random = new SecureRandom();
						String state = new BigInteger(130, random).toString();
						String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
						apiURL += "&client_id=" + clientId;
						apiURL += "&redirect_uri=" + redirectURI;
						apiURL += "&state=" + state;
						session.setAttribute("state", state);
						%>
						자동로그인 <input type="checkbox" name="userCookie">
						<button type="submit" class="btn btn-primary">로그인</button>
						<a href="<%=apiURL%>"><img height="50"
							src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
					</div>
				</form>


			</div>
		</div>
	</div>
</body>
</html>