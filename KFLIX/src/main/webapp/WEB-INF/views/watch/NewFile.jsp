<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/watch/csstest.css">
<style type="text/css">
body {
	
}
</style>
</head>
<body>

	<c:forEach items="${Allmovie }" var="Allmovie">
	<p style="color: white;">${Allmovie.movie_id } </p>
	</c:forEach>


	<script src="/kflix/resources/js/watch/jstest.js?var=2"></script>
	<script type="text/javascript">
		console.log(${i});
		
		<c:forEach var="j" begin="1" end="${i}">
			console.log(${j});
			
		var 
				slides${j} = document.querySelector('.slides${j}'), 
				
				slide_wrapper${j} = document.querySelector('.slide_wrapper${j}'), 
				
				slide${j} = document.querySelectorAll('.slides${j} .slideli${j}'),
				
				currentIdx${j} = 0, 
				
				slideCount${j} = slide${j}.length, 
				
				prevBtn${j} = document.querySelector('.prev${j}'), 
				
				backopprev${j} = document.querySelector('.backopprev${j}'),
				
				backopnext${j} = document.querySelector('.backopnext${j}'), 
				
				slideWidth${j} = 250, 
				slideMargin${j} = 10, 
				slideShow${j} = 4, 
				allpagenum${j} = Math.ceil(slideCount${j} / slideShow${j}), 
				
				nextBtn${j} = document.querySelector('.next${j}'), 
				
				currentPagenum${j} = 1, 
				
				sliderow${j} = document.querySelector('.sliderow${j}'), 
				
				pagenumdiv${j} = document.querySelector('.pagenum${j}');

				console.log(slideCount${j});
		slides${j}.style.width = (slideWidth${j} + slideMargin${j}) * slideCount${j}
				- slideMargin${j} + 'px';
		slide_wrapper${j}.style.width = (slideWidth${j} + slideMargin${j}) * slideShow${j}
				- slideMargin${j} + 'px';

		
		//슬라이드 페이지 view 시 버튼 나타내기
		for (i = 1; i <= allpagenum${j}; i++) {
			if (i == 1) {
				pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
			} else {
				pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
			}
		}

		//슬라이드 마우스오버 시 버튼 나타내기
		sliderow${j}.addEventListener("mouseover", function() {
			pagenumdiv${j}.style.visibility = 'visible';

			if (slideCount${j} > slideShow${j}) {
				prevBtn${j}.style.visibility = 'visible';
				nextBtn${j}.style.visibility = 'visible';
			}

			if (currentPagenum${j} == allpagenum${j}) {
				nextBtn${j}.style.visibility = 'hidden';
			}
			if (currentPagenum${j} == 1) {
				prevBtn${j}.style.visibility = 'hidden';
			}

		});
		
		//슬라이드 마우스아웃 시 버튼 숨기기
		sliderow${j}.addEventListener("mouseout", function() {
			prevBtn${j}.style.visibility = 'hidden';
			nextBtn${j}.style.visibility = 'hidden';
			pagenumdiv${j}.style.visibility = 'hidden';
		});

		function moveSlide${j}(num) {
			slides${j}.style.left = -num * (slideWidth${j} + slideMargin${j}) + 'px';
			currentIdx${j} = num;
			currentPagenum${j} = currentIdx${j} == 0 ? 1 : Math.floor(currentIdx${j}
					/ slideShow${j}) + 1;
		}

		nextBtn${j}.addEventListener(
						'click',
						function() {
							if (currentPagenum${j} > 0) {
								moveSlide${j}(currentIdx${j} + slideShow${j});
								pagenumdiv${j}.innerHTML = ``;
								for (i = 1; i <= allpagenum${j}; i++) {
									if (i == currentPagenum${j}) {
										pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
									} else {
										pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
									}
								}
								prevBtn${j}.style.visibility = 'visible';
								backopprev${j}.style.visibility = 'visible';
								if (currentPagenum${j} == allpagenum${j}) {
									nextBtn${j}.style.visibility = 'hidden';
									backopnext${j}.style.visibility = 'hidden';
								}
							} else {
								/*moveSlide(0); 첫페이지*/
								nextBtn${j}.style.visibility = 'hidden';
								backopnext${j}.style.visibility = 'hidden';
							}
						});

		if (currentPagenum${j} == 1) {
			if (slideCount${j} <= slideShow${j}) {
				nextBtn${j}.style.visibility = 'hidden';
				backopnext${j}.style.visibility = 'hidden';
			}else{
			backopnext${j}.style.visibility = 'visible';
				
			}

			prevBtn${j}.style.visibility = 'hidden';
			backopprev${j}.style.visibility = 'hidden';
		}

		prevBtn${j}.addEventListener(
						'click',
						function() {
							if (currentPagenum${j} <= allpagenum${j}) {
								moveSlide${j}(currentIdx${j} - slideShow${j});
								pagenumdiv${j}.innerHTML = ``;
								for (i = 1; i <= allpagenum${j}; i++) {
									if (i == currentPagenum${j}) {
										pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveron"></i>`;
									} else {
										pagenumdiv${j}.innerHTML += `<i class="far fa-window-minimize pagehoveroff"></i>`;
									}
								}
								nextBtn${j}.style.visibility = 'visible';
								backopnext${j}.style.visibility = 'visible';
								if (currentPagenum${j} == 1) {
									prevBtn${j}.style.visibility = 'hidden';
									backopprev${j}.style.visibility = 'hidden';
								}
							} else {
								/*moveSlide(slideCount - slideShow);*/
								prevBtn${j}.style.visibility = 'hidden';
								prevBtn${j}.style.visibility = 'hidden';
							}
						});
		</c:forEach>
	</script>
</body>
</html>