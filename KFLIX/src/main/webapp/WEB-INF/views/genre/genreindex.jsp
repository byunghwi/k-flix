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

<meta charset="UTF-8">
<title>장르</title>
</head>
<body>


<div class="container pt-5">
	<div class="d-flex justify-content-end">
		<a href="./deletedList" type="button" class="btn btn-secondary text-light btn-sm">삭제된 항목</a>
	</div>
	
	<div class="d-flex justify-content-center">
		<h1>장르관리</h1>
	</div>

<div class="d-flex justify-content-between">
<div class="d-flex justify-content-start">
		<span>
			<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addmodal">
			  + 추가
			</button>
		</span>
</div>	
<div class="d-flex justify-content-end">
		<div class="input-group mb-3 input_text">
			<input type="text" id="search_val" class="form-control" aria-describedby="button-addon2" placeholder="이름">
	  		<button class="btn btn-outline-secondary" onclick="searching(1);"><i class="fas fa-search"></i></button>
	  	</div>
		<div class="ps-2">
			<button class="btn btn-outline-secondary" onclick="allView(1);">ALL</button>
		</div>
	</div>
</div>
<section id="genrelist">
	<table class="table table-striped text-center align-middle" id="genretable">
		 <thead>
			<tr>
				<th>#</th>
				<th>이름</th>
				<th>관리</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${genre }" var="genre" varStatus="status">
				<tr id="contents">
					<td>${genre.genre_id }</td>
					<td>${genre.genre_name }</td>
					<td>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" 
								data-genreid="${genre.genre_id }" data-bs-target="#updatemodal">수정</button>
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" 
								data-genreid="${genre.genre_id }" data-bs-target="#deletemodal">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
</div>

<%@include file ="/resources/include/movie/pagecode.jsp" %>
<%@include file ="/resources/include/genre/enabledModal.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>
		
<script src="/kflix/resources/js/movie/pagenate.js"></script>
<script src="/kflix/resources/js/genre/genre.js"></script>
<script src="/kflix/resources/js/genre/enabled.js?ver=1"></script>
</body>
</html>