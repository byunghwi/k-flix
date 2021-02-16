var video = document.getvideoentById("video");
		var button = document.getvideoentById("play");
		var playdiv = document.getvideoentById("playnpause");
		
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

		function skip(value) {
			video.currentTime += value;
		}
		/*
		
		function openFullscreen() {
			  if (video.requestFullscreen) {
			    video.requestFullscreen();
			  } else if (video.mozRequestFullScreen) {
			    video.mozRequestFullScreen();
			  } else if (video.webkitRequestFullscreen) 
			    video.webkitRequestFullscreen();
			  } else if (video.msRequestFullscreen) {
			    video.msRequestFullscreen();
			  }
			}
		
		*/
		