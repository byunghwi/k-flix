<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 관리</title>
</head>
<style>
	div, section{
		max-width: 1000px;
		padding-left: 20%;	
	}
</style>
<body>

<div>
	<h1>영화 관리</h1>
</div>

<div>
	<span>
		<a href="./add">+ 추가</a>
	</span>
	
	<span style="padding-left: 200px;">
		<select name="" id="">
			<option value="" selected>제목</option>
			<option value="">감독</option>
			<option value="">배우</option>
		</select> 
		<select name="" id="">
			<option value="" selected>액션</option>
			<option value="">코미디</option>
			<option value="">멜로</option>
			<option value="">가족</option>
			<option value="">스릴러</option>
		</select> 
		<input type="text" />
		<button>검색</button>
	</span>
</div>

<section style="padding-top: 20px;">
	<table border="2px">
		<tr>
			<th>ID</th>
			<th>포스터</th>
			<th>제목</th>
			<th>장르1</th>
			<th>장르2</th>
			<th>상영시간</th>
			<th>등록일</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${movie }" var="movie" varStatus="status">
			<tr>
				<td>${movie.movie_id }</td>
				<td>${movie.poster_path }</td>
				<td>${movie.movie_title }</td>
				<td>${movie.genre_id1 }</td>
				<td>${movie.genre_id2 }</td>
				<td>${movie.play_time }</td>
				<td>${movie.movie_release }</td>
				<td>
					<a href="./update">수정</a>
					<a href="">삭제</a>
					<a href="./detail">상세보기</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>

</body>
</html>