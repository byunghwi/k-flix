var slides_All = document.querySelector('.slides_All'),
	slide_wrapper_All = document.querySelector('.slide_wrapper_All'),
	slide_All = document.querySelectorAll('.slides_All li'),
	currentIdx = 0,
	slideCount_All = slide_All.length,
	prevBtn_All = document.querySelector('.prev_All'),
	backopprev_All = document.querySelector('.backopprev_All'),
	backopnext_All = document.querySelector('.backopnext_All'),
	slideWidth = 250,
	slideMargin = 10,
	slideShow = 4,
	Pagenum_All = Math.ceil(slideCount_All / slideShow),
	nextBtn_All = document.querySelector('.next_All'),
	currentPagenum_All = 1,
	All = document.getElementById('All'),
	pagenum_Alldiv = document.getElementById('pagenum_All');
	

// 슬라이드 마우스오버 시 버튼 나타내기
slides_All.addEventListener("mouseover", function() {
	prevBtn_All.style.visibility = 'visible';
	nextBtn_All.style.visibility = 'visible';
	pagenum_Alldiv.style.visibility = 'visible';
	if (currentPagenum_All == Pagenum_All) {
		nextBtn_All.style.visibility = 'hidden';
	}
	if (currentPagenum_All == 1) {
		prevBtn_All.style.visibility = 'hidden';
	}
});

// 슬라이드 마우스아웃 시 버튼 숨기기
slides_All.addEventListener("mouseout", function() {
	prevBtn_All.style.visibility = 'hidden';
	nextBtn_All.style.visibility = 'hidden';
	pagenum_Alldiv.style.visibility = 'hidden';
});

// 슬라이드 페이지 view 시 버튼 나타내기
for (i = 1; i <= Pagenum_All; i++) {
	if (i == 1) {
		document.getElementById('pagenum_All').innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
	} else {
		document.getElementById('pagenum_All').innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
	}
}

slides_All.style.width = (slideWidth + slideMargin) * slideCount_All - slideMargin + 'px';
slide_wrapper_All.style.width = (slideWidth + slideMargin) * slideShow - slideMargin + 'px';

function moveSlide(num) {
	slides_All.style.left = -num * (slideWidth + slideMargin) + 'px';
	currentIdx = num;
	currentPagenum_All = currentIdx == 0 ? 1 : Math.floor(currentIdx / slideShow) + 1;
	console.log(currentPagenum_All);
}

nextBtn_All.addEventListener('click', function() {
	if (currentPagenum_All > 0) {
		moveSlide(currentIdx + slideShow);
		document.getElementById('pagenum_All').innerHTML = ``;
		for (i = 1; i <= Pagenum_All; i++) {
			if (i == currentPagenum_All) {
				document.getElementById('pagenum_All').innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
			} else {
				document.getElementById('pagenum_All').innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
			}
		}
		prevBtn_All.style.visibility = 'visible';
		backopprev_All.style.visibility = 'visible';
		if (currentPagenum_All == Pagenum_All) {
			nextBtn_All.style.visibility = 'hidden';
			backopnext_All.style.visibility = 'hidden';
		}
	} else {
		/*moveSlide(0); 첫페이지*/
		nextBtn_All.style.visibility = 'hidden';
		backopnext_All.style.visibility = 'hidden';
	}
});

if (currentPagenum_All == 1) {
	prevBtn_All.style.visibility = 'hidden';
	backopprev_All.style.visibility = 'hidden';
	backopnext_All.style.visibility = 'visible';
}

prevBtn_All.addEventListener('click', function() {
	if (currentPagenum_All <= Pagenum_All) {
		moveSlide(currentIdx - slideShow);
		document.getElementById('pagenum_All').innerHTML = ``;
		for (i = 1; i <= Pagenum_All; i++) {
			if (i == currentPagenum_All) {
				document.getElementById('pagenum_All').innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
			} else {
				document.getElementById('pagenum_All').innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
			}
		}
		nextBtn_All.style.visibility = 'visible';
		backopnext_All.style.visibility = 'visible';
		if (currentPagenum_All == 1) {
			prevBtn_All.style.visibility = 'hidden';
			backopprev_All.style.visibility = 'hidden';
		}
	} else {
		/*moveSlide(slideCount - slideShow);*/
		prevBtn_All.style.visibility = 'hidden';
		prevBtn_All.style.visibility = 'hidden';
	}
});



var slides_Watching = document.querySelector('.slides_Watching'),
	slide_wrapper_Watching = document.querySelector('.slide_wrapper_Watching'),
	slide_Watching = document.querySelectorAll('.slides_Watching li'),
	currentIdx = 0,
	slideCount_Watching = slide_Watching.length,
	prev_Watching = document.querySelector('.prev_Watching'),
	slideWidth = 250,
	slideMargin = 10,
	slideShow = 4,
	next_Watching = document.querySelector('.next_Watching');

slides_Watching.style.width = (slideWidth + slideMargin) * slideCount_Watching - slideMargin + 'px';
slide_wrapper_Watching.style.width = (slideWidth + slideMargin) * slideShow - slideMargin + 'px';

function moveSlide_Watching(num) {
	slides_Watching.style.left = -num * (slideWidth + slideMargin) + 'px';
	currentIdx = num;
}

next_Watching.addEventListener('click', function() {
	if (currentIdx < slideCount_Watching - slideShow) {
		moveSlide_Watching(currentIdx + 1);
	} else {
		moveSlide_Watching(0);
	}
});


prev_Watching.addEventListener('click', function() {
	if (currentIdx > 0) {
		moveSlide_Watching(currentIdx - 1);
	} else {
		moveSlide_Watching(slideCount_Watching - slideShow);
	}

});

location.reload
