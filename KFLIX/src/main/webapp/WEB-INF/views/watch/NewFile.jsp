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
	background-color: white;
}

.progress {
	color: rgba(255, 255, 255, 0.5);
	background-color: rgba(255, 255, 255, 0.5);
}

.progress__filled {
	background: #6AB6D8;
	padding: 10px;
}
</style>
</head>
<body>

	<div class="list container">
		<%-- 
		<c:if test="${not empty test.watch }">
			<div class="sliderow" style="top: 0px">
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
			<div class="sliderow" style="top: 210px">
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
		</c:if>



		<c:if test="${not empty test.genre}">
			<c:forEach items="${test.genre }" var="genre" varStatus="status">
				<c:forEach items="${test.movie }" var="Allmovie" varStatus="status">
					<c:if test="${genre.genre_id eq Allmovie.genre_id1}">
						<c:set var="sum" value="${sum+1}" />
						<div class="sliderow" style="top: ${210+210*sum}px">
							<h2 class="rowHeader">${genre.genre_name }</h2>
							<div class="slide_wrapper">
								<ul class="slides">
									<c:forEach items="${test.movie }" var="limovie"
										varStatus="status">
										<c:if
											test="${genre.genre_id eq limovie.genre_id1 or genre.genre_id eq limovie.genre_id2 }">
											<li><a class="atag"
												href="<%=application.getContextPath()%>/browse/${limovie.movie_id }">
													<div class="atagdiv">
														<img style="margin: 0;" src="${limovie.poster_path }"
															class="d-block dis img1" alt="...">
														<div class="videohover">
															<video class="video" muted autoplay loop
																poster="${limovie.poster_path}">
																<source src="${limovie.teaser_path}" type="video/mp4">
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
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:if>
		 --%>
		<div>
			<div class="player">
				<video class=" viewer"
					src="https://player.vimeo.com/external/194837908.sd.mp4?s=c350076905b78c67f74d7ee39fdb4fef01d12420&profile_id=164"></video>
				<div class="player__controls">
					<div class="progress">
						<div class="progress__filled"></div>
					</div>
					<button class="player__button toggle" title="Toggle Play">►</button>
					<input type="range" name="volume" class="player__slider" min="0"
						max="1" step="0.05" value="1"> <input type="range"
						name="playbackRate" class="player__slider" min="0.5" max="2"
						step="0.1" value="1">
					<button data-skip="-10" class="player__button">« 10s</button>
					<button data-skip="25" class="player__button">25s »</button>
				</div>
			</div>


		</div>
	</div>
	<script type="text/javascript">
	/* Get Our Elements */ 
	const player = document.querySelector('.player'); 
	const video = player.querySelector('.viewer'); 
	const progress = player.querySelector('.progress'); 
	const progressBar = player.querySelector('.progress__filled'); 
	const toggle = player.querySelector('.toggle'); 
	const skipButtons = player.querySelectorAll('[data-skip]'); 
	const ranges = player.querySelectorAll('.player__slider');

	
	function togglePlay() { 
		const method = video.paused ? 'play' : 'pause';
		video[method](); 
	} 
	
	video.addEventListener('click', togglePlay);

	
	
	function updateButton() { 
		const icon = this.paused ? '►' : '❚ ❚'; 
		console.log(icon); 
		toggle.textContent = icon; 
		}
	
	video.addEventListener('play', updateButton); 
	video.addEventListener('pause', updateButton); 

	
	
		function skip() { 
			video.currentTime += parseFloat(this.dataset.skip); 
			}
		
		skipButtons.forEach(button => 
		button.addEventListener('click', skip)
		);

			function handleRangeUpdate() {
				video[this.name] = this.value;
				} 
			
			ranges.forEach(range => 
			range.addEventListener('click', handleRangeUpdate)); 
			
			ranges.forEach(
				range => range.addEventListener('change', handleRangeUpdate));

			
			function handleProgress() {
				const percent = (video.currentTime / video.duration) * 100;
				progressBar.style.flexBasis = percent+"%";
				} 
			
			video.addEventListener('timeupdate', handleProgress);

				
			function scrub(e) {
				const scrubTime = (e.offsetX / progress.offsetWidth) * video.duration;
				video.currentTime = scrubTime; 
				} 
			
			let mousedown = false;
			progress.addEventListener('click', scrub); 
			progress.addEventListener('mousemove', (e) => mousedown && scrub(e)
					);
			progress.addEventListener('mousedown', () => mousedown = true); 
			progress.addEventListener('mouseup', () => mousedown = false);

				
					

		/* 	// 배열 생성 (초기 값 할당)
			i = 0;
			<c:forEach items="${test.movie }" var="Allmovie" varStatus="status">
			arr[i] = "${Allmovie.genre_id1 }";
			i++;
			arr[i] = "${Allmovie.genre_id2 }";
			i++;s
			</c:forEach>
			console.log(arr.length);
			console.log(arr);
			const set = new Set(arr);
			console.log(set);
		 */
	</script>
	<script src="/kflix/resources/js/watch/jstest.js?var=2"></script>
</body>
</html>