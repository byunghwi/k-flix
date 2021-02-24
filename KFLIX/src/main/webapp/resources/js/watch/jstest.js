var slides = document.querySelector('.slides'),

		slide_wrapper = document.querySelector('.slide_wrapper'),

		slide = document.querySelectorAll('.slides li'),

		currentIdx = 0,

		slideCount = slide.length,

		prevBtn = document.querySelector('.prev'),

		backopprev = document.querySelector('.backopprev'),

		backopnext = document.querySelector('.backopnext'),

		slideWidth = 250, slideMargin = 10, slideShow = 4, s

		allpagenum = Math.ceil(slideCount / slideShow),

		nextBtn = document.querySelector('.next'),

		currentPagenum = 1,

		sliderow = document.querySelector('.sliderow'),

		pagenumdiv = document.querySelector('.pagenum');

		console.log(slideCount);

		//슬라이드 마우스오버 시 버튼 나타내기
		slide_wrapper
				.addEventListener(
						"mouseover",
						function() {
							//슬라이드 페이지 view 시 버튼 나타내기
							for (i = 1; i <= allpagenum; i++) {
								if (i == 1) {
									pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
								} else {
									pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
								}
							}
							prevBtn.style.visibility = 'visible';
							nextBtn.style.visibility = 'visible';
							pagenumdiv.style.visibility = 'visible';
							if (currentPagenum == allpagenum) {
								nextBtn.style.visibility = 'hidden';
							}
							if (currentPagenum == 1) {
								prevBtn.style.visibility = 'hidden';
							}
						});

		//슬라이드 마우스아웃 시 버튼 숨기기
		slide_wrapper.addEventListener("mouseout", function() {
			prevBtn.style.visibility = 'hidden';
			nextBtn.style.visibility = 'hidden';
			pagenumdiv.style.visibility = 'hidden';
		});

		slides.style.width = (slideWidth + slideMargin) * slideCount
				- slideMargin + 'px';
		slide_wrapper.style.width = (slideWidth + slideMargin) * slideShow
				- slideMargin + 'px';

		function moveSlide(num) {
			slides.style.left = -num * (slideWidth + slideMargin) + 'px';
			currentIdx = num;
			currentPagenum = currentIdx == 0 ? 1 : Math.floor(currentIdx
					/ slideShow) + 1;
			console.log(currentPagenum);
		}

		nextBtn
				.addEventListener(
						'click',
						function() {
							if (currentPagenum > 0) {
								moveSlide(currentIdx + slideShow);
								pagenumdiv.innerHTML = ``;
								for (i = 1; i <= allpagenum; i++) {
									if (i == currentPagenum) {
										pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
									} else {
										pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
									}
								}
								prevBtn.style.visibility = 'visible';
								backopprev.style.visibility = 'visible';
								if (currentPagenum == allpagenum) {
									nextBtn.style.visibility = 'hidden';
									backopnext.style.visibility = 'hidden';
								}
							} else {
								/*moveSlide(0); 첫페이지*/
								nextBtn.style.visibility = 'hidden';
								backopnext.style.visibility = 'hidden';
							}
						});

		if (currentPagenum == 1) {
			prevBtn.style.visibility = 'hidden';
			backopprev.style.visibility = 'hidden';
			backopnext.style.visibility = 'visible';
		}

		prevBtn
				.addEventListener(
						'click',
						function() {
							if (currentPagenum <= allpagenum) {
								moveSlide(currentIdx - slideShow);
								pagenumdiv.innerHTML = ``;
								for (i = 1; i <= allpagenum; i++) {
									if (i == currentPagenum) {
										pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
									} else {
										pagenumdiv.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
									}
								}
								nextBtn.style.visibility = 'visible';
								backopnext.style.visibility = 'visible';
								if (currentPagenum == 1) {
									prevBtn.style.visibility = 'hidden';
									backopprev.style.visibility = 'hidden';
								}
							} else {
								/*moveSlide(slideCount - slideShow);*/
								prevBtn.style.visibility = 'hidden';
								prevBtn.style.visibility = 'hidden';
							}
						});