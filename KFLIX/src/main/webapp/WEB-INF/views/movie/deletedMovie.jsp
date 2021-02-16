<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제된 목록</title>
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
</head>
<body>
<div>
<h1>삭제 목록</h1>
<a href="./">관리 페이지</a>
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
					<a href="./recovery/${movie.movie_id }">복구</a>
					<a href="./detail/${movie.movie_id }">상세보기</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>


</body>
</html>