<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KFLIX</title>

<script src="https://kit.fontawesome.com/c7adb7b803.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/init.css">
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/header.css">
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/main.css">

</head>

<body>
	<!-- header -->
	<header>
		<div class="header_container">
			<div class="logo">
				<a href=""> <img src="/kflix/resources/imgs/watch/kflixlogo.png"
					alt="NETFLIX">
				</a>
				<button class="header_toggleBtn">
					<i class="fa fa-bars"></i>
				</button>
			</div>
			<ul class="main_nav">
				<li class="main_nav_tab"><a class="nav-link hometag"
					aria-current="page" href="/kflix/browse">홈</a></li>
				<li class="main_nav_tab "><a class="nav-link movietag"
					href="/kflix/browse#amovie">영화</a></li>
				<li class="main_nav_tab"><a class="nav-link top10tag"
					href="/kflix/browse#atop" tabindex="-1">요즘 대세 콘텐츠!</a></li>
				<li class="main_nav_tab"><a class="nav-link wishtag"
					href="/kflix/browse#awish">내가 찜한 콘텐츠</a></li>
				<li id="testdsf" class="main_nav_tab"></li>
			</ul>
			<ul class="sub_nav">
				<li class="sub_nav_tab">
					<form id="searchform" action="/kflix/browse/search"></form> <input
					id="search" type="checkbox" style="display: none;"> <input
					id="searchinput" form="searchform" name="searchValue" type="text"
					style="display: none; border: none; width: 120px; margin: 0px 9px; padding: 3px 15px; border-radius: 0.3rem;"
					autocomplete="off"> <label for="search"><i
						class="fas fa-search color_white nav-icon"></i></label>
				</li>
				<li class="sub_nav_tab"><i class="fas color_white fa-gift"></i></li>
				<li class="sub_nav_tab"><i class="fas color_white fa-bell"></i></li>



				<li class="sub_nav_tab"><button id="btnGroupDrop1"
						type="button" class="btn" data-bs-toggle="dropdown"
						aria-expanded="false" style="padding: 0; border: 0;">

						<i class="fas color_white fa-user"></i>
					</button>

					<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
						<li><a href="logout" class="dropdown-item">로그아웃</a></li>
						<li><a href="" id="ticket" class="dropdown-item"> 티켓구매</a></li>
						<li><a href="/kflix/service" class="dropdown-item">고객센터</a></li>
					</ul></li>
			</ul>
		</div>
	</header>






	<!-- scripts -->
	<script src="/kflix/resources/js/main/header.js"></script>
	<script type="text/javascript">
	

		search = document.getElementById('search');

		searchinput = document.getElementById('searchinput');

		search.addEventListener("click", function() {
			if (search.checked) {
				searchinput.style.display = 'inline-block';
			} else {
				if (searchinput.value != "") {
					console.log("서치 합니다")
					document.getElementById(searchinput.getAttribute('form'))
							.submit();
					searchinput.value = "";
				}
				searchinput.style.display = 'none';
			}
		});

		$(document)
				.ready(
						function() {
							$('#ticket')
									.click(
											function() {
												var email = '${login.email}';
												$
														.ajax({
															type : 'POST',
															url : "${pageContext.request.contextPath}/ticket/cert",
															dataType : "text",
															data : "email="
																	+ email,
															success : function(
																	result) {
																if (result == "Y") {
																	alert('인증처리된 회원입니다.\r\n이용권 구매페이지로 이동합니다.');
																	document.location.href = '${pageContext.request.contextPath}/ticket/info';
																} else if (result == "N"
																		|| result == ""
																		|| result == null) {
																	if (confirm('이용권을 구매하시려면 본인 인증을 먼저 해주세요. \r\n 본인 인증페이지로 이동할까요?')) {
																		document.location.href = '${pageContext.request.contextPath}/ticket/info';
																	}
																}
															},
															error : function(
																	error) {
																alert('[ 에러발생 ]'
																		+ error);
															}
														});
											})

						});
	</script>

</body>

</html>