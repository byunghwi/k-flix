
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

function iframeclose() {
	console.log("왜이래");
	parent.frameclose();
}

document.getElementById("frame").addEventListener("click", iframeclose);
document.querySelector(".back").addEventListener("click", iframeclose);