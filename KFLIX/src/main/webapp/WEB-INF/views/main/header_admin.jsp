<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KFLIX</title>

<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c7adb7b803.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/init.css">
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/header.css">
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/main.css">


<link rel="stylesheet"
	href="/kflix/resources/css/common/netflix-fonts.css" />
<link rel="stylesheet"
	href="/kflix/resources/css/common/netflix-pulsate.css" />

<style>
* {
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
}

element.style {
	position: fixed;
	display: block;
	box-shadow: rgb(0 0 0/ 20%) 0px 4px 8px 0px, rgb(0 0 0/ 19%) 0px 6px
		20px 0px;
	z-index: 10000;
	top: 50%;
	height: auto;
	left: 50%;
	transform: translate(-50%, -50%);
	transition: all 0.6s ease 0s;
}



</style>
</head>
<body>
	
	<!-- header -->
	<header>
		<div class="header_container" id="header_container">
			<div class="logo">
				<a href="/kflix/management"> <img
					src="/kflix/resources/imgs/watch/kflixlogo.png" alt="NETFLIX">
				</a>
				<button class="header_toggleBtn">
					<i class="fa fa-bars"></i>
				</button>
			</div>

			<button id="btnGroupDrop_Menu" type="button" class="btn"
				data-bs-toggle="dropdown" aria-expanded="false">
				<i class="fas fa-bars color_white" style="font-size: 25px"></i><i
					class="fas fa-caret-down color_white"
					style="font-size: 15px; vertical-align: text-top; padding-left: 5px;"></i>
			</button>


			<ul class="sub_nav">
				<li class="sub_nav_tab">
					<button id="btnGroupDrop_login" type="button" class="btn"
						data-bs-toggle="dropdown" aria-expanded="false"
						style="padding: 0; border: 0;">

						<i class="fas color_white fa-user"></i>
					</button>

					<ul class="dropdown-menu" aria-labelledby="btnGroupDrop_login">
						<li style="padding: 2px 1rem; font-size: 14.5px;">${login.email}</li>
						<li><a href="/kflix/logoutAdmin" class="dropdown-item">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</header>


	<!-- scripts -->
	<script src="/kflix/resources/js/main/header.js"></script>


</body>

</html>