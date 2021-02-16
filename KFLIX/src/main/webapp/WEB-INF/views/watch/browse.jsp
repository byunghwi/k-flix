<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/watch/cssbrowse.css">
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div style="max-width: 100%" class="container flex-row nav-bar">
		<img class="logo" alt="로고"
			src="/kflix/resources/imgs/watch/kflixlogo.png">
		<ul class="nav" style="margin: 0 100px 0 0;">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">홈</a></li>
			<li class="nav-item"><a class="nav-link" href="#">TV프로그램</a></li>
			<li class="nav-item"><a class="nav-link" href="#">영화</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#"
				tabindex="-1"">NEW!요즘 대세 콘텐츠</a></li>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">내가 찜한 콘텐츠</a></li>
		</ul>
		<div class="">
			<i class="fas fa-search color_white nav-icon"></i> <i
				class="fas fa-gift color_white nav-icon"></i> <i
				class="fas fa-bell color_white nav-icon"></i> <i
				style="background-color: white; width: 40px"
				class="fas fa-child nav-icon"></i>
		</div>
	</div>
	
	<div id="shadow1"></div>
	<div style="margin: 0" class="container background">
		<img id="mainimg" alt="메인사진"
			src="/kflix/resources/imgs/watch/runon1.png">
		<!-- <img alt="" src="/kflix/resources/imgs/watch/nav-shadow.png"> -->
	</div>
	
	<div id="list">
	
		<div id="carouselExampleIndicators" class="carousel slide padd"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/kflix/resources/imgs/watch/runon1.png" class="d-block dis" alt="...">
					<img src="/kflix/resources/imgs/watch/test1.png" class="d-block dis" alt="...">
					<img src="/kflix/resources/imgs/watch/test2.png" class="d-block dis" alt="...">
					<img src="/kflix/resources/imgs/watch/test3.png" class="d-block dis" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/kflix/resources/imgs/watch/runon1.png" class="d-block dis" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/kflix/resources/imgs/watch/runon1.png" class="d-block dis" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
	</div>

</body>
</html>