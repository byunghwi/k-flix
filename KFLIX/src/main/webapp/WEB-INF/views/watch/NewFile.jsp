<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/watch/csstest.css">

</head>
<body>

	<div class="list container">

		<c:if test="${not empty test.watch }">
			<div class="sliderow">
				<h2 class="rowHeader">"${login.email }"님이 시청 중인 콘텐츠</h2>
				<div class="slide_wrapper">
					<ul class="slides">
						<c:forEach items="${test.watch }" var="watch" varStatus="status">
							<c:forEach items="${test.movie }" var="Allmovie"
								varStatus="status">
								<c:if
									test="${watch.movie_id eq Allmovie.movie_id and watch.watch_type eq 'WATCHING'}">
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
		</c:if>

		<%-- 	<c:forEach items="${test.watch }" var="watch" varStatus="status">
			<c:if test="${not empty test.wish}">
				<div class="sliderow">

					<h2 class="rowHeader">내가 찜한 콘텐츠</h2>
					<div class="slide_wrapper">
						<ul class="slides">
							<c:forEach items="${test.wish }" var="wish" varStatus="status">
								<c:forEach items="${test.movie }" var="Allmovie"
									varStatus="status">
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
									<c:forEach items="${test.movie }" var="Allmovie"
										varStatus="status">
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
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h2>모두 없음</h2>
				</c:otherwise>
				</c:choose>
		</c:forEach>

 --%>
	</div>
<script src="/kflix/resources/js/watch/jsinfo.js"></script>
</body>
</html>