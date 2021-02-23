<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/watch/csstest.css">

<style type="text/css">
.sliderow {
	width: 100%;
	height: 207.5px;
	overflow: hidden;
	position: absolute;
	max-width: 100%;
}

.rowHeader {
	color: white;
	font-size: 15px;
	margin: 20px;
}

.slide_wrapper {
	position: absolute;
	margin: 0 auto;
	height: 145px;
	height: 145px;
	left: 100px;
}

.slides {
	position: absolute;
	left: 0;
	top: 0;
	transition: left 0.5s ease-out;
}

.atag {
	width: 250px;
	height: 145px;
}

.atagdiv {
	display: inline-block;
	position: relative;
	width: 250px;
	height: 145px;
	position: relative;
	border-radius: 0.5rem;
	border: 1px solid #333;
}

.dis {
	float: left;
	margin: 0 10px;
	width: 250px;
	border-radius: 0.5rem;
	height: 145px;
}

.img1 {
	margin: 0;
}

.videohover {
	opacity: 0;
	visibility: hidden;
	transition: all 1s;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	bottom: 0;
	z-index: 10;
	background-color: white;
	border-radius: 0.5rem;
}

.pagenum {
	float: right;
	position: absolute;
	top: 28px;
	right: 64px;
	visibility: hidden;
}

.video {
	width: 100%;
	height: 100%;
}

.pagenum {
	float: right;
	position: absolute;
	top: 28px;
	right: 64px;
	visibility: hidden;
}

.controls {
	position: absolute;
	width: 100%;
	top: 62.5px;
	text-align: center;
	margin: 0;
	left: 0;
}

.backopprev, .backopnext {
	position: absolute;
	background: #333333cf;
	height: 150.5px;
	width: 92px;
	color: #939393;
	font-size: 35px;
	padding-top: 45px;
	visibility: hidden;
	z-index: 10;
}

.backopprev {
	top: 0;
	left: 0;
	padding-left: 40px;
}

.backopnext {
	top: 0;
	right: 0;
	padding-right: 40px;
}

.prev, .next {
	position: absolute;
	height: 150.5px;
	width: 65px;
	color: #939393;
	font-size: 35px;
	padding-top: 45px;
	visibility: hidden;
	z-index: 10;
}

.prev:hover, .next:hover {
	color: white;
	font-size: 50px;
	padding-top: 31px;
}

.prev {
	top: 0;
	left: 0;
	padding-left: 40px;
}

.next {
	top: 0;
	right: 0;
	padding-right: 40px;
}
</style>

</head>
<body>
	<c:forEach items="${test }" var="test" varStatus="status">
		<c:forEach items="${test.movie }" var="Allmovie" varStatus="status">
			<c:choose>

				<c:when test="${not empty test.watch }">
					<div class="sliderow">
						<h2 class="rowHeader">"${login.email }"님이 시청 중인 콘텐츠</h2>
						<div class="slide_wrapper">
							<ul class="slides">
								<c:forEach items="${test.watch }" var="watch" varStatus="status">
									<c:if test="${watch.movie_id eq Allmovie.movie_id and watch.watch_type eq 'WATCHING'}">
										<li><a class="atag"
											href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
												<div class="atagdiv">
													<img style="margin: 0;" src="${Allmovie.poster_path }"
														class="dis img1" alt="...">
													<div class="videohover">
														<video class="video" muted autoplay loop
															poster="${Allmovie.poster_path}">
															<source src="${Allmovie.teaser_path}" type="video/mp4">
														</video>
													</div>
												</div>
										</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<div id="pagenum"></div>
						<p class="controls">
							<span class="backopprev"></span> <span class="backopnext"></span>
						</p>
						<p class="controls">
							<span class="prev"><i class="fas fa-chevron-left"></i></span> <span
								class="next"><i class="fas fa-chevron-right"></i></span>
						</p>
					</div>
				</c:when>


				<c:when test="${not empty test.wish}">
					<div class="sliderow">

						<h2 class="rowHeader">내가 찜한 콘텐츠</h2>
						<div class="slide_wrapper">
							<ul class="slides">
								<c:forEach items="${test.wish }" var="wish" varStatus="status">
									<c:if test="${wish.movie_id eq Allmovie.movie_id }">
										<li><a class="atag"
											href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
												<div class="atagdiv">
													<img style="margin: 0;" src="${Allmovie.poster_path }"
														class="d-block dis img1" alt="...">
													<div class="videohover">
														<video class="video" muted autoplay loop
															poster="${Allmovie.poster_path}">
															<source src="${Allmovie.teaser_path}" type="video/mp4">
														</video>
													</div>
												</div>
										</a></li>
									</c:if>
								</c:forEach>

							</ul>
						</div>
						<div id="pagenum"></div>
						<p class="controls">
							<span class="backopprev"></span> <span class="backopnext"></span>
						</p>
						<p class="controls">
							<span class="prev"><i class="fas fa-chevron-left"></i></span> <span
								class="next"><i class="fas fa-chevron-right"></i></span>
						</p>
					</div>

				</c:when>


				<c:when test="${not empty test.genre}">
					<c:forEach items="${test.genre }" var="genre" varStatus="status">
						<div class="sliderow">
							<h2 class="rowHeader">${genre.genre_name }</h2>
							<div class="slide_wrapper">
								<ul class="slides">
									<c:if
										test="${genre.genre_name eq Allmovie.GENRE_ID1 or genre.genre_name eq Allmovie.GENRE_ID2}">
										<li><a class="atag"
											href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
												<div class="atagdiv">
													<img style="margin: 0;" src="${Allmovie.poster_path }"
														class="d-block dis img1" alt="...">
													<div class="videohover">
														<video class="video" muted autoplay loop
															poster="${Allmovie.poster_path}">
															<source src="${Allmovie.teaser_path}" type="video/mp4">
														</video>
													</div>
												</div>
										</a></li>
									</c:if>
								</ul>
							</div>
							<div id="pagenum"></div>
							<p class="controls">
								<span class="backopprev"></span> <span class="backopnext"></span>
							</p>
							<p class="controls">
								<span class="prev"><i class="fas fa-chevron-left"></i></span> <span
									class="next"><i class="fas fa-chevron-right"></i></span>
							</p>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h2>모두 없음</h2>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:forEach>

</body>
</html>