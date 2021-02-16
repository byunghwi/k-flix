var video = document.getElementById('video');
var button = document.getElementById("play");
var playdiv = document.getElementById("playnpause");
var volume = document.getElementById("volume");
var volrange = document.getElementById("volrange");

/* volume.addEventListener("mouseover", function() {
	volume.innerHTML = `<input type="range" class="form-range" id="customRange1">`;
}); */

volrange.addEventListener("change", (e) => {
	video.volume = volrange.value;
});

function sound() {
	video.muted = false;
}

function vidplay() {
	if (video.paused) {
		video.play();
		playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-pause color-w"></i>`;
	} else {
		video.pause();
		playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-play color-w"></i>`;
	}
}

function restart() {
	video.currentTime = 0;
}

function volshow() {
	volume.innerHTML += `<input type="range" class="form-range" id="customRange1">`;
}

function skip(value) {
	video.currentTime += value;
}

function openFullscreen() {
	if (video.requestFullscreen) {
		video.requestFullscreen();
	} else if (video.webkitRequestFullscreen) { /* Safari */
		video.webkitRequestFullscreen();
	} else if (video.msRequestFullscreen) { /* IE11 */
		video.msRequestFullscreen();
	}
}

// timeupdate : 재생중에 지속적으로 발생
video.addEventListener("timeupdate", PlayTime, false);
//미디어 재생이 종료되었을때 발생하는 이벤트 처리
video.addEventListener("ended", event, false);

function PlayTime(e) {
	document.getElementById("playtime").innerHTML =
		"재생 상태 : " + Math.floor(video.currentTime) + "/" + Math.floor(video.duration);
}

function event(e) {
	//이벤트가 발생하였을 경우에 대한 처리
	alert("미디어 재생이 완료되었습니다.");
}

video.addEventListener(
      "timeupdate",
      function() {
        var percent = Math.floor(100 / video.duration * video.currentTime);
        progressbar.value = Math.floor(video.currentTime);
 progressbar.max = Math.floor(video.duration);
        progressbar.getElementsByTagName("span")[0].innerHTML = percent;
      },
      false
    );