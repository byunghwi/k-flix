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
<style type="text/css">
body {
	
}
</style>
</head>
<body>
	<%-- 
	<div class="list container">

		<c:if test="${not empty test.watch }">
			<div class="sliderow0" style="top: 0px">
				<h2 class="rowHeader0">"${login.email }"님이 시청 중인 콘텐츠</h2>
				<div class="slide_wrapper0">
					<ul class="slides0">
						<c:forEach items="${test.watch }" var="watch" varStatus="status">
							<c:forEach items="${test.movie }" var="Allmovie"
								varStatus="status">
								<c:if
									test="${watch.movie_id eq Allmovie.movie_id and watch.watch_type eq 'WATCHING'}">
									<li class="slideli0"><a class="atag"
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
				<div class="pagenum"></div>
				<p class="controls">
					<span class="backopprev"></span> <span class="backopnext"></span>
				</p>
				<p class="controls">
					<span class="prev"><i class="fas fa-chevron-left"></i></span> <span
						class="next"><i class="fas fa-chevron-right"></i></span>
				</p>
			</div>
		</c:if>
	
		<c:if test="${not empty test.wish}">
			<div class="sliderow1" style="top: 210px">
				<h2 class="rowHeader1">내가 찜한 콘텐츠</h2>
				<div class="slide_wrapper1">
					<ul class="slides1">
						<c:forEach items="${test.wish }" var="wish" varStatus="status">
							<c:forEach items="${test.movie }" var="Allmovie"
								varStatus="status">
								<c:if test="${wish.movie_id eq Allmovie.movie_id }">
									<li class="slideli1"><a class="atag"
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
		</c:if>
 --%>


	<c:if test="${not empty movie_genre}">
		<c:forEach items="${movie_genre }" var="movie_genre"
			varStatus="status">
			<c:set var="i" value="${i+1}" />
			<c:forEach items="${test.genre }" var="genre" varStatus="status">
				<c:if test="${movie_genre eq genre.genre_id}">
					<c:set var="sum" value="${sum+1}" />
					<div class="sliderow${i}" style="top: ${210+210*sum}px">
						<h2 class="rowHeader${i}">${genre.genre_name }</h2>
						<div class="slide_wrapper${i}">
							<ul class="slides${i}">
								<c:forEach items="${test.movie }" var="Allmovie"
									varStatus="status">
									<c:if
										test="${Allmovie.genre_id1 eq genre.genre_id or Allmovie.genre_id2 eq genre.genre_id }">
										<li class="slideli${i}"><a class="atag"
											href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
												<div class="atagdiv">
													<img src="${Allmovie.poster_path }" class=" dis img1"
														alt="...">
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
						<div class="pagenum${i}"></div>
						<p class="controls${i}">
							<span class="backopprev${i}"></span> <span class="backopnext${i}"></span>
						</p>
						<p class="controls${i}">
							<span class="prev${i}"><i class="fas fa-chevron-left"></i></span>
							<span class="next${i}"><i class="fas fa-chevron-right"></i></span>
						</p>
					</div>
				</c:if>
			</c:forEach>
		</c:forEach>
	</c:if>

	<script type="text/javascript">
		console.log("sdfs");

		<c:forEach items="${movie_genre }" var="movie_genre"
		varStatus="status">
		<c:set var="j" value="${j+1}" />
			console.log(${j});
			
		var 
				slides = document.querySelector('.slides${j}'), 
				
				slide_wrapper = document.querySelector('.slide_wrapper${j}'), 
				
				slide = document.querySelectorAll('.slides${j} li'),
				
				currentIdx = 0, 
				
				slideCount = slide.length, 
				
				prevBtn = document.querySelector('.prev${j}'), 
				
				backopprev = document.querySelector('.backopprev${j}'),
				
				backopnext = document.querySelector('.backopnext${j}'), 
				
				slideWidth = 250, 
				slideMargin = 10, 
				slideShow = 4, 
				allpagenum = Math.ceil(slideCount / slideShow), 
				
				nextBtn = document.querySelector('.next${j}'), 
				
				currentPagenum = 1, 
				
				sliderow = document.querySelector('.sliderow${j}'), 
				
				pagenumdiv = document.querySelector('.pagenum${j}');

		
		slides.style.width = (slideWidth + slideMargin) * slideCount
				- slideMargin + 'px';
		slide_wrapper.style.width = (slideWidth + slideMargin) * slideShow
				- slideMargin + 'px';

		
		//슬라이드 페이지 view 시 버튼 나타내기
		for (i = 1; i <= allpagenum; i++) {
			if (i == 1) {
				pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
			} else {
				pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
			}
		}

		//슬라이드 마우스오버 시 버튼 나타내기
		sliderow.addEventListener("mouseover", function() {
			pagenumdiv.style.visibility = 'visible';

			if (allpagenum > slideShow) {
				prevBtn.style.visibility = 'visible';
				nextBtn.style.visibility = 'visible';
			}

			if (currentPagenum == allpagenum) {
				nextBtn.style.visibility = 'hidden';
			}
			if (currentPagenum == 1) {
				prevBtn.style.visibility = 'hidden';
			}

		});
		
		//슬라이드 마우스아웃 시 버튼 숨기기
		sliderow.addEventListener("mouseout", function() {
			prevBtn.style.visibility = 'hidden';
			nextBtn.style.visibility = 'hidden';
			pagenumdiv.style.visibility = 'hidden';
		});

		function moveSlide(num) {
			slides.style.left = -num * (slideWidth + slideMargin) + 'px';
			currentIdx = num;
			currentPagenum = currentIdx == 0 ? 1 : Math.floor(currentIdx
					/ slideShow) + 1;
		}

		nextBtn
				.addEventListener(
						'click',
						function() {
							if (currentPagenum > 0) {
								moveSlide(currentIdx + slideShow);
								pagenumdiv.innerHTML = ``;
								for (i = 1; i <= allpagenum; i++) {
									if (i == currentPagenum) {
										pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
									} else {
										pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
									}
								}
								prevBtn.style.visibility = 'visible';
								backopprev.style.visibility = 'visible';
								if (currentPagenum == allpagenum) {
									nextBtn.style.visibility = 'hidden';
									backopnext.style.visibility = 'hidden';
								}
							} else {
								/*moveSlide(0); 첫페이지*/
								nextBtn.style.visibility = 'hidden';
								backopnext.style.visibility = 'hidden';
							}
						});

		if (currentPagenum == 1) {
			if (slideCount <= slideShow) {
				nextBtn.style.visibility = 'hidden';
				backopnext.style.visibility = 'hidden';
				pagenumdiv.style.visibility = 'visible';
			} else {
				backopnext.style.visibility = 'visible';
			}

			pagenumdiv.style.visibility = 'visible';
			prevBtn.style.visibility = 'hidden';
			backopprev.style.visibility = 'hidden';
		}

		prevBtn
				.addEventListener(
						'click',
						function() {
							if (currentPagenum <= allpagenum) {
								moveSlide(currentIdx - slideShow);
								pagenumdiv.innerHTML = ``;
								for (i = 1; i <= allpagenum; i++) {
									if (i == currentPagenum) {
										pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
									} else {
										pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
									}
								}
								nextBtn.style.visibility = 'visible';
								backopnext.style.visibility = 'visible';
								if (currentPagenum == 1) {
									prevBtn.style.visibility = 'hidden';
									backopprev.style.visibility = 'hidden';
								}
							} else {
								/*moveSlide(slideCount - slideShow);*/
								prevBtn.style.visibility = 'hidden';
								prevBtn.style.visibility = 'hidden';
							}
						});
		</c:forEach>
	</script>


	<script src="/kflix/resources/js/watch/jstest.js?var=2">
		
	</script>
</body>
</html>