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
<title>삭제된 항목</title>
</head>
<body>

<div class="container">
<div>
<h1>삭제된 항목</h1>
	<a href="./" type="button" class="btn btn-secondary text-light">관리페이지</a>
</div>

<div>
	<a href="./deletedList" class="btn btn-info text-light">전체 보기</a>
	
	<!-- 검색 -->
	<form action="./deletedList/find" method="post">
	<div class="input-group mb-3 input_text">
		<input type="text" name="genre_name" class="form-control" aria-describedby="button-addon2">
  		<button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i class="fas fa-search"></i></button>
  	</div>
  	</form>
</div>

<section>
	<table class="table table-striped table-danger text-center align-middle">
		<tr>
			<th>#</th>
			<th>이름</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${genre }" var="genre" varStatus="status">
			<tr id="contents">
				<td>${genre.genre_id }</td>
				<td>${genre.genre_name }</td>
				<td>
					<button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" 
							data-genreid="${genre.genre_id }" data-bs-target="#recoverymodal">복구</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>
</div>

<div class="modal" tabindex="-1" id="recoverymodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title text-light">복구</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body">
	        <p>복구 하시겠습니까?</p>
	      </div>
          <div class="modal-footer">
          <form action="./recovery" method="post">
	          	<input type="hidden" id="recoveryid" name="genre_id"/>
		        <input type="submit" class="btn btn-warning" value="복구"/>
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
	var genreid="";
	
	$(document).ready(function() { 
		$('#recoverymodal').on('show.bs.modal', function(event){
			genreid = $(event.relatedTarget).data('genreid');
	
			$('#recoveryid').val(genreid);
		});
	})

</script>

</body>
</html>