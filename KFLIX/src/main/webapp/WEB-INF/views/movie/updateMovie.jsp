<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 수정</title>
</head>
<body>

<h1>수정 페이지</h1>

<form action="../update" method="post" enctype="multipart/form-data">

<input type="hidden" name="movie_id" value="${movie.movie_id }">
제목 : <input type="text" name="movie_title" value="${movie.movie_title }"/> <br />
연령 : <input type="text" name="rating" value="${movie.rating }"/> <br /> 
상영시간 : <input type="text" name="play_time" value="${movie.play_time }"/> <br />
줄거리 
<br /><textarea name="summary" id="" cols="30" rows="6">${movie.summary } 
</textarea> <br />

감독 : <select name="director_id">
		  <c:forEach var="dt" items="${director }" varStatus="status">
		  	<option value="${dt.director_id }" >${dt.director_name }</option>
		  </c:forEach>
		</select><br />

배우 :  		
<c:forEach var="i" begin="1" end="3">
<select name="actor_id${i }">
			 <c:forEach var="at" items="${actor }" varStatus="status">
			 	<option value="${at.actor_id }" >${at.actor_name }</option>
			 </c:forEach>
		   </select>
</c:forEach><br />

장르 :		
<c:forEach var="i" begin="1" end="2">
 <select name="genre_id${i }">
			 <c:forEach var="gr" items="${genre }" varStatus="status">
			 	<option value="${gr.genre_id }" >${gr.genre_name }</option>
			 </c:forEach>
		   </select>
</c:forEach><br />

국가 : <select name="country">
	  	<option>한국</option>
	  	<option>미국</option>
	  	<option>외국</option>
	  </select> <br />
	  
개봉일 : <input type="date" name="movie_release" max="${today }" value="${release_date}"/> <br />
<input type="hidden" name="reg_date" value="${today }" />
 <input type="hidden" name="poster_path" value="${movie.poster_path }">
<input type="hidden" name="teaser_path" value="${movie.teaser_path }">
<input type="hidden" name="video_path" value="${movie.video_path }"/>

<div id="poster_div">
포스터 : ${movie.poster_path }<button id="poster_btn" onclick="posterBtn();">변경</button>
</div>

<div id="teaser_div">
티 저 : ${movie.teaser_path } <button id="teaser_btn" onclick="teaserBtn();">변경</button>
</div>

<div id="video_div">
비디오 : ${movie.video_path } <button id="video_btn" onclick="videoBtn();">변경</button>
</div>

<input type="submit" value="등록" />
</form>


<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>
		
<script src="/kflix/resources/js/movie/inputfile.js"></script>

<script>
function posterBtn() {
	var poster_div = $("#poster_div");
	
	poster_div.html("");
	poster_div.append('포스터 : <input type="file" name="poster" accept="image/png, image/jpeg, image/jpg" id="poster_text" onchange="posterCheck();" required/> <br />');
	
}

function teaserBtn() {
	var teaser_div = $("#teaser_div");
	
	teaser_div.html("");
	teaser_div.append('티저 : <input type="file" name="teaser" accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" id="teaser_text" onchange="teaserCheck();" required/> <br />');
	
}

function videoBtn() {
	var video_div = $("#video_div");
	
	video_div.html("");
	video_div.append('비디오 : <input type="file" name="video" accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" id="video_text" onchange="videoCheck();" required/> <br />');
	
}

</script>

</body>
</html>