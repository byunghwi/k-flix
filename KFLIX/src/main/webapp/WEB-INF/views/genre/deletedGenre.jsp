<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="/kflix/resources/css/genre/genre.css" />
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<style>
	#genrelist{
		width: 1200px;
		max-width: 1200px;
		min-width: 1200px;
	}
	#geMain {
		overflow: auto;
		height: 620px;
	}
</style>
<meta charset="UTF-8">
<title>삭제된 항목</title>
</head>
<body>

<section id="genrelist">
<div class="container pt-5">
<div>
	<div class="d-flex justify-content-end">
		<a href="./genreindex" type="button" class="btn btn-outline-secondary btn-sm">관리페이지</a>
	</div>
	
	<div class="d-flex justify-content-center">
		<h1>삭제된 항목</h1>
	</div>
</div>
<div class="d-flex justify-content-end">
	<!-- 컨텐츠 개수 -->
	<div class="amount pe-3">
		<select class="form-select form-select-sm" id="helpAmount">
			<option value="5">5개 씩 보기</option>
			<option value="10"selected>10개 씩 보기</option>
			<option value="20">20개 씩 보기</option>
		</select>
	</div>
		<div class="input-group input-group-sm mb-3 input_text">
			<input type="text" name="genre_name"  id="search_val" class="form-control" aria-describedby="button-addon2" placeholder="이름">
	  		<button class="btn btn-outline-secondary" onclick="searching(1);"><i class="fas fa-search"></i></button>
	  	</div>
		<div class="ps-2">
			<button class="btn btn-outline-secondary btn-sm" onclick="allView(1);">ALL</button>
		</div>
	</div>
	
	<div id="geMain">
	<table class="table table-striped border-danger text-center align-middle" id="genretable">
		 <thead class="bg-danger text-light">
			<tr>
				<th>#</th>
				<th>이름</th>
				<th>관리</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${genre }" var="genre" varStatus="status">
				<tr>
					<td>${genre.genre_id }</td>
					<td>${genre.genre_name }</td>
					<td>
						<button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" 
								data-genreid="${genre.genre_id }" data-bs-target="#recoverymodal">복구</button>
					</td>
				</tr>
			</c:forEach>
		 </tbody>
	</table>
	</div>
</div>

<%@include file ="/resources/include/movie/pagecode.jsp" %>

</section>

<%@ include file="/resources/include/movie/alertModal.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="/kflix/resources/js/movie/pagenate.js"></script>
<script src="/kflix/resources/js/genre/genre.js?ver=1"></script>
<script src="/kflix/resources/js/genre/disabled.js?ver=3"></script>	
</body>
</html>