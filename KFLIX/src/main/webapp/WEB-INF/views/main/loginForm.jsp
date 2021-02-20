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
.img {
	position: relative;
	background-image: url("resources/imgs/main/loginForm.jpg");
	height: 100vh;
	width: 100vw;
	background-size: cover;
}

.login-form {
	display: flex;
	border-radius: 4px;
	background-color: rgba(0, 0, 0, .75);
	border-radius: 4px;
	box-sizing: border-box;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 1;
}

.logform-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 3rem;
	color: orange;
	z-index: 2;
	text-align: center;
}

.our-story-card-title {
	color: white;
	font-size: 5rem;
	text-align: center;
}

.logform-content .login-button {
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    font-size: 16px;
    font-weight: 700;
    margin: 24px 0 12px;
}
.btn {
    width: 100%;
    background: #e50914;
}
</style>
</head>
<body>

	<div class="img">
		<div class="login-form">
			<div class="logform-content">
				<h1 id="" class="our-story-card-title" data-uia="hero-title">로그인</h1>
				<form action="${pageContext.request.contextPath}/loginPost" method="post">
					<input type="text" name="email" placeholder="이메일 주소를 입력하세요"><br>
					<input type="password" name="pwd" placeholder="비밀번호를 입력하세요">
					<button class="btn login-button btn-submit btn-small" type="submit">로그인</button>
						<a href="${url}"><img height="50"
							src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
						
				</form>
			</div>
		</div>
		<div class="img-cover"></div>
	</div>
	


</body>
</html>