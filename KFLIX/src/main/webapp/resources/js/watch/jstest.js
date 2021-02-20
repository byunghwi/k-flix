var slides = document.querySelector('.slides_Watching'),
	slide_wrapper = document.querySelector('.slide_wrapper_Watching'),
	slide = document.querySelectorAll('.slides_Watching li'),
	currentIdx = 0,
	slideCount = slide.length,
	prevBtn = document.querySelector('.prev_Watching'),
	slideWidth = 250,
	slideMargin = 10,
	slideShow = 4,
	nextBtn = document.querySelector('.next_Watching');

slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';
slide_wrapper.style.width = (slideWidth + slideMargin) * slideShow - slideMargin + 'px';

function moveSlide(num) {
	slides.style.left = -num * (slideWidth + slideMargin) + 'px';
	currentIdx = num;
}

	nextBtn.addEventListener('click', function() {
		if (currentIdx < slideCount - slideShow) {
			moveSlide(currentIdx + 3);
		} else {
			moveSlide(0);
		}
		});


prevBtn.addEventListener('click', function() {
	if (currentIdx > 0) {
		moveSlide(currentIdx - 3);
	} else {
		moveSlide(slideCount - slideShow);
	}

	});