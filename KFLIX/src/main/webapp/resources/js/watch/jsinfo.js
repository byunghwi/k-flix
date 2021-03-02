
const wish_lab = document.getElementById('wish_lab');
const wish_check = document.getElementById('wish_check');

wish_check.addEventListener("change", function() {
	if (wish_check.checked) {
		console.log("체크됨");
		wish_lab.innerHTML = `<i class="fas fa-check color-w"></i>`;
		setwish("create");
	} else {
		console.log("체크안됨");
		wish_lab.innerHTML = `<i class="fas fa-plus color-w"></i>`;
		setwish("delete");

	}
});

window.onload = function() {
	parent.bodyoverflow();
}

function parentvideoshow(movieId) {
	parent.videoshow(movieId);
}

function parentframechange(movieId) {
	parent.framechange(movieId);
}


document.querySelector("body").addEventListener("click", function() {
	console.log("바디");
});

document.getElementById("frame").addEventListener("click", function parentiframeclose(e) {
	console.log(parent);
	parent.frameclose();
	/*	document.getElementById('postiondiv').style.opacity = '0';
		document.getElementById('postiondiv').style.visibility = 'hidden';*/
	e.stopPropagation();
}, false);

document.getElementById("postiondiv").addEventListener("click", function parentiframeclose(e) {
	e.stopPropagation();
}, false);

document.querySelector(".back").addEventListener("click", function parentiframeclose(e) {
	console.log(parent);
	parent.frameclose();
	/*	document.getElementById('postiondiv').style.opacity = '0';
		document.getElementById('postiondiv').style.visibility = 'hidden';*/
	e.stopPropagation();
}, false);