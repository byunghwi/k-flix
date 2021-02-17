var video = document.getElementById('video');
var button = document.getElementById("play");
var playdiv = document.getElementById("playnpause");
var volume = document.getElementById("volume");
var volrange = document.getElementById("volrange");
var back = document.getElementById('back');
var videocon = document.getElementById('videocon');
var videobar = document.getElementById('videobar');

videocon.addEventListener("mouseover", function() {
	back.style.display = 'block';
	videobar.style.display = 'block';
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
		/*      var percent = Math.floor(100 / video.duration * video.currentTime);
	   progressbar.getElementsByTagName("span")[0].innerHTML = percent;*/
		progressbar.value = Math.floor(video.currentTime);
		progressbar.max = Math.floor(video.duration);

	},
	false
);

function savecurrentTime() {
var form = document.createElement("form");
            form.setAttribute("method", "post");
            form.setAttribute("action", "/kflix/browse/" + video.currentTime);
            document.body.appendChild(form);
            form.submit();
}

/*function savecurrentTime() {
	var data = {
			currentTime:  Math.floor(video.currentTime)
	}
	
	var xhttp = new XMLHttpRequest();
	
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				// OK
				alert('delete ok');
			} else {
				// ERROR
				alert('delete error');
			}
		} 
	}
	
	xhttp.open('Post', '/kflix/browse', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));
}*/