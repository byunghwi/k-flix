<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<title>로그인</title>
<style>
div {
	heigth: 10%
}
.login-img {
	position: relative;
	background-image: url("resources/imgs/main/loginForm.jpg");
	height: 100vh;
	background-size: cover;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 1;
}

.login-form-wrap {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 12px;
	width: 500px;
	height: 700px;
	z-index: 2;
	background-color: rgba(0, 0, 0, .75);
}

.logform-content {
 	position: relative;
	top: 20%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 2rem;
	z-index: 3;
	text-align: center;
}
</style>
</head>
<body>
	<div class="login-img">
		<div class="login-form-wrap">
			<div class="logform-content">
				<h1 id="">로그인 테스트</h1>
				<form action="${pageContext.request.contextPath}/loginPost"
					method="post">
					<div><input type="text" name="email" placeholder="이메일 주소를 입력하세요"></div>
					
					<div><input type="password" name="pwd" placeholder="비밀번호를 입력하세요"></div>
					
					<div><button class="login-button" type="submit">로그인</button>
					<a href="${url}"><img height="50"
						src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a></div>
				</form>
			</div>

		</div>
		<div class="img-cover"></div>
	</div>

</body>
</html>