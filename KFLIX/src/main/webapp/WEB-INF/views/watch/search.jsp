<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>
<style type="text/css">
.flex-row {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	position: fixed;
	z-index: 100;
	top: 0;
}

.flex-row>* {
	margin: 8px;
}

.nav-bar {
	background-color: rgba(0, 0, 0, 0.2);
	max-width: 100%;
	padding: 8px 50px;
	align-items: center;
	position: relative;
	margin: 0;
}

.nav-link {
	color: white;
	font-size: 13px;
}

.logo {
	height: 30px;
	padding: 0 20px
}

#shadow1 {
	position: relative;
	background-color: #141414;
	padding: 0.1px 0;
	/* 	box-shadow: 0px 2px 10px #141414; */
}

.profile {
	position: absolute;
	right: 4%;
}

.color_white {
	color: white;
}

.nav-icon {
	font-size: 20px;
	padding: 8px;
}
</style>
</head>
<body style="background-color: #141414">

	<div class="container flex-row nav-bar ">
		<%@include file="/WEB-INF/views/main/header.jsp"%>
		<img class="logo" alt="로고"
			src="/kflix/resources/imgs/watch/kflixlogo.png">

		<ul class="nav" style="margin: 0 300px 0 0;">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">홈</a></li>
			<li class="nav-item"><a class="nav-link" href="#">TV프로그램</a></li>
			<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
			<li class="nav-item"><a class="nav-link" href="#" tabindex="-1">NEW!요즘
					대세 콘텐츠</a></li>

			<li class="nav-item"><a class="nav-link" href="#">내가 찜한 콘텐츠</a></li>
		</ul>
		<div class="profile">

			<input id="search" type="checkbox" style="display: none;"> <input
				id="searchinput" type="text" style="display: none;"> <label
				for="search"><i class="fas fa-search color_white nav-icon"></i></label>
			<i class="fas fa-gift color_white nav-icon"></i> <i
				class="fas fa-bell color_white nav-icon"></i> <i
				style="background-color: white; width: 40px"
				class="fas fa-child nav-icon"></i>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>