<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css?ver=1" />
<meta charset="UTF-8">
<title>영화 수정</title>
</head>
<style>
	#thumbImg{
		width: 150px; 
		height: 70px;
	}
</style>
<body>

<div class="container pt-5">

<h1>수정 페이지</h1>

<form action="../update" method="post" enctype="multipart/form-data">

<div class="d-flex justify-content-center">
<input type="hidden" name="movie_id" value="${movie.movie_id }">
<div class="container">
	<div class="input-group mb-3">
	  <span class="input-group-text" id="iG01_01">제목</span>
	  <input type="text" name="movie_title" value="${movie.movie_title }" class="form-control" aria-label="Sizing example input" aria-describedby="iG01_01" required>
	</div>
	
	<div class="input-group mb-3">
	  <label class="input-group-text" for="iG01_02">연령</label>
	  <select class="form-select" id="iG01_02" name="rating" required>
	    <option selected>${movie.rating }</option>
	    <option>all</option>
	    <option>12</option>
	    <option>15</option>
	    <option>19</option>
	  </select>
	</div>

	<div class="input-group mb-3">
		<label class="input-group-text" for="dateform">개봉일</label>
		<input type="date" class="form-control" name="movie_release" max="${today }" value="${release_date}" id="dateform" required/> <br />
		<input type="hidden" name="reg_date" value="${today }" required/>
	</div>
	
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupSelect01">감독</label>
	  <select name="director_id" class="form-select" id="inputGroupSelect01" required>
	   <c:forEach var="dt" items="${director }" varStatus="status" >
	  	 <option value="${dt.director_id }" >${dt.director_name }</option>
	   </c:forEach>
	  </select>
	</div>

	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupSelect01">배우</label>
	  <c:forEach var="i" begin="1" end="3">
		  <select name="actor_id${i }" required class="form-select" id="inputGroupSelect01" required>
		   <c:forEach var="at" items="${actor }" varStatus="status">
		    <option value="${at.actor_id }" >${at.actor_name }</option>
		   </c:forEach>
		  </select>
	   </c:forEach>
	</div>
	
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupSelect01">장르</label>
	  <c:forEach var="i" begin="1" end="2">
		  <select name="genre_id${i }" required class="form-select" id="inputGroupSelect01" required>
		   <c:forEach var="gr" items="${genre }" varStatus="status">
				<option value="${gr.genre_id }" >${gr.genre_name }</option>
			</c:forEach>
		  </select>
	   </c:forEach>
	</div>
	
	<div class="input-group mb-3">
	  <label class="input-group-text" for="iG01_02">국가</label>
	  <select class="form-select" id="iG01_02" name="country" required>
	  	<option value="${movie.country }">${movie.country }</option>
	  	<option>한국</option>
	  	<option>미국</option>
	  	<option>외국</option>
	  </select>
	</div>

</div>

<div class="container">
	
	<div class="input-group">
	  <span class="input-group-text">줄거리</span>
	  <textarea name="summary" rows="14" required class="form-control" aria-label="With textarea">${movie.summary }</textarea>
	</div>

</div>
		<input type="hidden" name="reg_date" value="${today }" />
		<input type="hidden" name="poster_path" value="${movie.poster_path }">
		<input type="hidden" name="teaser_path" value="${movie.teaser_path }">
		<input type="hidden" name="video_path" value="${movie.video_path }"/>

<div class="container">
	<!-- 포스터 -->
	<div id="videofile" class="d-flex">
		<div id="poster_div" class="input-group">
			<label class="input-group-text" for="poster_text">포스터</label>
			<input type="file" name="poster" class="form-control" id="poster_text" 
				accept="image/png, image/jpeg, image/jpg" onchange="posterCheck();"/>
		</div>
		<div>
			<button class="btn" type="button" id="posterRe" onclick="posterRes();"><i class="fas fa-redo"></i></button>
		</div>	
	</div>
	<div id="standardVideo" class="input-group mb-4">
		<input type="text" class="form-control" id="pName"  value="${movie.poster_path }" 
	    		readonly aria-label="Example text with two button addons">
	</div>		


	<!-- 티저  -->
	<div id="teaserfile" class="d-flex">
		<div id="teaser_div" class="input-group">
			<label class="input-group-text" for="teaser_text">티저</label>
		    <input type="file" name="teaser" class="form-control"  id="teaser_text" 
		    	accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" onchange="teaserCheck();"/>
		</div>
   		<div>
			<button class="btn" type="button" id="teaserRe" onclick="teaserRes();"><i class="fas fa-redo"></i></button>
		</div>		
	</div>
   	<div id="standardTeaser" class="input-group mb-4">
	    <input type="text" class="form-control" id="tName" value="${movie.teaser_path }" 
	    			readonly aria-label="Example text with two button addons">
    </div>	  
	
	<!-- 영화 -->
	<div id="videofile" class="d-flex">
		<div id="video_div" class="input-group">
			<label class="input-group-text" for="video_text">영화</label>
			<input type="file" name="video"  class="form-control" id="video_text" 
				accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" onchange="videoCheck();"/>
		</div>
		<div>
			<button class="btn" type="button" id="videoRe" onclick="videoRes();"><i class="fas fa-redo"></i></button>
		</div>	
	</div>
	<div id="standardVideo" class="input-group mb-4">
    	<input type="text" class="form-control" id="vName" value="${movie.video_path }" 
	    			readonly aria-label="Example text with two button addons">
	</div>
	
		
	<div class="input-group mb-5">
	  <span class="input-group-text" id="iG01_03">상영시간</span>
	  <input type="number" name="play_time" min="15" max="300" value="${movie.play_time }"
	  		class="form-control" aria-label="Sizing example input" aria-describedby="iG01_03" required>
	</div>
		
	<div class="d-flex justify-content-end mt-5">
		<div>
			<input type="submit" class="btn btn-primary px-2" value="등록" />
		</div>
		<div class="pe-3 ps-3">
			<a href="/kflix/movie/movieindex" class="btn btn-danger px-2">취소</a>
		</div>
	</div>
</div>

<div id="thumbnail"  class="pb-5">
	<img id="thumbImg" src="${realpath }" alt="" />
</div>
	
</div>
</form>
</div>

<%@include file="/resources/include/movie/alertModal.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="/kflix/resources/js/movie/update.js?ver=36"></script>
<script src="/kflix/resources/js/movie/alertCustom.js?ver=30"></script>
</body>
</html>