
infoframe = document.getElementById('infoframe');
body = document.querySelector('body');

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

console.log(document.referrer);

string = document.referrer;
video_movieid = string.substring(41);


if (string.includes("http://localhost:8081/kflix/browse/watch/")) {
	console.log("있음");
	if (window.performance.navigation.type == 1) {
		console.log("새로고침");
	} else if (window.performance.navigation.type == 2) {
		console.log("뒤로가기상태");
		framshow(video_movieid);
	} else {
		framshow(video_movieid);
	}

} else {
	console.log("없음");
	body.style.overflow = 'auto';
}

