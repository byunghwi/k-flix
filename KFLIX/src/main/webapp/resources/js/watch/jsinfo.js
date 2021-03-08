
const wish_lab = document.getElementById('wish_lab');
const wish_check = document.getElementById('wish_check');


var check1, check2, check3, check4;


wish_check.addEventListener("change", function() {
	if (wish_check.checked) {
		console.log("체크됨");
		wish_lab.innerHTML = `<i class="fas fa-check color-w"></i>`;
		setwish("create");
		check2 = "체크";
		console.log(check1 + ":" + check2);
	} else {
		console.log("체크안됨");
		wish_lab.innerHTML = `<i class="fas fa-plus color-w"></i>`;
		setwish("delete");
		check2 = "미체크";
		console.log(check1 + ":" + check2);
	}
});

const like_lab = document.getElementById('like_lab');
const like_check = document.getElementById('like_check');
const rankchange = document.getElementById('rankchange');

/*// iframe이 실행 될 때 부모 body오버플로우
window.onload = function() {
	parent.bodyoverflow();
}*/

// iframe이 실행 될 때 movieid넘겨서 주소 이동
function parentvideoshow(movieId) {
	parent.videoshow(movieId);
}

// iframe이 실행 될 때 movieid넘겨서 iframe변경
function parentframechange(movieId) {
	parent.framechange(movieId);
}

/* 클릭시 중첩 테스트
document.querySelector("body").addEventListener("click", function() {
	console.log("바디");
});*/

// 클릭시 뒤에 클릭 안되게 false
document.getElementById("frame").addEventListener("click", function parentiframeclose(e) {
	console.log(parent);
	if (check1 == check2 && check3 == check4) {
		console.log("똑같음");
	} else {
		parent.mianreload();
	}
	parent.frameclose();
	e.stopPropagation();
}, false);

document.getElementById("postiondiv").addEventListener("click", function parentiframeclose(e) {
	console.log(parent);
	e.stopPropagation();
}, false);

document.querySelector(".back").addEventListener("click", function parentiframeclose(e) {
	console.log(parent);
	if (check1 == check2 && check3 == check4) {
		console.log("똑같음");
	} else {
		parent.mianreload();
	}
	parent.frameclose();


	e.stopPropagation();
}, false);







