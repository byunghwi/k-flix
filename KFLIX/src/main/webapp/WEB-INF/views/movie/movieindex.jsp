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
<link rel="stylesheet" href="/kflix/resources/css/movie/movie.css" />
<meta charset="UTF-8">
<title>영화 관리</title>
</head>

<body>

<div class="container">
	<div class="d-flex justify-content-end">
		<a href="./deletedList" class="btn btn-secondary btn-sm">삭제된 항목</a>
	</div>
	
	<div class="d-flex justify-content-center">
		<h1>영화 관리</h1>
	</div>
	
<div class="d-flex justify-content-between">
<div class="d-flex justify-content-start">
	<span>
		<a href="./addpage" class="btn btn-success">+ 추가</a>
	</span>

</div>

<div class="d-flex justify-content-end">
	<div class="input-group mb-3 input_text justify-content-end"> 
	<div class="input_select">
		<select class="form-select" id="search">
		    <option selected>제목</option>
		    <option value="1">장르</option>
		  </select>
	</div>
		<input type="text" name="" class="form-control" aria-describedby="search">
  		<button class="btn btn-outline-secondary" type="submit" id="search"><i class="fas fa-search"></i></button>
	</div>
</div>
</div>

<section style="padding-top: 20px;">
	<table class="table table-striped text-center align-middle">
		<tr>
			<th>ID</th>
			<th>포스터</th>
			<th>제목</th>
			<th>장르</th>
			<th>상영시간</th>
			<th>등록일</th>
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
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" 
							data-movieid="${movie.movie_id }" data-bs-target="#deletemodal">삭제</button>
					<a href="./detail/${movie.movie_id }" class="btn btn-info text-light">상세보기</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>

<%@include file ="/resources/include/pagecode.jsp" %>
<%-- <c:url var="nextHref" value="./index?page=${page.startPage - page.size}&amount=${page.amount}" />
<c:url var="preHref" value="./index?page=${page.startPage + page.size}&amount=${page.amount}" />

<nav aria-label="...">
  <ul class="pagination justify-content-center">                
          <li class="page-item<c:if test="${not page.prev }"> disabled</c:if>">
             <a class="page-link" href="${nextHref}" tabindex="-1" aria-disabled="true">&laquo;</a>
          </li>
          <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">                                
                  <li class="page-item<c:if test="${page.currPage eq i }"> active</c:if>" aria-current="page">
                        <a class="page-link" href="./index?page=${i }&amount=${page.amount}">${i }</a>
              </li>                                
          </c:forEach>
          <li class="page-item<c:if test="${not page.next || page.endPage eq page.lastPage}"> disabled</c:if>">
              <a class="page-link" href="${preHref}" tabindex="-1" aria-disabled="true">&raquo;</a>
          </li>    
    </ul>
</nav> --%>
</div>



<!-- 삭제 모달 -->
<div class="modal" tabindex="-1" id="deletemodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-danger">
        <h5 class="modal-title text-light">삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body">
	        <p>정말 삭제 하시겠습니까?</p>
	      </div>
          <div class="modal-footer">
          <form action="./delete" method="post">
	          	<input type="hidden" id="deleteid" name="movie_id" value=""/>
		        <input type="submit" class="btn btn-danger" value="삭제"/>
	        </form>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	     </div>
      </div>
    </div>
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script>

var movieid="";

$(document).ready(function() { 
	$('#deletemodal').on('show.bs.modal', function(event){
		movieid = $(event.relatedTarget).data('movieid');

		$('#deleteid').val(movieid);
	});
})
</script>
</body>
</html>