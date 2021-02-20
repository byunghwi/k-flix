var slides = document.querySelector('.slides_All'),
	slide_wrapper = document.querySelector('.slide_wrapper_All'),
	slide = document.querySelectorAll('.slides_All li'),
	currentIdx = 0,
	slideCount = slide.length,
	prevBtn = document.querySelector('.prev_All'),
	slideWidth = 250,
	slideMargin = 10,
	slideShow = 4,
	nextBtn = document.querySelector('.next_All');

slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';
slide_wrapper.style.width = (slideWidth + slideMargin) * slideShow - slideMargin + 'px';

function moveSlide(num) {
	slides.style.left = -num * (slideWidth + slideMargin) + 'px';
	currentIdx = num;
}

nextBtn.addEventListener('click', function() {
	if (currentIdx < slideCount - slideShow) {
		moveSlide(currentIdx + 1);
	} else {
		moveSlide(0);
	}
});


prevBtn.addEventListener('click', function() {
	if (currentIdx > 0) {
		moveSlide(currentIdx - 1);
	} else {
		moveSlide(slideCount - slideShow);
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
