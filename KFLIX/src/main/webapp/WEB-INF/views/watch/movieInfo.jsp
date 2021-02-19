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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Acme&family=Oswald:wght@500&display=swap')
	;

* {
	box-sizing: border-box;
}

body {
	background-color: ;
}

#frame {
	position: absolute;
	background-color: #e9e9e9;
	top: 27%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 74%;
	height: 300px;
	background: #fff;
	z-index: 2;
	border-radius: 3rem 3rem 0 0;
	opacity: 0;
	visibility: hidden;
	transition: all 600ms cubic-bezier(0.86, 0, 0.07, 1);
	/* transition:all 1s; */
}

#postiondiv {
	position: relative;
	border: 1px solid black;
	width: 100%;
	min-width: 400px;
	top: 0;
	left: 0;
	background-color: #181818;
	border-radius: 3rem 3rem 0 0;
	padding: 0;
}

#menubar {
	position: absolute;
	top: 360px;
	left: 50px;
	right: 10px;
	z-index: 10;
}

#btn {
	border: 2.5px solid #a6a6a6;
	font-size: 17px;
	background-color: white;
	color: black;
	font-weight: bold;
	text-align: center;
	padding: 10px 35px;
	border-radius: 5%;
	background-color: white;
	margin: 0 3px;
}

#btn:hover {
	font-size: 17px;
	background-color: white;
	color: black;
	font-weight: bold;
	text-align: center;
	padding: 10px 35px;
	border-radius: 5%;
	background-color: white;
	margin: 0 3px;
}

#movieinfo {
	width: 100%;
	height: 220px;
	border-radius: 3%;
}

#boxsha {
	position: relative;
}

#video {
	height: 470px;
	width: 100%;
	border-radius: 3rem 3rem 0 0;
}

.color-w {
	color: white;
	font-size: 20px;
}

.disin {
	display: inline-block;
}

.ru {
	border: 2.5px solid #a6a6a6;
	background-color: rgba(87, 87, 87, 0.4);
	color: black;
	padding: 12px 14px;
	border-radius: 50%;
	margin: 3px;
}

.ru:hover {
	border: 2.5px solid white;
	background-color: rgba(87, 87, 87, 0.8);
	color: black;
	padding: 12px 14px;
	border-radius: 50%;
	margin: 3px;
}

.imghover .hoverru {
	opacity: 0;
	visibility: hidden;
	transition: all 0.5s;
}

#atag:hover .imghover .hoverru {
	opacity: 1;
	visibility: visible;
}

.c-gay {
	color: gray;
}

.back {
	position: absolute;
	right: 25px;
	top: 20px;
	z-index: 10;
	font-size: 20px;
	color: white;
	background-color: rgba(87, 87, 87, 0.8);
	border-radius: 50%;
	padding: 15px;
	font-size: 20px;
}

.disnone {
	display: none;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

a:active {
	color: black;
	s text-decoration: none;
}

#maincon {
	position: relative;
	padding: 0 50px;
	color: white;
}

.movie_contents {
	margin: 10px;
	width: 220px;
	display: inline-block;
}

#atag {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	width: 100%;
	height: 100%;
}

#context {
	/* box-shadow: 0px -5px 10px -3px #454545; */
	background-color: #454545;
	color: white;
	padding: 10px 15px;
	margin: 0;
	min-height: 290px;
	border-radius: 0 0 2% 2%;
}

#context>* {
	margin: 15px 0;
}

#previewModal-info>* {
	padding: 20px 10px;
}

.ratingsty {
	box-sizing: border-box;
	padding: 7px;
	width: 44px;
	border-radius: 10%;
	text-align: center;
	font-weight: bold;
	font-size: 23px;
	font-family: 'Acme', ' Oswald ', sans-serif;
	display: inline-block;
	text-align: center;
}

#movieinfo>* {
	margin: 10px 0;
}

#boxshamin {
	position: absolute;
	border-radius: 3rem 3rem 0 0;
	box-shadow: inset 0px -95px 30px -20px #181818;
	width: 100%;
	top: 0;
	left: 0;
	bottom: 0;
}

#infotable1 {
	float: right;
}
</style>
<script src="https://kit.fontawesome.com/6421ed9b05.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="frame" class="frame">
		<div id="postiondiv" class="container postiondiv">

			<a href="<%=application.getContextPath()%>/browse"><i
				class="fas fa-arrow-left back"></i></a>
			<div id="boxsha">

				<video id="video" muted autoplay loop poster="${movie.poster_path}">
					<source src="${movie.teaser_path}" type="video/mp4">
				</video>
				<div id="boxshamin"></div>
			</div>


			<div id="menubar" class="container" style="width: auto;">
				<a
					href="<%=application.getContextPath()%>/browse/watch/${movie.movie_id }">
					<div id="btn" class="disin">

						<i class="fas fa-play"></i> 재생


					</div>
				</a>
				<div class="container" style="display: inline-block; width: auto">
					<input id="wish_check" class="disnone" type="checkbox"> <label
						for="wish_check" id="wish" class="ru disin"> <label
						id="wish_lab" for="wish_check"><i
							class="fas fa-plus color-w"></i></label>

					</label> <input id="thumbs_up_check" class="disnone" type="checkbox">

					<label for="thumbs_up_check" id="thumbs_up" class="ru disin">
						<label id="thumbs_up_lab" for="thumbs_up_check"><i
							class="far fa-thumbs-up color-w"></i></label>
					</label> <input id="thumbs_down_check" class="disnone" type="checkbox">
					<label for="thumbs_down_check" id="thumbs_down" class="ru disin">
						<label id="thumbs_down_lab" for="thumbs_down_check"><i
							class="far fa-thumbs-down color-w"></i></label>
					</label>
				</div>
			</div>

			<div id="maincon">

				<div id="previewModal-info">
					<div id="movieinfo">
							<h1 style="display: inline-block;">${movie.movie_title }</h1>
							<span
								style="font-family: 'Acme', ' Oswald ', sans-serif; margin-right: 5px">
								<fmt:formatDate value="${movie.reg_date }" pattern="yyyy.MM" />
							</span>
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
							<div>
						<div style="float: left;">
							<div style="width: 500px">
								<h6>${movie.summary}</h6>
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
						<p
							style="display: inline-block; font-weight: bold; font-size: 25px">비슷한
							콘텐츠</p>
						<div class="min_contents container">
							<c:forEach items="${Allmovie }" var="Allmovie" varStatus="status">
								<c:if
									test="${movie.genre_id1 eq Allmovie.genre_id1 or movie.genre_id2 eq Allmovie.genre_id1 or 
									movie.genre_id1 eq Allmovie.genre_id2 or movie.genre_id2 eq Allmovie.genre_id2 }">

									<c:if test="${movie.movie_id != Allmovie.movie_id}">
										<div class="movie_contents">

											<a id="atag"
												href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
												<div style="position: relative;">
													<img
														style="width: 100%; height: 130px; border-radius: 2% 2% 0 0;"
														src="${Allmovie.poster_path }"
														class="d-block dis hoverimg" alt="...">
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
														<span style="font-family: 'Acme', ' Oswald ', sans-serif;">
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
		const frame = document.getElementById('frame');

		window.onload = function() {
			console.log("window onload ");
			frame.style.opacity = '1';
			frame.style.visibility = 'visible';
			$('.frame').addClass('postiondiv-open');

		}
	</script>
</body>
</html>