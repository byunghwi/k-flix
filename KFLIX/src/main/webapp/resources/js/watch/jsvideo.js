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
	playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-pause color-w"></i>`;
} else {
	playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-play color-w"></i>`;
}
video.volume = '0.5';

recommend.addEventListener("click", (e) => {
	recommend.style.display = 'none';

});

videocon.addEventListener("mousemove", function(e) {
	back.style.display = 'block';
	videobar.style.display = 'block';
	movieinfo.style.opacity = '0';
	ybefore = e.clientY;
	xbefore = e.clientX;
	setTimeout(function() {
		if (xbefore == e.clientX && ybefore == e.clientY) {
			back.style.display = 'none';
			videobar.style.display = 'none';
			if (video.paused && movieinfo.style.opacity == '0' && recommend.style.display != 'block') {
				movieinfo.style.opacity = '1';
			}
		}
	}, 5000);

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
		movieinfo.style.opacity = '0';
		playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-pause color-w"></i>`;
	} else {
		video.pause();
		setTimeout(function() {
			if (video.paused) {
				if (recommend.style.display != 'block') {
					movieinfo.style.opacity = '1';
				}
			} else {
				movieinfo.style.opacity = '0';
			}
		}, 5000);
		playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-play color-w"></i>`;
	}
	recommend.style.display = 'none';
}

function restart() {
	if (video.paused) {
		video.play();
		playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-pause color-w"></i>`;
	}
	video.currentTime = 0;
}

function volshow() {
	volume.innerHTML += `<input type="range" onclick="vidplay()" class="form-range" id="customRange1">`;
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
	document.getElementById("current").innerHTML = Math.floor(video.currentTime);
	document.getElementById("duration").innerHTML = Math.floor(video.duration);
}

console.log("${movie.movie_id}");
