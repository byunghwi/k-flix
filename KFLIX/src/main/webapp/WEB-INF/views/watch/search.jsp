<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">
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
	href="/kflix/resources/css/watch/csssearch.css">

<link rel="stylesheet"
	href="/kflix/resources/css/common/netflix-fonts.css" />
<link rel="stylesheet"
	href="/kflix/resources/css/common/netflix-pulsate.css" />

<style type="text/css">
#infoframe {
	width: 100%;
	position: fixed;
	top: 0;
	z-index: 100;
	height: 100%;
	display: none;
}

#infoframe::-webkit-scrollbar {
	display: none;
}

.wrapper {
	position: relative;
	min-height: 100%;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="/WEB-INF/views/main/header.jsp"%>

		<div id="searchresult">

			<c:if test="${empty Searchlist}">
				<h3 style="margin: 30px 10px;">"${searchValue }"에 대한 검색결과가
					없습니다.</h3>
			</c:if>
			<c:if test="${not empty Searchlist}">
				<h3 style="margin: 30px 10px;">"${searchValue }"로 검색한 결과 입니다.</h3>
				<div style="padding-bottom: 110px;" class="">
					<c:forEach items="${Searchlist }" var="Searchlist"
						varStatus="status">
						<c:forEach items="${Allmovie }" var="Allmovie" varStatus="status">
							<c:if test="${Searchlist.movie_id eq Allmovie.movie_id}">
								<div class=" searchdiv">

									<div class="">
										<a onclick="framshow(${Allmovie.movie_id})" class="atag">
											<div class="atagdiv">
												<img src="${Allmovie.poster_path }" class="dis img1"
													alt="...">
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
												<div class="videohover">
													<img style="margin: 0;" src="${Allmovie.poster_path }"
														class="modalimg" alt="...">
													<div class="hovervideo">
														<video class="video" muted autoplay loop
															poster="${Allmovie.poster_path}">
															<source src="${Allmovie.teaser_path}" type="video/mp4">
														</video>
													</div>
													<div class="comment">
														<div style="font-size: 1rem;">
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
																	<p class="ratingsty" style="background-color: #c52e37">${Allmovie.rating }</p>
																</c:otherwise>
															</c:choose>
															${Allmovie.movie_title }
														</div>
														<div style="position: absolute; top: 62px; right: 30px;">
															<span
																style="font-family: 'Acme', ' Oswald ', sans-serif; margin-right: 5px">
																<fmt:formatDate value="${Allmovie.reg_date }"
																	pattern="yyyy.MM" />
															</span> • ${Allmovie.play_time }분
														</div>
														<div style="position: absolute; top: 92px; right: 30px;">
															<span
																style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid; padding: 3px 7px;">
																<i class="fas fa-thumbs-up "></i>
															</span> <span
																style="font-family: 'Acme', ' Oswald ', sans-serif; border: 1px solid white; background-color: white; padding: 3px 10px; color: black;">
																${Allmovie.movie_rank }</span>
														</div>
														<div class="infotable1">
															<table>
																<tr align="left">
																	<td colspan="1"><span class="c-gay">감독: </span> <c:forEach
																			items="${AllDirector }" var="AllDirector"
																			varStatus="status">
																			<c:if
																				test="${Allmovie.director_id eq AllDirector.director_id }">
									${AllDirector.director_name }
								</c:if>
																		</c:forEach></td>
																</tr>
																<tr align="left">
																	<td><span class="c-gay">출연: </span> <c:forEach
																			items="${AllActor }" var="AllActor"
																			varStatus="status">
																			<c:if
																				test="${Allmovie.actor_id1 eq AllActor.actor_id }">
									${AllActor.actor_name }<c:if
																					test="${Allmovie.actor_id2 eq AllActor.actor_id }">, 
									</c:if>
																			</c:if>
																			<c:if
																				test="${Allmovie.actor_id2 eq AllActor.actor_id  }">
									${AllActor.actor_name }<c:if
																					test="${Allmovie.actor_id3 eq AllActor.actor_id }">, 
									</c:if>
																			</c:if>

																			<c:if
																				test="${Allmovie.actor_id3 eq AllActor.actor_id }">
									${AllActor.actor_name }
									</c:if>
																		</c:forEach></td>
																</tr>
																<tr align="left">
																	<td><span class="c-gay">개요: </span>${Allmovie.country }영화
																		• <c:forEach items="${AllGenre }" var="AllGenre"
																			varStatus="status">
																			<c:if
																				test="${Allmovie.genre_id1 eq AllGenre.genre_id }">
																			${AllGenre.genre_name}</c:if>
																			<c:if
																				test="${Allmovie.genre_id2 eq AllGenre.genre_id }">
																				${AllGenre.genre_name } </c:if>
																		</c:forEach></td>
																</tr>
															</table>
														</div>
													</div>
												</div>
											</div>

										</a>
									</div>

									<h6>${Allmovie.movie_title }</h6>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</c:if>
		</div>

		<%@include file="/WEB-INF/views/main/footer.jsp"%>
	</div>
	<iframe id="infoframe" name="search" src="" width="400px"
		height="300px" allowTransparency="true"
		style="filter: chroma(color = #999999)"></iframe>
	<!-- <script src="/kflix/resources/js/watch/jsbrowse.js"></script> -->

	<script type="text/javascript">
	infoframe = document.getElementById('infoframe');
	body = document.querySelector('body');
	
	if(${login.ticket_id} == null || ${login.ticket_id} == 0){
		body.style.paddingTop = "50px";
   }else{
         $(".header_ticket").css("display", "none");
   }
		
	
	function framshow(movieId) {
		infoframe.src = "";
		infoframe.style.display = 'block';
		infoframe.src = "/kflix/browse/" + movieId;
		body.style.overflow = 'hidden';
	}
	
	function frameclose() {
		infoframe.src = "";
		infoframe.style.display = 'none';
		body.style.overflow = 'auto';
	}
	
	function videoshow(movieId) {
		location.href = "/kflix/browse/watch/" + movieId;
	}
	
	function framechange(movieId) {
		framshow(movieId);
	}
	
	function mianreload() {
	}
	</script>

</body>
</html>