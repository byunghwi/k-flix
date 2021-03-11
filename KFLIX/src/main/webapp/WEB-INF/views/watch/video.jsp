<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movie.movie_title }</title>
<link rel="icon"
    href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon"
    href="/kflix/resources/imgs/main/Favicon.png">
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
	href="/kflix/resources/css/watch/cssvideo.css">
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="/kflix/resources/css/common/netflix-fonts.css" />
<link rel="stylesheet"
	href="/kflix/resources/css/common/netflix-pulsate.css" />


<style type="text/css">
</style>
</head>
<body>
	<div id="videocon">

		<!-- <button onclick="savecurrentTime()">
	<i style="display: hidden;" id="back" class="fas fa-arrow-left color-w relative"> <span style="font-size: 15px;"> 뒤로가기 </span> </i>
	</button> -->

		<a onclick="savecurrentTime()"> <i style="display: hidden;"
			id="back" class="fas fa-arrow-left color-w relative"> <span
				style="font-size: 18px; vertical-align: middle;"> 뒤로가기 </span>
		</i>
		</a>

		<div id="newvideo">
			<video id="video" class="viewer" muted autoplay
				controlslist="nodownload" poster="${movie.poster_path }">
				<source src="${movie.video_path }" type="video/mp4">
			</video>
		</div>

		<div class="player" onclick="vidplay()">


			<div id="videobar" style="display: hidden;">
				<div class="progress">
					<div class="progress__filled"></div>
				</div>

				<div id="btns">
					<i id="restart" class=" fas fa-stop color-w"></i>
					<div style="display: inline-block;" id="playnpause" class="toggle"></div>
					<i id="rew" class="fas fa-undo-alt color-w">10</i> <i id="fastFwd"
						class="fas fa-redo-alt color-w">10</i>

					<div style="display: inline-block;" id="movie_id" class="color-w">${movie.movie_title }</div>
					<div style="display: inline-block; width: 1px;"></div>
					<div style="display: inline-block;" id="volume">
						<!-- 	<i onclick="volshow()" id="volumeicon" class="fas fa-volume-up color-w"></i> -->
						<input type="range" class="form-range" min="0" max="1" step="0.1"
							id="volrange">
					</div>

					<i onclick="openFullscreen()" class="fas fa-expand color-w"></i>

					<div style="display: inline-block;" id="playtime"
						class="color-w font-s">
						<div id="current"></div>
						<div id="duration"></div>
						<div></div>
					</div>
				</div>
			</div>
		</div>



		<div id="movieinfo" onclick="vidplay()">
			<h5 style="color: white;">시청 중인 콘텐츠</h5>
			<h3 style="color: white;">${movie.movie_title }</h3>
			<h5 style="color: white;">${movie.summary }</h5>
		</div>

		<div id="recommend" style="display: none;">
			<div class="container sizerecom" style="text-align: center;">
				<h5 id="recomtittle" style="margin-bottom: 25px;">추천 영상</h5>
				<c:forEach items="${Allmovie }" var="Allmovie" varStatus="status">
					<c:if
						test="${movie.genre_id1 eq Allmovie.genre_id1 or movie.genre_id2 eq Allmovie.genre_id1 or 
									movie.genre_id1 eq Allmovie.genre_id2 or movie.genre_id2 eq Allmovie.genre_id2 }">

						<c:if test="${movie.movie_id != Allmovie.movie_id }">
							<c:set var="sum" value="${sum+1}" />
							<c:if test="${sum < 4}">
								<a id="atag" class="atagname"
									href="<%=application.getContextPath()%>/browse/watch/${Allmovie.movie_id }">
									<div class="showimg">
										<img
											style="width: 100%; height: 150px; border-radius: 2% 2% 0 0;"
											src="${Allmovie.poster_path }" class="d-block dis hoverimg"
											alt="...">
											<c:forEach items="${Ranking }" var="Ranking"
												varStatus="status">
												<c:if test="${Allmovie.movie_id eq Ranking.movie_id}">
													<div class="topMark">
														TOP<br> <b style="font-size: 18px">10</b>
													</div>

												</c:if>
											</c:forEach>
											<c:forEach items="${newmovie }" var="newmovie"
												varStatus="status">
												<c:if test="${Allmovie.movie_id eq newmovie.movie_id}">
													<div class="newMark">N</div>
												</c:if>
											</c:forEach>
										<div class="imghover"
											style="position: resize; width: 100%; top: 0; left: 0; bottom: 0; z-index: 10; background-color: rgba(255, 255, 255, 0);">
											<div
												style="position: absolute; top: 23%; left: 33%; z-index: 20; width: 30%; height: 50%;"
												class="ru disin hoverru">
												<i
													style="position: absolute; font-size: 30px; top: 27%; left: 34%; bottom: 0; z-index: 10;"
													class="fas fa-play color-w hoverru"></i>
											</div>
										</div>
									</div>
								</a>
							</c:if>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>

	<script src="/kflix/resources/js/watch/jsvideo.js"></script>

	<script>
	console.log(document.referrer);
	
	
	var newvideo = document.getElementById("newvideo");
			console.log("${movie.movie_id}");
			console.log("${watching.watch_type}");
			
		
			if (window.performance.navigation.type == 1) {
				video.currentTime = "${watching.view_point}";
				savecurrentTime();
				location.href = "/kflix/browse";
			}else if (window.performance.navigation.type == 2) {
				location.href = "/kflix/browse";
			}else{
				<c:if test="${not empty watching }">
				<c:choose>
				<c:when test="${watching.watch_type eq 'WATCHING'}">
				video.currentTime = "${watching.view_point}";
				</c:when>
				<c:otherwise>
				video.currentTime = 0.00001;
				video.muted = false;
				video.play();
				</c:otherwise>
				</c:choose>
				</c:if>
			}
			
			sound();
			
			var video = document.getElementById('video');
			const player = document.querySelector('.player'); 
			const progress = player.querySelector('.progress'); 
			const progressBar = player.querySelector('.progress__filled');

			
			/* function togglePlay() { 
				const method = video.paused ? 'play' : 'pause';
				video[method](); 
			} */ 
			
			//video.addEventListener('click', togglePlay);

			
					function handleProgress() {
						const percent = (video.currentTime / video.duration) * 100;
						progressBar.style.flexBasis = percent+"%";
						}
					
					video.addEventListener('timeupdate', handleProgress);

						
					function scrub(e) {
						const scrubTime = (e.offsetX / progress.offsetWidth) * video.duration;
						video.currentTime = scrubTime; 
						e.stopPropagation();
						}
					
					let mousedown = false;
					
					progress.addEventListener('click', function scrub(e) {
						const scrubTime = (e.offsetX / progress.offsetWidth) * video.duration;
						video.currentTime = scrubTime; 
						e.stopPropagation();
						},false );
					
					progress.addEventListener('mousemove', (e) => mousedown && scrub(e)
							);
					progress.addEventListener('mousedown', () => mousedown = true); 
					progress.addEventListener('mouseup', () => mousedown = false);

			
			//video.addEventListener('click', togglePlay);
			
			function savecurrentTime() {
				
				<c:choose>
				<c:when test="${empty watching }">
				console.log("없음");
				var data = {
					watch_type : "WATCHING",
					movie_id : "${movie.movie_id}",
					email : "${email}",
					watch_date : "${today }",
					view_point : video.currentTime,
					result : 'create'
				}
				</c:when>
				<c:otherwise>
				console.log("있음");
				if (video.currentTime == video.duration) {
					console.log("종료가 맞음");
					var data = {
						watch_type : "WATCHED",
						movie_id : "${movie.movie_id}",
						email : "${email}",
						watch_date : "${today }",
						view_point : video.currentTime,
						result : 'update'
					}
				} else {
					var data = {
						watch_type : "WATCHING",
						movie_id : "${movie.movie_id}",
						email : "${email}",
						watch_date : "${today }",
						view_point : video.currentTime,
						result : 'update'
					}
					
				}
				</c:otherwise>
				</c:choose>

				var xhttp = new XMLHttpRequest();

				xhttp.open('Post', '/kflix/browse/${movie.movie_id}', true);
				xhttp.setRequestHeader('content-type', 'application/json');
				xhttp.send(JSON.stringify(data));
				string = document.referrer;
				
				location.href = string;
			}

			//미디어 재생이 종료되었을때 발생하는 이벤트 처리
			video.addEventListener("ended", event, false);

			function event(e) {
				recommend.style.display = 'block';
				playnpause.innerHTML = `<i id="play" class="fas fa-play color-w"></i>`;
				var data = {
					watch_type : "WATCHED",
					movie_id : "${movie.movie_id}",
					email : "${email}",
					watch_date : "${today }",
					view_point : video.currentTime,
					result : 'update'
				}

				var xhttp = new XMLHttpRequest();

				xhttp.open('Post', '/kflix/browse/${movie.movie_id}', true);
				xhttp.setRequestHeader('content-type', 'application/json');
				xhttp.send(JSON.stringify(data));
			}
		</script>
</body>
</html>