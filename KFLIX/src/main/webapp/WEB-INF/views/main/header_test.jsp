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
				<li class="main_nav_tab">홈</li>
				<li class="main_nav_tab">TV 프로그램</li>
				<li class="main_nav_tab">영화</li>
				<li class="main_nav_tab">최신 콘텐츠</li>
				<li class="main_nav_tab">내가 찜한 콘텐츠</li>
			</ul>
			<ul class="sub_nav">
				<li class="sub_nav_tab"><i class="fas fa-search"></i></li>
				<li class="sub_nav_tab"><i class="fas fa-gift"></i></li>
				<li class="sub_nav_tab"><i class="fas fa-bell"></i></li>
				<li class="sub_nav_tab"><i class="fas fa-user"></i></li>
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

		$(document).ready(function() {
			$('#ticket').click(
					function() {
							var email = '${login.email}';
							$.ajax({
								type : 'POST',
								url : "${pageContext.request.contextPath}/ticket/cert",
								dataType : "text",
								data : "email="+ email,
								success : function(result) 
								{
									if (result == "Y") 
										{
											alert('인증처리된 회원입니다.\r\n이용권 구매페이지로 이동합니다.');
											document.location.href = '${pageContext.request.contextPath}/ticket/info';
										} else if (result == "N" || result == "" || result == null) {
											if (confirm('이용권을 구매하시려면 본인 인증을 먼저 해주세요. \r\n 본인 인증페이지로 이동할까요?')) {
												document.location.href = '${pageContext.request.contextPath}/ticket/info';
											}
										}
								},error : function(error) {
									alert('[ 에러발생 ]'+ error);
								}});
			})

		});
	</script>

</body>

</html>