
infoframe = document.getElementById('infoframe');
body = document.querySelector('body');

function framshow(movieId) {
	infoframe.src = "/kflix/browse/" + movieId;
	console.log("/kflix/browse/" + movieId);
	infoframe.style.display = 'block';
	body.style.overflow = 'hidden';
}