<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movie.movie_title}</title>
<link rel="icon"
    href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon"
    href="/kflix/resources/imgs/main/Favicon.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="/kflix/resources/css/common/netflix-fonts.css" />
<link rel="stylesheet"
	href="/kflix/resources/css/common/netflix-pulsate.css" />

<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/watch/cssinfo.css">
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="frame">
		<div id="postiondiv" class="container postiondiv">

			<a><i class="fas fa-arrow-left back"></i></a>
			<div id="boxsha">

				<video id="video" muted autoplay loop poster="${movie.poster_path}">
					<source src="${movie.teaser_path}" type="video/mp4">
				</video>
				<div id="boxshamin"></div>
			</div>


			<div id="menubar" class="container" style="width: auto;">

				<div id="btn" onclick="parentvideoshow(${movie.movie_id})"
					class="disin">
					<i class="fas fa-play"></i> 재생
				</div>
				<div class="container" style="display: inline-block; width: auto">
					<input id="wish_check" class="disnone" type="checkbox"> <label
						id="wish_lab" for="wish_check" id="wish" class="ru disin"><i
						class="fas fa-plus color-w"></i> </label>
				</div>
				<div class="container" style="display: inline-block; width: auto">
					<input id="like_check" class="disnone" type="checkbox"> <label
						id="like_lab" for="like_check" id="like" class="ru disin">
						<i class="far fa-thumbs-up color-w"></i>
					</label>
				</div>
			</div>

			<div id="maincon">

				<div id="previewModal-info">
					<div id="movieinfo">
						<h1 style="display: inline-block;">${movie.movie_title }</h1>
						<c:choose>
							<c:when test="${movie.rating eq 'all' }">
								<p class="ratingsty"
									style="background-color: green; font-size: 20px;">ALL</p>
							</c:when>
							<c:when test="${movie.rating eq '12' }">
								<p class="ratingsty"
									style="background-color: #dfb039; color: black;">${movie.rating }</p>
							</c:when>
							<c:when test="${movie.rating eq '15' }">
								<p class="ratingsty" style="background-color: #cd6d34">${movie.rating }</p>
							</c:when>
							<c:when test="${movie.rating eq '19' }">
								<p class="ratingsty" style="background-color: #c52e37">${movie.rating }</p>
							</c:when>
							<c:otherwise>
								<p class="ratingsty" style="background-color: #c52e37">${movie.rating }</p>
							</c:otherwise>
						</c:choose>

						<div id="mar-r">
							<div style="display: inline-block;">
								<span
									style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid; padding: 3px 15px;">
									<i class="fas fa-thumbs-up"></i>
								</span> <span id="rankchange"
									style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid white; background-color: white; padding: 3px 18px; color: black;">
									${movie.movie_rank }</span>
							</div>

							<span
								style="font-family: 'Acme', ' Oswald ', sans-serif; margin-right: 5px; font-size: 18px;">
								<fmt:formatDate value="${movie.reg_date }" pattern="yyyy.MM" />
								• ${movie.play_time }분
							</span>
						</div>
						<div>
							<div style="float: left;">
								<div style="width: 500px;">
									<h6 style="line-height: 160%; width: 460px;">${movie.summary}</h6>
								</div>
							</div>
							<table id="infotable1" style="font-size: 16px;">
								<tr align="left">
									<td colspan="1"><span class="c-gay">감독: </span> <c:forEach
											items="${AllDirector }" var="AllDirector" varStatus="status">
											<c:if test="${movie.director_id eq AllDirector.director_id }">
									${AllDirector.director_name }
								</c:if>
										</c:forEach></td>
								</tr>
								<tr align="left">
									<td><span class="c-gay">출연: </span> <c:forEach
											items="${AllActor }" var="AllActor" varStatus="status">
											<c:if test="${movie.actor_id1 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
													test="${movie.actor_id2 eq AllActor.actor_id }">, 
									</c:if>
											</c:if>
											<c:if test="${movie.actor_id2 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
													test="${movie.actor_id3 eq AllActor.actor_id }">, 
									</c:if>
											</c:if>

											<c:if test="${movie.actor_id3 eq AllActor.actor_id }">
									${AllActor.actor_name }
									</c:if>
										</c:forEach></td>
								</tr>

								<tr align="left">
									<td><span class="c-gay">개요: </span>${movie.country }영화, <c:forEach
											items="${AllGenre }" var="AllGenre" varStatus="status">
											<c:if test="${movie.genre_id1 eq AllGenre.genre_id }">
									${AllGenre.genre_name}<c:if
													test="${movie.genre_id2 eq AllGenre.genre_id }">, 
									</c:if>
											</c:if>
											<c:if test="${movie.genre_id2 eq AllGenre.genre_id }">
									${AllGenre.genre_name }
									</c:if>
										</c:forEach></td>
								</tr>
							</table>
						</div>
					</div>

					<div id="contents">
						<p style="display: inline-block; font-weight: bold; font-size: 25px">비슷한
							콘텐츠</p>
						<div class="min_contents container">
							<c:forEach items="${Allmovie }" var="Allmovie" varStatus="status">
								<c:if
									test="${movie.genre_id1 eq Allmovie.genre_id1 or movie.genre_id2 eq Allmovie.genre_id1 or 
									movie.genre_id1 eq Allmovie.genre_id2 or movie.genre_id2 eq Allmovie.genre_id2 }">

									<c:if test="${movie.movie_id != Allmovie.movie_id}">
										<c:set var="sum" value="${sum+1}" />
										<c:if test="${sum < 10}">
											<!-- 비슷한 콘텐츠 누르면 다른 frame띄우기 -->
											<div class="movie_contents">
												<a id="atag"
													onclick="parentframechange(${Allmovie.movie_id })">
													<div style="position: relative;">
														<img
															style="width: 100%; height: 130px; border-radius: 2% 2% 0 0;"
															src="${Allmovie.poster_path }"
															class="d-block dis hoverimg" alt="...">
														<c:forEach items="${Ranking }" var="Ranking"
															varStatus="status">
															<c:if test="${Allmovie.movie_id eq Ranking.movie_id}">
																<div class="topMark">
																	TOP<br> <b style="font-size: 18px">10</b>
																</div>

															</c:if>
														</c:forEach>
														<c:forEach items="${newmovie }" var="newmovie"
															varStatus="status">
															<c:if test="${Allmovie.movie_id eq newmovie.movie_id}">
																<div class="newMark">N</div>
															</c:if>
														</c:forEach>
														<div class="imghover"
															style="position: resize; width: 100%; top: 0; left: 0; bottom: 0; z-index: 10; background-color: rgba(255, 255, 255, 0);">
															<div
																style="position: absolute; top: 23%; left: 33%; z-index: 20; width: 30%; height: 50%;"
																class="ru disin hoverru">
																<i
																	style="position: absolute; font-size: 30px; top: 27%; left: 34%; bottom: 0; z-index: 10;"
																	class="fas fa-play color-w hoverru"></i>
															</div>
														</div>
													</div>
													<div id="context">
														${Allmovie.movie_title } <br>
														<div id="ratingndate">
															<c:choose>
																<c:when test="${Allmovie.rating eq 'all' }">
																	<p class="ratingsty"
																		style="background-color: green; font-size: 20px;">ALL</p>
																</c:when>
																<c:when test="${Allmovie.rating eq '12' }">
																	<p class="ratingsty"
																		style="background-color: #dfb039; color: black;">${Allmovie.rating }</p>
																</c:when>
																<c:when test="${Allmovie.rating eq '15' }">
																	<p class="ratingsty" style="background-color: #cd6d34">${Allmovie.rating }</p>
																</c:when>
																<c:when test="${Allmovie.rating eq '19' }">
																	<p class="ratingsty" style="background-color: #c52e37">${Allmovie.rating }</p>
																</c:when>
																<c:otherwise>
																	<p class="ratingsty" style="background-color: green">${Allmovie.rating }</p>
																</c:otherwise>
															</c:choose>
															<span
																style="font-family: 'Acme', ' Oswald ', sans-serif;">
																<fmt:formatDate value="${Allmovie.reg_date }"
																	pattern="yyyy.MM" />
															</span> <br>
														</div>
														<p
															style="margin: 10px 0; line-height: 1.4; font-size: 13px; color: #d2d2d2;">
															${Allmovie.summary }</p>
													</div>
												</a>
											</div>
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div>



					<div id="moveinfo">

						<table id="infotable" style="font-size: 16px;">
							<tr align="left">
								<td colspan="4">
									<p
										style="display: inline-block; font-weight: bold; font-size: 25px">${movie.movie_title}</p>
									<p style="display: inline-block; font-size: 25px">상세 정보</p>
								</td>
							</tr>
							<tr align="left">
								<td colspan="1"><span class="c-gay">감독: </span> <c:forEach
										items="${AllDirector }" var="AllDirector" varStatus="status">
										<c:if test="${movie.director_id eq AllDirector.director_id }">
									${AllDirector.director_name }
								</c:if>
									</c:forEach></td>
							</tr>
							<tr align="left">
								<td><span class="c-gay">출연: </span> <c:forEach
										items="${AllActor }" var="AllActor" varStatus="status">
										<c:if test="${movie.actor_id1 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
												test="${movie.actor_id2 eq AllActor.actor_id }">, 
									</c:if>
										</c:if>
										<c:if test="${movie.actor_id2 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
												test="${movie.actor_id3 eq AllActor.actor_id }">, 
									</c:if>
										</c:if>

										<c:if test="${movie.actor_id3 eq AllActor.actor_id }">
									${AllActor.actor_name }
									</c:if>
									</c:forEach></td>
							</tr>

							<tr align="left">
								<td><span class="c-gay">개요: </span>${movie.country }영화, <c:forEach
										items="${AllGenre }" var="AllGenre" varStatus="status">
										<c:if test="${movie.genre_id1 eq AllGenre.genre_id }">
									${AllGenre.genre_name}<c:if
												test="${movie.genre_id2 eq AllGenre.genre_id }">, 
									</c:if>
										</c:if>
										<c:if test="${movie.genre_id2 eq AllGenre.genre_id }">
									${AllGenre.genre_name }
									</c:if>
									</c:forEach></td>
							</tr>
							<tr>
								<td><span class="c-gay">관람등급: </span> <c:choose>
										<c:when test="${movie.rating eq 'all' }">
											<p class="ratingsty"
												style="display: inline-block; background-color: green; font-size: 20px;">ALL</p>
										</c:when>
										<c:when test="${movie.rating eq '12' }">
											<p class="ratingsty"
												style="display: inline-block; background-color: #dfb039; color: black;">${movie.rating }</p>
										</c:when>
										<c:when test="${movie.rating eq '15' }">
											<p class="ratingsty"
												style="display: inline-block; background-color: #cd6d34">${movie.rating }</p>
										</c:when>
										<c:when test="${movie.rating eq '19' }">
											<p class="ratingsty"
												style="display: inline-block; background-color: #c52e37">${movie.rating }</p>
										</c:when>
										<c:otherwise>
											<p class="ratingsty"
												style="display: inline-block; background-color: green">${movie.rating }</p>
											<br>
										</c:otherwise>
									</c:choose> <c:choose>
										<c:when test="${movie.rating eq 'all' }">
													전체 관람가<br>
										</c:when>
										<c:otherwise>
													${movie.rating }세 관람가<br>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<%-- 	
		${movie.reg_date} ${movie.view_cnt}
			${movie.movie_rank} ${movie.movie_status}  --%>
		</div>
	</div>

	<script src="/kflix/resources/js/watch/jsinfo.js"></script>
	<script type="text/javascript">


		const postiondiv = document.getElementById('postiondiv');

		/* window.onload = function() {
			console.log("window onload ");
			postiondiv.style.opacity = '1';
			postiondiv.style.visibility = 'visible';
		} */

		<c:choose>
		<c:when test="${not empty getwish }">
		console.log("wish 있음");
		wish_check.checked = true;
		wish_lab.innerHTML = `<i class="fas fa-check color-w"></i>`;
		</c:when>
		<c:otherwise>
		console.log("wish 없음");
		wish_check.checked = false;
		wish_lab.innerHTML = `<i class="fas fa-plus color-w"></i>`;
		</c:otherwise>
		</c:choose>
		
		if (wish_check.checked) {
			console.log("wish체크됨");
			check1 = "체크";
			check2 = "체크";
		} else {
			console.log("wish체크안됨");
			check1 = "미체크";
			check2 = "미체크";
		}
		
		
		<c:choose>
		<c:when test="${not empty getlike }">
		console.log("like 있음");
		like_check.checked = true;
		like_lab.innerHTML = `<i class="fas fa-thumbs-up color-w"></i>`;
		</c:when>
		<c:otherwise>
		console.log("like 없음");
		like_check.checked = false;
		like_lab.innerHTML = `<i class="far fa-thumbs-up color-w"></i>`;
		</c:otherwise>
		</c:choose>

		if (like_check.checked) {
			console.log("like체크됨");
			check3 = "체크";
			check4 = "체크";
		} else {
			console.log("like체크안됨");
			check3 = "미체크";
			check4 = "미체크";
		}
		

		like_check.addEventListener("change", function() {
			if (like_check.checked) {
				console.log("체크됨");
				like_lab.innerHTML = `<i class="fas fa-thumbs-up color-w"></i>`;
				setlike("plus");
				check4 = "체크";
				console.log(check3 + ":" + check4);
				console.log(rankchange.value);
				
				<c:choose>
				<c:when test="${not empty getlike }">
				rankchange.innerHTML = ${movie.movie_rank };
				</c:when>
				<c:otherwise>
				rankchange.innerHTML = ${movie.movie_rank } + 1;
				</c:otherwise>
				</c:choose>
				
			} else {
				console.log("체크안됨");
				like_lab.innerHTML = `<i class="far fa-thumbs-up color-w"></i>`;
				check4 = "미체크";
				setlike("minus");
				console.log(check3 + ":" + check4);
				<c:choose>
				<c:when test="${not empty getlike }">
				rankchange.innerHTML = ${movie.movie_rank } - 1;
				</c:when>
				<c:otherwise>
				rankchange.innerHTML = ${movie.movie_rank };
				</c:otherwise>
				</c:choose>
			}
		});
		
		function setwish(wishresult) {
			console.log("wishresult 값" + wishresult);
			var data = {
				/* wish: 시퀀스, */
				movie_id : "${movie.movie_id}",
				email : "${email}",
				result : wishresult
			}

			var xhttp = new XMLHttpRequest();

			xhttp.open('Post', '/kflix/rest/wish', true);
			xhttp.setRequestHeader('content-type', 'application/json');
			xhttp.send(JSON.stringify(data));
		}
		
		
		function setlike(likeresult) {
			console.log("likeresult 값" + likeresult);
			var data = {
				/* like: 시퀀스, */
				movie_id : "${movie.movie_id}",
				email : "${email}",
				result : likeresult
			}

			var xhttp = new XMLHttpRequest();

			xhttp.open('PATCH', '/kflix/rest/like', true);
			xhttp.setRequestHeader('content-type', 'application/json');
			xhttp.send(JSON.stringify(data));
		}
		
	</script>
</body>
</html>