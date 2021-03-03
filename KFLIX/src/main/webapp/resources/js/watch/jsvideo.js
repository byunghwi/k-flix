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


history.pushState({ page: "first" }, document.title, location.pathname + '#first');

window.addEventListener('popstate', function(e) {
	history.pushState({ page: "historyChanged" }, document.title, location.pathname + '#changed');

});

if (video.paused) {
	playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-pause color-w"></i>`;
} else {
	playnpause.innerHTML = `<i id="play" onclick="vidplay()" class="fas fa-play color-w"></i>`;
}

video.volume = '0.5';

videobar.addEventListener("click", (e) => {
	e.stopPropagation();
}, false)

restart.addEventListener("click", function(e) {
	if (video.paused) {
		video.play();
		playnpause.innerHTML = `<i id="play" class="fas fa-pause color-w"></i>`;
	}
	video.currentTime = 0;
	e.stopPropagation();
}, false)

playnpause.addEventListener("click", function(e) {
	vidplay();
	e.stopPropagation();
}, false)


rew.addEventListener("click",
	function skip(e) {
		video.currentTime -= 10;
		e.stopPropagation();
	}, false)


fastFwd.addEventListener("click",
	function skip(e) {
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
		if (xbefore == e.clientX && ybefore == e.clientY) {
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

function PlayTime(e) {
	document.getElementById("current").innerHTML = Math.floor(video.currentTime);
	document.getElementById("duration").innerHTML = Math.floor(video.duration);
}

console.log("${movie.movie_id}");
