<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="/kflix/resources/css/genre/genre.css" />

<meta charset="UTF-8">
<title>삭제된 항목</title>
</head>
<body>

<div class="container pt-5">
<div>
	<div class="d-flex justify-content-end">
		<a href="./directorindex" type="button" class="btn btn-secondary text-light btn-sm">관리페이지</a>
	</div>
	
	<div class="d-flex justify-content-center">
		<h1>삭제된 항목</h1>
	</div>
</div>

<div class="d-flex justify-content-end">
		<div class="input-group mb-3 input_text">
			<input type="text" name="director_name" id="search_val" class="form-control" aria-describedby="button-addon2" placeholder="이름">
	  		<button class="btn btn-outline-secondary" onclick="searching(1);"><i class="fas fa-search"></i></button>
	  	</div>
		<div class="ps-2">
			<button class="btn btn-outline-secondary" onclick="allView(1);">ALL</button>
		</div>
	</div>

<section id="directorlist">
	<table class="table table-striped table-danger text-center align-middle" id="directortable">
		 <thead>
			<tr>
				<th>#</th>
				<th>이름</th>
				<th>관리</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${director }" var="director" varStatus="status">
				<tr>
					<td>${director.director_id }</td>
					<td>${director.director_name }</td>
					<td>
						<button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" 
								data-directorid="${director.director_id }" data-bs-target="#recoverymodal">복구</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
</div>

<%@include file ="/resources/include/movie/pagecode.jsp" %>
<%@include file ="/resources/include/director/disabledModal.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>
		
<script src="/kflix/resources/js/movie/pagenate.js"></script>
<script src="/kflix/resources/js/genre/genre.js"></script>
<script src="/kflix/resources/js/director/disableDirector.js?ver=3"></script>
</body>
</html>