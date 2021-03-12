
infoframe = document.getElementById('infoframe');
body = document.querySelector('body');
//confirmbtn = document.getElementById('confirmbtn');
//logout = document.querySelector('.logout');
//
//logout.addEventListener("click", function(){
//	location.href = "logout";
//});
//
//confirmbtn.addEventListener("click", function(){
//	location.href = "/kflix/ticket/info";
//});




function mianreload() {
	document.location.reload(true);
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
		href="javascript:window.scrollTo( 0, 1650 );"
	} else if (window.performance.navigation.type == 2) {
		location.href = "/kflix/browse";
		console.log(string);
	}
	
