<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Error</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style type="text/css">
.img {
	position: relative;
	background-image: url("/kflix/resources/imgs/error/black.jpg");
	height: 100vh;
	background-size: cover;
}

.img .content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 10rem;
	color: white;
	z-index: 2;
	text-align: center;
}

.img-error {
	height: 230px;
	width: 200px;
}
</style>
</head>
<body>
	<div class="img">
		<div class="content">
			<h6>
				<img class="img-error" src="/kflix/resources/imgs/error/둘리.png">
			</h6>
			<div id="" class="our-story-card-title" data-uia="hero-title">404</div>
			<h2>😢 이 URL은 존재하지 않습니다. 😢</h2>

			<button type="button"
				class="btn btn-aqua nmhp-cta nmhp-cta-extra-large btn-none btn-lg"
				style="background-color: teal;" onclick="history.back();">돌아가기</button>
		</div>
	</div>
</body>
</html>