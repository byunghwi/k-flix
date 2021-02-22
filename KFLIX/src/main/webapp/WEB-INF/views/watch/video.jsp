<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movie.movie_title }</title>
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


</head>
<body>
	<div id="videocon">

		<!-- <button onclick="savecurrentTime()">
	<i style="display: hidden;" id="back" class="fas fa-arrow-left color-w relative"> <span style="font-size: 15px;"> 뒤로가기 </span> </i>
	</button> -->

		<a onclick="savecurrentTime()"
			href="<%=application.getContextPath()%>/browse/${movie.movie_id }">
			<i style="display: hidden;" id="back"
			class="fas fa-arrow-left color-w relative"> <span
				style="font-size: 15px;"> 뒤로가기 </span>
		</i>
		</a>

		<div id="videobar" style="display: hidden;">
			<div>
				<progress id='progressbar' class="progressbar" value='5'></progress>
			</div>
			<i id="restart" onclick="restart()" class=" fas fa-stop color-w"></i>
			<div style="display: inline-block;" onclick="vidplay()"
				id="playnpause">
				<i id="play" class="fas fa-pause color-w"></i>
			</div>

			<i id="rew" onclick="skip(-10)" class="fas fa-undo-alt color-w">10</i>
			<i id="fastFwd" onclick="skip(10)" class="fas fa-redo-alt color-w">10</i>
			<div style="display: inline-block;" id="volume">
				<!-- <i onclick="volshow()" id="volumeicon" class="fas fa-volume-up color-w"></i> -->
				<input type="range" class="form-range" min="0" max="1" step="0.1"
					id="volrange">
			</div>
			<div style="display: inline-block;" id="movie_id" class="color-w">${movie.movie_title }</div>
			<i onclick="openFullscreen()" class="fas fa-expand color-w"></i>
			<div style="display: inline-block;" id="playtime" class="color-w"></div>
		</div>
		<video id="video" onclick="vidplay()" muted autoplay
			poster="${movie.poster_path }">
			<source src="${movie.video_path }" type="video/mp4">
		</video>


		<div id="movieinfo" onclick="vidplay()">
			<h5 style="color: white;">시청 중인 콘텐츠</h5>
			<h3 style="color: white;">${movie.movie_title }</h3>
			<br>
			<h5 style="width: 500px; color: white;">${movie.summary }</h5>
		</div>

		<div id="recommend" style="display: none;">
			<h5>추천 영상</h5>
			<c:forEach items="${Allmovie }" var="Allmovie" varStatus="status">
				<c:if
					test="${movie.genre_id1 eq Allmovie.genre_id1 or movie.genre_id2 eq Allmovie.genre_id1 or 
									movie.genre_id1 eq Allmovie.genre_id2 or movie.genre_id2 eq Allmovie.genre_id2 }">

					<c:if test="${movie.movie_id != Allmovie.movie_id }">
					<c:set var="sum"  value="${sum+1}" />
					<c:if test="${sum < 4}">
							<a id="atag" class="atagname" href="<%=application.getContextPath()%>/browse/watch/${Allmovie.movie_id }">
								<div class="show">
									<img
										style="width: 100%; height: 150px; border-radius: 2% 2% 0 0;"
										src="${Allmovie.poster_path }" class="d-block dis hoverimg"
										alt="...">
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

	<script src="/kflix/resources/js/watch/jsvideo.js"></script>

	<script>
	
		console.log("${movie.movie_id}");
		sound();
		var video = document.getElementById('video');
		<c:forEach items="${watch }" var="watch" varStatus="status">
		<c:if test="${watch.movie_id eq movie.movie_id }">
		video.currentTime = "${watch.view_point}";
		</c:if>
		</c:forEach>

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

			var xhttp = new XMLHttpRequest();

			xhttp.open('Post', '/kflix/browse/${movie.movie_id}', true);
			xhttp.setRequestHeader('content-type', 'application/json');
			xhttp.send(JSON.stringify(data));
			</c:when>
			<c:otherwise>
			console.log("있음");
			var data = {
				watch_type : "WATCHING",
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
			</c:otherwise>
			</c:choose>

		}
	</script>
</body>
</html>