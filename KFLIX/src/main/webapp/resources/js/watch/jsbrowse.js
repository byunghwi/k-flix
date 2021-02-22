var slides_All = document.querySelector('.slides_All'),
	slide_wrapper_All = document.querySelector('.slide_wrapper_All'),
	slide_All = document.querySelectorAll('.slides_All li'),
	currentIdx = 0,
	slideCount_All = slide_All.length,
	prevBtn_All = document.querySelector('.prev_All'),
	slideWidth = 250,
	slideMargin = 15,
	slideShow = 4,
	Pagenum_All = Math.ceil(slideCount_All / slideShow),
	nextBtn_All = document.querySelector('.next_All'),
	currentPagenum_All = Pagenum_All;

slides_All.style.width = (slideWidth + slideMargin) * slideCount_All - slideMargin + 'px';
slide_wrapper_All.style.width = (slideWidth + slideMargin) * slideShow + 'px';

function moveSlide(num) {
	slides_All.style.left = -num * (slideWidth + slideMargin) + 'px';
	currentIdx = num;
	currentPagenum_All = currentIdx == 0 ? Pagenum_All : Math.floor(slideCount_All / currentIdx);
}

nextBtn_All.addEventListener('click', function() {
	if (currentPagenum_All > 0) {
		moveSlide(currentIdx + slideShow);
		prevBtn_All.style.visibility = 'visible';
		if (currentPagenum_All == 1) {
			nextBtn_All.style.visibility = 'hidden';
		}
	} else {
		/*moveSlide(0);*/
		nextBtn_All.style.visibility = 'hidden';
	}
});


if (currentPagenum_All == Pagenum_All) {
	prevBtn_All.style.visibility = 'hidden';
}

prevBtn_All.addEventListener('click', function() {

	if (currentPagenum_All < Pagenum_All) {
		moveSlide(currentIdx - slideShow);
		nextBtn_All.style.visibility = 'visible';
		if (currentPagenum_All == Pagenum_All) {
			prevBtn_All.style.visibility = 'hidden';
		}
	} else {
		/*moveSlide(slideCount - slideShow);*/
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
