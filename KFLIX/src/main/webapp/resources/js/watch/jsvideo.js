var video = document.getElementById('video');
var button = document.getElementById("play");
var playdiv = document.getElementById("playnpause");
var volume = document.getElementById("volume");
var volrange = document.getElementById("volrange");
var back = document.getElementById('back');
var videocon = document.getElementById('videocon');
var videobar = document.getElementById('videobar');
var movieinfo = document.getElementById('movieinfo');
var recommend = document.getElementById('recommend');

if (video.paused) {
		playnpause.innerHTML = `<i id="play" class="fas fa-pause color-w"></i>`;
	} else {
		playnpause.innerHTML = `<i id="play" class="fas fa-play color-w"></i>`;
	}

recommend.addEventListener("click", (e) => {
	recommend.style.display = 'none';
});

videocon.addEventListener("mouseover", function() {
	back.style.display = 'block';
	videobar.style.display = 'block';
	movieinfo.style.display = 'none';
});

videocon.addEventListener("mouseout", function() {
	back.style.display = 'none';
	videobar.style.display = 'none';
});

volrange.addEventListener("change", (e) => {
	video.volume = volrange.value;
});

function sound() {
	video.muted = false;
}

function vidplay() {
	if (video.paused) {
		video.play();
		movieinfo.style.display = 'none';
		playnpause.innerHTML = `<i id="play" class="fas fa-pause color-w"></i>`;
	} else {
		video.pause();
		setTimeout(function() {
			if (video.paused) {
				if (recommend.style.display == 'none') {
					movieinfo.style.display = 'block';
					movieinfo.style.opacity = '1';
				}
			} else {
				movieinfo.style.display = 'none';
			}
		}, 3000);
		playnpause.innerHTML = `<i id="play" class="fas fa-play color-w"></i>`;
	}
}

function restart() {
	if (video.paused) {
		video.play();
		playnpause.innerHTML = `<i id="play" class="fas fa-pause color-w"></i>`;
		}
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

function PlayTime(e) {
	
	document.getElementById("playtime").innerHTML =
		"재생 상태 : " + Math.floor(video.currentTime) + "/" + Math.floor(video.duration);
}

video.addEventListener(
	"timeupdate",
	function() {
		/*      var percent = Math.floor(100 / video.duration * video.currentTime);
	   progressbar.getElementsByTagName("span")[0].innerHTML = percent;*/
		progressbar.value = Math.floor(video.currentTime);
		progressbar.max = Math.floor(video.duration);
	},
	false
);
console.log("${movie.movie_id}");

/*function savecurrentTime() {
var form = document.createElement("form");
            form.setAttribute("method", "post");
            form.setAttribute("action", "/kflix/browse/" + video.currentTime);
            document.body.appendChild(form);
            form.submit();
}*/