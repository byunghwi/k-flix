<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<br /><textarea name="summary" id="" cols="30" rows="6">${movie.summary }</textarea> <br />

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
	  
개봉일 : <input type="text" name="movie_release" placeholder="yyyy.MM.dd" value="${movie.movie_release }"/> <br />

포스터 : <input type="file" name="poster" /> <br />
티저 : <input type="file" name="teaser" /> <br />
비디오 : <input type="file" name="video"  /> <br />
<input type="submit" value="등록" />
</form>

</body>
</html>