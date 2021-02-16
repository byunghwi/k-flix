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

<div class="container">
<div>
<h1>장르관리</h1>
	<a href="/kflix/genre/deletedList" type="button" class="btn btn-secondary text-light">삭제된 항목</a>
</div>

<div>
	<span>
		<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addmodal">
		  + 추가
		</button>
	</span>
	
	<!-- 검색 -->
	<form action="/kflix/genre/find" method="post">
	<div class="input-group mb-3 input_text">
		<input type="text" name="genre_name" class="form-control" aria-describedby="button-addon2">
  		<button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i class="fas fa-search"></i></button>
  	</div>
  	</form>
</div>

<section>
	<table class="table table-striped text-center">
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
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" 
							data-genreid="${genre.genre_id }" data-bs-target="#updatemodal">수정</button>
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" 
							data-genreid="${genre.genre_id }" data-bs-target="#deletemodal">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>
</div>

<div class="modal" tabindex="-1" id="addmodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-success">
        <h5 class="modal-title text-light">추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
      <form action="/kflix/genre/add" method="post">
	      <div class="input-group mb-3 input_text">
	      	<span class="input-group-text" id="inputGroup-sizing-sm">장르명</span>
	  		<input type="text" class="form-control" name="genre_name" 
	  				aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	  </div>
	      
	      <div class="modal-footer">
        	<input type="submit" class="btn btn-success" value="등록"/>
        	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
          </div>
      </form>
       
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="updatemodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title text-light">수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="/kflix/genre/update" method="post">
	      <div class="input-group mb-3 input_text">
	      	<span class="input-group-text" id="inputGroup-sizing-sm">장르명</span>
	  		<input type="hidden" id="update_id" name="genre_id" value=""/>
	  		<input type="text" class="form-control" name="genre_name" 
	  				aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	      </div>
        	
       
   		<div class="modal-footer">
   			<input type="submit" class="btn btn-primary" value="수정" />
        	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>    
        </div>
        </form>
      </div>
    </div>
  </div>
</div>


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
          <form action="/kflix/genre/delete" method="post">
	          	<input type="hidden" id="deleteid" name="genre_id" value=""/>
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
	var genreid="";
	var genrename="";
	
	$(document).ready(function() { 
		$('#updatemodal').on('show.bs.modal', function(event){
			genreid = $(event.relatedTarget).data('genreid');
	
			$('#update_id').val(genreid);
		});
	})
	
	$(document).ready(function() { 
		$('#deletemodal').on('show.bs.modal', function(event){
			genreid = $(event.relatedTarget).data('genreid');
	
			$('#deleteid').val(genreid);
		});
	})

</script>

</body>
</html>