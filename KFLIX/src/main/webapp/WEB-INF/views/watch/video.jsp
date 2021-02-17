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
	href="/kflix/resources/css/watch/cssvideo.css">
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>


</head>
<body>
<div onclick="sound()" id="videocon">
	<button onclick="savecurrentTime()">
	<i style="display: hidden;" id="back" class="fas fa-arrow-left color-w relative"> <span style="font-size: 15px;"> 뒤로가기 </span> </i>
	</button>
	
		<div id="videobar" style="display: hidden;">
			<div>
				<progress id='progressbar' class="progressbar" max='100' value='5'></progress>
			</div>
			<i id="restart" onclick="restart()" class=" fas fa-stop color-w"></i>
			<div style="display: inline-block;" id="playnpause">
				<i id="play" onclick="vidplay()" class="fas fa-pause color-w"></i>
			</div>
			<i id="rew" onclick="skip(-10)" class="fas fa-undo-alt color-w">10</i>
			<i id="fastFwd" onclick="skip(10)" class="fas fa-redo-alt color-w">10</i>
			<div style="display: inline-block;" id="volume">
				<!-- <i onclick="volshow()" id="volumeicon" class="fas fa-volume-up color-w"></i> -->
				<input type="range" class="form-range" min="0" max="1" step="0.1"
					id="volrange">

			</div>
			<i class="fas fa-step-forward color-w"></i> <i
				class="fas fa-layer-group color-w"></i> <i
				onclick="openFullscreen()" class="fas fa-expand color-w"></i>
			<div style="display: inline-block;" id="playtime" class="color-w"></div>

		</div>
		
	<video id="video" muted autoplay loop
		poster="/kflix/resources/imgs/watch/iu.jpg">
		<source src="${watch.video_path }" type="video/mp4">
	</video>

	</div>

	<script src="/kflix/resources/js/watch/jsvideo.js"></script>
</body>
</html>