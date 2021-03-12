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
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">

<script src="/kflix/resources/js/common/common.js"></script>
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<link href="/kflix/resources/css/login/register.css" rel="stylesheet">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<style>
a:link {
	text-decoration: none;
	color: white;
}

a:visited {
	text-decoration: none;
	color: white;
}

a:active {
	text-decoration: none;
	color: white;
}

a:hover {
	text-decoration: none;
	color: white;
}

.img {
	position: relative;
	background-image: url("/kflix/resources/imgs/main/netflix_main.jpg");
	height: 100vh;
	background-size: cover;
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
		<a href="./login"
			class="btn btn-red nmhp-cta nmhp-cta-extra-large btn-none btn-lg"
			style="background-color: red">로그인</a>
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
		<div class="login-form-wrap">
			<div class="logform-content">
				<div id="vertical-flip" class="card">
					<div class="flip">
						<div class="front">
							<form id = "form" action="${pageContext.request.contextPath}/member/register"
								method="post"> 
								<input type="hidden" id="member_age" name="member_age" />
								<div class="box-input">
									<div class="text-first">잠깐,</div>
									<div class="text-second">아직 KFLIX 회원이 아니시군요</div>
									<div class="text-third">지금 바로 가입하고 다양한 영화 컨텐츠를 즐겨보세요</div>
									<input type="email" name="email" id="email" placeholder="&#xf007;   Email을 입력하세요" required />
									<input type="text" placeholder="&#xf133;   생년월일을 입력하세요" name="birth" id="birth" required />
<!-- 								            <label>남성<input type="radio" name="gender" value="M"></label>
								            <label>여성<input type="radio" name="gender" value="F"></label>
 -->
									<input type="password" name="pwd" id="password"
										placeholder="&#xf11c;   비밀번호를 입력하세요" required onchange="checkSamePwd();"/>
										<input type="password" id="password2"
										placeholder="&#xf11c;   비밀번호를 한 번 더 입력하세요" required onchange="checkSamePwd();"/>
									<div class="password-check" id = "password-check"></div>
									
									<button type="button" onclick="register();">Regist</button>

								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
function register(){
	var birth = document.getElementById('birth').value;
	var email = document.getElementById('email').value;
	//나이계산
	var age = calcAge(document.getElementById('birth').value);
	document.getElementById('member_age').value = age;

	num = birth.toString();
	numDigit = num.length;
	console.log(numDigit);

	if(email == null){
		alert('이메일을 입력해주세요.');
		return;
	}
	if(numDigit != 8){
		alert('올바른 생년월일을 입력해주세요.');
		return;
	}
	else{
		document.getElementById('form').submit();
	}
	
	
}

</script>
</body>
</html>