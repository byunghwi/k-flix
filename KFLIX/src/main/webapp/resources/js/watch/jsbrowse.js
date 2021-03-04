
infoframe = document.getElementById('infoframe');
body = document.querySelector('body');
confirmbtn = document.getElementById('confirmbtn');


confirmbtn.addEventListener("click", function(){
	location.href = "/kflix/ticket/info";
});

function mianreload() {
	document.location.reload(true);
}

function framshow(movieId) {
	infoframe.src = "";
	infoframe.style.display = 'block';
	infoframe.src = "/kflix/browse/" + movieId;
	body.style.overflow = 'hidden';
}

function frameclose() {
	infoframe.src = "";
	infoframe.style.display = 'none';
	body.style.overflow = 'auto';
}

function videoshow(movieId) {
	location.href = "/kflix/browse/watch/" + movieId;
}

function framechange(movieId) {
	framshow(movieId);
}

string = document.referrer;
video_movieid = string.substring(41);

if (window.performance.navigation.type == 1) {
		console.log("새로고침");
		href="javascript:window.scrollTo( 0, 1650 );"
	}
	
if (string.includes("http://localhost:8081/kflix/browse/watch/")) {
	console.log("있음");
	if (window.performance.navigation.type == 1) {
	} else if (window.performance.navigation.type == 2) {
		framshow(video_movieid);
	} else {
		framshow(video_movieid);
	}
} else {
	body.style.overflow = 'auto';
}