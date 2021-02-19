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
		    <option value="movie_title" selected>제목</option>
		    <option value="director_name">감독</option>
		    <option value="genre_name">장르</option>
		    <option value="reg_date">등록일</option>
		  </select>
	</div>
		<input type="text" name="searching_word" id="search_val" class="form-control" aria-describedby="search">
  		<button class="btn btn-outline-secondary" id="search"><i class="fas fa-search"></i></button>
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

<c:url var="nextHref" value=".<%=path %>?page=${page.startPage - page.size}&amount=${page.amount}" />
<c:url var="preHref" value=".<%=path %>?page=${page.startPage + page.size}&amount=${page.amount}" />

<nav aria-label="...">
  <ul class="pagination justify-content-center">                
          <li class="page-item<c:if test="${not page.prev }"> disabled</c:if>">
             <a class="page-link" id="pre" href="${nextHref}" tabindex="-1" aria-disabled="true">&laquo;</a>
          </li>
          <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">                                
              <li class="page-item<c:if test="${page.currPage eq i }"> active</c:if>" aria-current="page">
                 <c:if test="${i > 0}" >
                 	<button class="page-link" id="pnum${i }" >${i }</button>
                 </c:if>
              </li>                                
          </c:forEach>
          <li class="page-item<c:if test="${not page.next || page.endPage eq page.lastPage}"> disabled</c:if>">
              <a class="page-link" id="next" href="${preHref}" tabindex="-1" aria-disabled="true">&raquo;</a>
          </li>    
    </ul>
</nav>

<%-- <%@include file ="/resources/include/pagecode.jsp" %> --%>
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
/* private int page;
private int amount; */
$('#pnum1').click(function(){
	alert("페이지 1 클릭")

	console.log($('#pnum1').html());
	console.log($('#movielist tr').length - 1);
 	$.ajax({
		type: "POST",
		url: "/kflix/movie/setpage",
		data: JSON.stringify({
			page: $('#page_num1').html(),
			amount: $('#movielist tr').length - 1
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			console.log('통신성공');
  			
  			for (key in data){
  				console.log(key + ': ' + data[key]);
  				
  			}
 			
   		},
   		error: function(){
   			alert('불러오는데 실패하였습니다.');
   		}
	}) 
})



// 검색 버튼 누를시 데이터 가져오기
$('#search').click(function() {

	$.ajax({
   		type: "POST",
   		url: "/kflix/movie/findindex",	
   		data: JSON.stringify({
   			searching_index: $('#search_cols').val(),
   			searching_word: $('#search_val').val()
   			
   		}),
   		contentType: 'application/json',

   		success: function(data){
   			
   			// 테이블 만들기
   			makeTable(data);
  		
   		},
   		error: function(){
   			alert('불러오는데 실패하였습니다.');
   		}
   	});
	
});


// 테이블 만들기
function makeTable(data) {
		var section = $('#movielist');
		var table = $('#movietable>tbody');
			
		$('table>tbody>*').remove();
		
		for	(key in data) {
			table.append('<tr>'
					+'<td>' + data[key].movie_id + '</td>'
					+'<td><img alt="사진" src="' + data[key].poster_path + '"/></td>'
					+'<td>' + data[key].movie_title + '</td>'
					+'<td>' + data[key].director_name + '</td>'
					+'<td>' + data[key].genre_name1 + " / " + data[key].genre_name2 + '</td>'
					+'<td>' + data[key].play_time + '분</td>'
					+'<td>' + moment(data[key].reg_date).format("YY/MM/DD") + '</td>'
					+'<td><a href="./updatepage/'+data[key].movie_id+'" class="btn btn-primary">수정</a>'
					+'<button type="button" class="btn btn-danger" data-bs-toggle="modal"'
					+'data-movieid="'+data[key].movie_id+'" data-bs-target="#deletemodal">삭제</button>'
					+'<a href="./detail/'+data[key].movie_id+'" class="btn btn-info text-light">상세보기</a>'
					+'</tr>'
			);
		}
};




var movieid="";

$(document).ready(function() { 
	$('#deletemodal').on('show.bs.modal', function(event){
		movieid = $(event.relatedTarget).data('movieid');

		$('#deleteid').val(movieid);
	});
})


// 검색 유효성
$('#findform').submit(function(){
	var select_word = $('#search_val').val();
	
	if (select_word == '' || select_word == null){
		alert("검색할 단어를 입력 해주세요")
		return false;	
	} 
	
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