img1 = document.getElementById('img1');

img1.addEventListener("mouseover", function() {
	volume.innerHTML = `<input type="range" class="form-range" id="customRange1">`;
});