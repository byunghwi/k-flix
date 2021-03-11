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
<link rel="stylesheet" href="/kflix/resources/css/movie/movie.css?ver=3" />
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<link rel="stylesheet" href="/kflix/resources/css/table/table.css?ver=6" />
<meta charset="UTF-8">
<title>비활성 영화</title>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">
</head>
<style>
	.wrapper {position:relative; min-height:100%;}
</style>
<body>

<div class="wrapper">

<%@include file="/WEB-INF/views/main/header_admin.jsp"%>
<%@include file="../manage/navbar.jsp"%>
<section id="table_list">
<div class="container" id="board">
	
	<div class="d-flex justify-content-between pb-2">
	<div>
		<h1 class="text-light"><i class="fas fa-video text-danger"></i> 비활성 영화</h1>
	</div>
	
	<div class="mt-3">
		<a href="./movieindex" class="btn btn-outline-secondary btn-sm">활성 목록</a>
	</div>
	</div>
	
	
	<div class="d-flex justify-content-end pb-2">
	<!-- 컨텐츠 개수 -->
	<div class="amount pe-3">
		<select class="form-select form-select-sm" id="helpAmount">
			<option value="5" selected>5개 씩 보기</option>
			<option value="10">10개 씩 보기</option>
			<option value="20">20개 씩 보기</option>
		</select>
	</div>
	
	<div class="input-group input-group-sm mb-1 justify-content-end search_label"> 
	<div class="search_select">
		<select class="form-select form-select-sm" id="search_cols" name="searching_index">
			<option value="" selected>선택</option>
		    <option value="movie_title">제목</option>
		    <option value="director_name">감독</option>
		    <option value="genre_name">장르</option>
		    <option value="reg_date">등록일</option>
		  </select>
	</div>
		<input type="text" name="searching_word" id="search_val" class="form-control form-control-sm" aria-describedby="search">
  		<button class="btn btn-outline-secondary btn-sm" onclick="searching(1);"><i class="fas fa-search"></i></button>
	</div>
		<div class="ps-2">
		<button class="btn btn-outline-secondary btn-sm" onclick="allView(1);">ALL</button>
	</div>
	</div>
	</div>
	
	<div id="table_main">
	<table class="table text-center align-middle border-danger text-light" id="movietable">
		<thead class="bg-danger">
		<tr>
			<th>#</th>
			<th>포스터</th>
			<th>제목</th>
			<th>감독</th>
			<th>장르</th>
			<th>상영시간</th>
			<th>등록일</th>
			<th>관리</th>
		</tr>
		</thead>
  		<tbody>
		<c:forEach items="${movie }" var="movie" varStatus="status">
			<tr>
				<td>${movie.movie_id }</td>
				<td><img alt="사진" src="${movie.poster_path }"/></td>
				<td>${movie.movie_title }</td>
				<td>${movie.director_name }</td>
				<td>${movie.genre_name1 } / ${movie.genre_name2 }</td>
				<td>${movie.play_time }분</td>
				<td><fmt:formatDate value="${movie.reg_date }" pattern="yy/MM/dd"/></td>
				<td>
				<button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" 
							data-movieid="${movie.movie_id }" data-bs-target="#recoverymodal">활성화</button>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div>
	<%@include file ="/resources/include/movie/pagecode.jsp" %>
	</div>
	


</section>



<%@ include file="/resources/include/movie/alertModal.jsp" %>
<%@ include file="/resources/include/movie/disModal.jsp" %>
  
 <%@include file="/WEB-INF/views/main/footer.jsp"%>
 </div>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/kflix/resources/js/movie/deletedrest.js?ver=10"></script>
<script>
$(document).ready(function() { 
	$('#movie').prepend('<span class="nav-clicked"></span>');
});

</script>
</body>
</html>