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


var restart = document.getElementById('restart');
var rew = document.getElementById('rew');
var fastFwd = document.getElementById('fastFwd');

if (video.paused) {
	playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-pause color-w"></i>`;
} else {
	playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-play color-w"></i>`;
}

video.volume = '0.5';

videobar.addEventListener("click", (e) => {
	movieinfo.style.opacity = '0';
	e.stopPropagation();
}, false)

restart.addEventListener("click", function(e) {
	if (video.paused) {
		video.play();
		playnpause.innerHTML = `<i id="play" class="fas fa-pause color-w"></i>`;
	}
	movieinfo.style.opacity = '0';
	video.currentTime = 0;
	e.stopPropagation();
}, false)

playnpause.addEventListener("click", function(e) {
	movieinfo.style.opacity = '0';
	vidplay();
	e.stopPropagation();
}, false)


rew.addEventListener("click",
	function skip(e) {
		movieinfo.style.opacity = '0';
		video.currentTime -= 10;
		e.stopPropagation();
	}, false)


fastFwd.addEventListener("click",
	function skip(e) {
		movieinfo.style.opacity = '0';
		video.currentTime += 10;
		e.stopPropagation();
	}, false)


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
		if (xbefore == e.clientX && ybefore == e.clientY && e.clientY < 816) {
			back.style.display = 'none';
			videobar.style.display = 'none';
			if (video.paused && movieinfo.style.opacity == '0' && recommend.style.display != 'block') {
				movieinfo.style.opacity = '1';
			}
		}
	}, 2000);

});

videocon.addEventListener("mouseout", function() {
	back.style.display = 'none';
	videobar.style.display = 'none';
});

volrange.addEventListener("click", function(e) {
	video.volume = volrange.value;
	e.stopPropagation();
}, false)

function sound() {
	video.muted = false;
}

function vidplay() {

	if (video.paused) {
		video.play();
		movieinfo.style.opacity = '0';
		playnpause.innerHTML = `<i id="play" class="fas fa-pause color-w"></i>`;
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
		}, 2000);
		playnpause.innerHTML = `<i id="play" class="fas fa-play color-w"></i>`;
	}
	recommend.style.display = 'none';
}



function volshow() {
	volume.innerHTML += `<input type="range" class="form-range" id="customRange1">`;
}


function openFullscreen() {
	if (video.requestFullscreen) {
		video.requestFullscreen();
	} else if (video.webkitRequestFullscreen) {
		video.webkitRequestFullscreen();
	} else if (video.msRequestFullscreen) {
		video.msRequestFullscreen();
	}
}

// timeupdate : 재생중에 지속적으로 발생	
video.addEventListener("timeupdate", PlayTime, false);
current = document.getElementById("current");
duration = document.getElementById("duration");

function PlayTime(e) {
	remain = Math.floor(video.duration - video.currentTime);

	if (remain < 60) { // 초단위
		if (remain < 10) { // 10초전
			duration.innerHTML = "00:0" + remain;
		} else {
			duration.innerHTML = "00:" + remain;
		}
	} else if (remain < 3600) { // 분단위
		if (Math.floor(remain / 60) < 10) { // 10분전 
			if (Math.floor(remain - Math.floor(remain / 60) * 60) < 10) { // 10초전
				duration.innerHTML = "0" + Math.floor(remain / 60) + ":0" + Math.floor(remain - Math.floor(remain / 60) * 60);
			} else {
				duration.innerHTML = "0" + Math.floor(remain / 60) + ":" + Math.floor(remain - Math.floor(remain / 60) * 60);
			}
		} else {
			if (Math.floor(remain - Math.floor(remain / 60) * 60) < 10) { // 10초전
				duration.innerHTML = Math.floor(remain / 60) + ":0" + Math.floor(remain - Math.floor(remain / 60) * 60);
			} else {
				duration.innerHTML = Math.floor(remain / 60) + ":" + Math.floor(remain - Math.floor(remain / 60) * 60);
			}

		}
	} else if (remain < 86400) { // 시간단위
		if (Math.floor(remain / 3600) < 10) { // 10시전
			if (Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) < 10) { // 10분전
				if (Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60) < 10) { // 10초전
					duration.innerHTML = "0" + Math.floor(remain / 3600) + ":0" + Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) + ":0" + Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60);
				} else {
					duration.innerHTML = "0" + Math.floor(remain / 3600) + ":0" + Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) + ":" + Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60);
				}
			} else {
				if (Math.floor(remain - (remain / 60) * 60) < 10) { // 10초전
					duration.innerHTML = "0" + Math.floor(remain / 3600) + ":" + Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) + ":0" + Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60);
				} else {
					duration.innerHTML = "0" + Math.floor(remain / 3600) + ":" + Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) + ":" + Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60);
				}
			}
		} else {
			if (remain < 600) { // 10분전
				if (Math.floor(remain - (remain / 60) * 60) < 10) { // 10초전
					duration.innerHTML = Math.floor(remain / 3600) + ":0" + Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) + ":0" + Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60);
				} else {
					duration.innerHTML = Math.floor(remain / 3600) + ":0" + Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) + ":" + Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60);
				}
			} else {
				if (Math.floor(remain - (remain / 60) * 60) < 10) { // 10초전
					duration.innerHTML = Math.floor(remain / 3600) + ":" + Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) + ":0" + Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60);
				} else {
					duration.innerHTML = Math.floor(remain / 3600) + ":" + Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) + ":" + Math.floor(Math.floor((Math.floor(remain / 3600) * 3600) / 60) - Math.floor((remain - Math.floor(remain / 3600) * 3600) / 60) * 60);
				}
			}
		}
	}

}

console.log("${movie.movie_id}");
