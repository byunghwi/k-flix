<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="/kflix/resources/css/movie/movie.css?ver=3" />
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css?ver=1" />
<meta charset="UTF-8">
<title>영화 등록</title>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">
</head>
<style>
	#imgdiv{
		width: 100%; 
		height: 410px;
	}
	
	#form01{
		width: 35%;
	}
	
	#form02{
		width: 65%;
	}
	#thumbnail{
		width: 100%; 
		height: 100%;
		background-repeat: no-repeat;
		background-size: cover;
	}
	#addform{
		width: 1200px;
		background-color: rgba(0, 0, 0, 0);
		min-width: 1200px;
		padding-top:130px;
	}
	h1{
		color: white;
	}
	.wrapper {position:relative; min-height:100%;}
</style>

<body>
<div class="wrapper">
<%@include file="/WEB-INF/views/main/header_admin.jsp"%>
<%@include file="../manage/navbar.jsp"%>
	<form action="./add" method="post" enctype="multipart/form-data">
<div class="container" id="addform">	
	<div class="container pt-2">	
		<div class="d-flex justify-content-between">
			<div>
				<h1>영화 등록</h1>
			</div>
			
			<div class="d-flex justify-content-end">
				<div>
					<input type="submit" class="btn btn-outline-primary" value="등록" />
				</div>
				<div class="ps-2">
					<a href="./movieindex" class="btn btn-outline-danger">취소</a>
				</div>
			</div>
		</div>
	</div>


	<div class="d-flex justify-content-start">
		<div class="container" id="form01">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="iG01_01">제목</span>
			  <input type="text" name="movie_title" class="form-control" aria-label="Sizing example input" aria-describedby="iG01_01" required>
			</div>
			
			<div class="input-group mb-3">
			  <label class="input-group-text" for="iG01_02">연령</label>
			  <select class="form-select" id="iG01_02" name="rating" required>
			    <option selected>all</option>
			    <option>12</option>
			    <option>15</option>
			    <option>19</option>
			  </select>
			</div>
			
			<div class="input-group mb-3">
				<label class="input-group-text" for="dateform">개봉일</label>
				<input type="date" class="form-control" name="movie_release" max="${today }" id="dateform" required/> <br />
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
			  	<option>한국</option>
			  	<option>미국</option>
			  	<option>외국</option>
			  </select>
		
			<div id="poster_div" class="input-group mb-3 pt-3">
				<label class="input-group-text" for="poster_text">포스터</label>
				<input type="file" name="poster" class="form-control" id="poster_text"
						accept="image/png, image/jpeg, image/jpg" onchange="posterCheck(this);" required/>
			</div>
		
		
			<div id="teaser_div" class="input-group mb-3 pt-2">
				<label class="input-group-text" for="teaser_text">티저</label>
				<input type="file" name="teaser" class="form-control"  id="teaser_text" 
						accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" onchange="teaserCheck();" required/>
			</div>
			
			<div id="video_div" class="input-group mb-3">
				<label class="input-group-text" for="video_text">영화</label>
				<input type="file" name="video"  class="form-control" id="video_text" 
						accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" onchange="videoCheck();" required/>
			</div>	
			<div class="input-group mb-3">
			  <span class="input-group-text" id="iG01_03">상영시간</span>
			  <input type="text" name="play_time" min="15" max="300"
			  		class="form-control" aria-label="Sizing example input" aria-describedby="iG01_03" required>
			</div>
			
	
		</div>
		</div>	

		<div class="container" id="form02">
			<div class="container">
			
				<div class="input-group">
				  <span class="input-group-text">줄거리</span>
				  <textarea name="summary" rows="10" required class="form-control" style="resize: none;" aria-label="With textarea"></textarea>
				</div>
	
				<div id="imgdiv" class="my-2">
					<div id="thumbnail" class="container" style="background-image: url('${realpath}');">
					</div>	
				</div>
				
			</div>
		</div>
	</div>
</div>
</form>

<%@include file="/resources/include/movie/alertModal.jsp"%>
<%@include file="/WEB-INF/views/main/footer.jsp"%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>		
<script src="/kflix/resources/js/movie/inputfile.js?ver=22"></script>
<script src="/kflix/resources/js/movie/alertCustom.js?ver=30"></script>
<script>
$(document).ready(function() { 
	$('#closeMenu').removeAttr('checked');
});
</script>
</body>
</html>