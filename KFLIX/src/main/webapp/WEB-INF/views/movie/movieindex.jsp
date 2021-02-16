<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<meta charset="UTF-8">
<title>영화 관리</title>
</head>

<body>

<div class="container">
	<h1>영화 관리</h1>
	<a href="./deletedList" class="btn btn-secondary">삭제된 항목</a>


<div>
	<span>
		<a href="./addpage" class="btn btn-success">+ 추가</a>
	</span>
	
	
		<select name="colname" id="">
			<option value="movie_title" selected>제목</option>
			<option value="genre_id">장르</option>
		</select>
	<div class="input-group mb-3 input_text"> 
		<input type="text" name="" class="form-control" aria-describedby="search">
  		<button class="btn btn-outline-secondary" type="submit" id="search"><i class="fas fa-search"></i></button>
	</div>
</div>

<section style="padding-top: 20px;">
	<table class="table table-striped text-center">
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
					<a href="./updatepage/${movie.movie_id }" class="btn btn-primary">수정</a>
					<a href="./delete/${movie.movie_id }" class="btn btn-danger">삭제</a>
					<a href="./detail/${movie.movie_id }" class="btn btn-info">상세보기</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
</body>
</html>