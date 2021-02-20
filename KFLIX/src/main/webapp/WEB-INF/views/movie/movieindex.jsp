<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String rs = request.getServletPath();
			
	String path = rs.substring(rs.lastIndexOf('/'), rs.indexOf(".jsp"));
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href=//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css>
<link rel="stylesheet" href="/kflix/resources/css/movie/movie.css" />
<meta charset="UTF-8">
<title>영화 관리</title>
</head>

<body>

<div class="container">
	<div class="d-flex justify-content-end">
		<a href="./deletedMovie" class="btn btn-secondary btn-sm">삭제된 항목</a>
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
<!-- <form action="./movieindex" method="get" id="findform"> -->
	<div class="input-group mb-3 justify-content-end search_label"> 
	<div class="search_select">
		<select class="form-select" id="search_cols" name="searching_index">
			<option value="" selected>선택</option>
		    <option value="movie_title">제목</option>
		    <option value="director_name">감독</option>
		    <option value="genre_name">장르</option>
		    <option value="reg_date">등록일</option>
		  </select>
	</div>
		<input type="text" name="searching_word" id="search_val" class="form-control" aria-describedby="search">
  		<button class="btn btn-outline-secondary" onclick="searching(1);"><i class="fas fa-search"></i></button>
	</div>
<!-- </form> -->

<div class="ps-2">
	<a class="btn btn-outline-secondary" href="./movieindex">ALL</a>
</div>
</div>
</div>


<section style="padding-top: 20px;" id="movielist">
<table class="table table-striped text-center align-middle" id="movietable">
    <thead>
    <tr>
	   	<th>ID</th>
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
				<td><a href="./updatepage/${movie.movie_id }" class="btn btn-primary">수정</a>
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-movieid="${movie.movie_id }" data-bs-target="#deletemodal">삭제</button>
					<a href="./detail/${movie.movie_id }" class="btn btn-info text-light">상세보기</a>
				</td>
			</tr>
		</c:forEach>
  </tbody>	
</table>
</section>

<div id="pagenate">
	<nav aria-label="...">
	  <ul class="pagination justify-content-center">                
	          <li class="page-item<c:if test="${not page.prev }"> disabled</c:if>">
	             <a class="page-link" id="pre" tabindex="-1" aria-disabled="true">&laquo;</a>
	          </li>
	          
	          <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">                                
	              <li class="page-item<c:if test="${page.currPage eq i }"> active</c:if>" aria-current="page">
	                 <c:if test="${i > 0}" >
	                 	<button class="page-link" id="pnum${i }" onclick="pageClick(${i});">${i }</button>
	                 </c:if>
	              </li>                                
	          </c:forEach>
	          
	          <li class="page-item<c:if test="${not page.next || page.endPage eq page.lastPage}"> disabled</c:if>">
	              <a class="page-link" id="next" tabindex="-1" aria-disabled="true">&raquo;</a>
	          </li>    
	    </ul>
	</nav>
</div>
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
	          	<input type="hidden" id="deleteid" name="movie_id"/>
		        <input type="submit" class="btn btn-danger" value="삭제"/>
	        </form>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	     </div>
      </div>
    </div>
  </div>


<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script>
function pageClick(pnum) {

	console.log('pageClick했음!');
	ajaxCon(pnum);	
}

function searching(pnum) {
	
	var select_word = $('#search_val').val();
	var select_index = $('#search_cols').val();
	
	if (select_word == '' || select_word == null){
		alert("검색할 단어를 입력 해주세요")
		
	} else if (select_index == '' || select_index == null){
		alert("검색할 목록을 선택해 주세요")
		
	} else{
		console.log('서치 클릭함')
		ajaxCon(pnum);
	}
}

function ajaxCon(pnum){
	
	$.ajax({
		type: "POST",
		url: "/kflix/movie/findindex",
		data: JSON.stringify({
			searching_index: $('#search_cols').val(),
   			searching_word: $('#search_val').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			var len = data.length;
  			var amount = 5;
  	
 			makePageNate(len, pnum, amount);
  
  			// 데이터, page - 클릭페이지, amount - 보여줄 수 
  			makeTable(data, pnum, amount);
 
   		},
   		error: function(){
   			alert('불러오는데 실패하였습니다.');
   		}
	}) 
}

// 테이블 만들기
function makeTable(data, pnum, amount) {
		var section = $('#movielist');
		var table = $('#movietable>tbody');
			
		$('table>tbody>*').remove();
	
		var first_li = (pnum - 1) * amount;
		var last_li = first_li + 5;
		
		try{
			for	(var i = first_li; i < last_li; i++) {
				table.append('<tr>'
						+'<td>' + data[i].movie_id + '</td>'
						+'<td><img alt="사진" src="' + data[i].poster_path + '"/></td>'
						+'<td>' + data[i].movie_title + '</td>'
						+'<td>' + data[i].director_name + '</td>'
						+'<td>' + data[i].genre_name1 + " / " + data[i].genre_name2 + '</td>'
						+'<td>' + data[i].play_time + '분</td>'
						+'<td>' + moment(data[i].reg_date).format("YY/MM/DD") + '</td>'
						+'<td><a href="./updatepage/'+data[i].movie_id+'" class="btn btn-primary">수정</a>'
						+'<button type="button" class="btn btn-danger" data-bs-toggle="modal"'
						+'data-movieid="'+data[i].movie_id+'" data-bs-target="#deletemodal">삭제</button>'
						+'<a href="./detail/'+data[i].movie_id+'" class="btn btn-info text-light">상세보기</a>'
						+'</tr>'
				);
			}
			
		} catch(err){
			console.log("마지막 데이터 입니다.")
		}
};


// 페이지 네이트
function makePageNate(len, pnum, amount)	{
		var page_size = 10;
		var end_page = pnum % page_size == 0 ? parseInt(pnum / page_size) * size : parseInt(pnum / page_size + 1) * page_size; 
		var start_page = end_page - (page_size - 1);
		var last_page = len % amount == 0 ? parseInt(len / amount) : parseInt(len / amount) + 1;
		end_page = end_page > last_page ? last_page : end_page;
		
		var prev_page = start_page != 1;
		var next_page = end_page != last_page;
	
	/* 	console.log("컨텐츠토탈: "+ len);
		console.log("클릭페이지: "+pnum);
		console.log("마지막 페이지: "+last_page);
		console.log("끝페이지: "+end_page);
		console.log("시작페이지: "+start_page); */
			
		var pagenate = $('#pagenate ul');
		
		pagenate.html('');
		
		var pagebtn = '';
		
		// pre 버튼
		if (prev_page) {
			pagebtn = '<li class="page-item">';
		} else {
			pagebtn = '<li class="page-item disabled">';
		}
		pagebtn += '<button class="page-link" id="pre" tabindex="-1" aria-disabled="true">«</button>';
		pagebtn += '</li>';
		
		// 페이지 버튼
		for (var i = start_page; i < end_page+1; i++) {
			if (i == pnum){
				pagebtn += '<li class="page-item active" aria-current="page">';
			} else {
				pagebtn += '<li class="page-item" aria-current="page">';
			}
			
			pagebtn += '<button class="page-link" id="pnum'+ (i) +'" onclick="pageClick('+ (i) +');">'+ (i) +'</button>'
			pagebtn += '</li>'
		}
		
		// next 버튼
		if (!next_page || end_page == last_page){
			pagebtn += '<li class="page-item disabled">';
		} else {
			pagebtn += '<li class="page-item">';			
		}
		
		pagebtn += '<button class="page-link" id="next" tabindex="-1" aria-disabled="true">»</button>';
		pagebtn += '</li>';
		
		pagenate.html(pagebtn);
}


$(document).ready(function() { 
	var movieid="";
	$('#deletemodal').on('show.bs.modal', function(event){
		movieid = $(event.relatedTarget).data('movieid');

		$('#deleteid').val(movieid);
	});
})


$('#search_cols').change(function(){
	if ($('#search_cols').val() == 'reg_date'){
		 $('#search_val').val('');
		 $('#search_val').attr("placeholder", "예) yy/mm/dd, yy/mm");
	} else {
		$('#search_val').removeAttr("placeholder");
	}
})

</script>

</body>
</html>