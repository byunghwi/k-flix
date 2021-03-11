<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 Error</title>
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
				<img class="img-error" src="/kflix/resources/imgs/error/smile.png">
			</h6>
			<h1>접근 권한이 없습니다.</h1>
			<a type="button"
				class="btn btn-aqua nmhp-cta nmhp-cta-extra-large btn-none btn-lg"
				style="background-color: teal; text-decoration: none; color:white; font-weight: bolder;" href="/kflix/admin">홈으로</a>
		</div>
	</div>
</body>
</html>