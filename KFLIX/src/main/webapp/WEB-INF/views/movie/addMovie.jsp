<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
</head>
<body>

<h1>영화 등록 페이지</h1>

<form action="./add" method="post" enctype="multipart/form-data">

제목 : <input type="text" name="movie_title" required/> <br />
연령 : <input type="text" name="rating" required/> <br /> 
상영시간 : <input type="text" name="play_time" required/> <br />
줄거리 
<br /><textarea name="summary" id="" cols="30" rows="6" required></textarea> <br />

감독 : <select name="director_id" required>
		  <c:forEach var="dt" items="${director }" varStatus="status">
		  	<option value="${dt.director_id }" >${dt.director_name }</option>
		  </c:forEach>
		</select><br />
배우 : 
<c:forEach var="i" begin="1" end="3">
	<select name="actor_id${i }" required>
		 <c:forEach var="at" items="${actor }" varStatus="status">
		 	<option value="${at.actor_id }" >${at.actor_name }</option>
		 </c:forEach>
   	</select>
</c:forEach><br />

장르 :	
<c:forEach var="i" begin="1" end="2">
	<select name="genre_id${i }" required>
		<c:forEach var="gr" items="${genre }" varStatus="status">
			<option value="${gr.genre_id }" >${gr.genre_name }</option>
		</c:forEach>
	</select>
</c:forEach><br />

국가 : <select name="country" required>
	  	<option>한국</option>
	  	<option>미국</option>
	  	<option>외국</option>
	  </select> <br />
	  
개봉일 : <input type="date" name="movie_release" max="${today }" required/> <br />
<!-- 등록일 --><input type="hidden" name="reg_date" value="${today }" required/>

<div id="poster_div">
포스터 : <input type="file" name="poster" accept="image/png, image/jpeg, image/jpg" id="poster_text" onchange="posterCheck();" required/> <br />
</div>

<div id="teaser_div">
티저 : <input type="file" name="teaser" accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" id="teaser_text" onchange="teaserCheck();" required/> <br />
</div>

<div id="video_div">
비디오 : <input type="file" name="video" accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" id="video_text" onchange="videoCheck();" required/> <br />
</div>

<input type="submit" value="등록" />
</form>


<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="/kflix/resources/js/movie/inputfile.js"></script>

</body>
</html>