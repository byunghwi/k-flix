<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	img {
		width: 150px;
		height: 100px;	
	}
	
	td{
		padding: 10px;
		text-align: center;
	}	
</style>
<body>

<div>
	<h1>영화 관리</h1>
	<a href="./deletedList">삭제된 항목</a>
</div>

<div>
	<span>
		<a href="./addpage">+ 추가</a>
	</span>
	
	<span style="padding-left: 200px;">
		<select name="colname" id="">
			<option value="movie_title" selected>제목</option>
			<option value="genre_id">장르</option>
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
			<th>장르</th>
			<th>상영시간</th>
			<th>등록일 / 수정일</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${movie }" var="movie" varStatus="status">
			<tr>
				<td>${movie.movie_id }</td>
				<td><img alt="사진" src="${movie.poster_path }"/></td>
				<td>${movie.movie_title }</td>
				<td>${movie.genre_id1 } / ${movie.genre_id2 }</td>
				<td>${movie.play_time }분</td>
				<td><fmt:formatDate value="${movie.reg_date }" pattern="yyyy-MM-dd"/></td>
				<td>
					<a href="./updatepage/${movie.movie_id }">수정</a>
					<a href="./delete/${movie.movie_id }">삭제</a>
					<a href="./detail/${movie.movie_id }">상세보기</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>

</body>
</html>