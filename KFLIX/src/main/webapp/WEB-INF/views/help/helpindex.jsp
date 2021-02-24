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
<link rel="stylesheet" type="text/css" href=//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css>
<<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<body>

<!-- 본체 영역 -->
<div class="container">

	<!-- 검색 영역 -->
	<div id="searchArea">
		<select name="help_type" id="searchType">
			<option value="all" selected>모든 카테고리</option>
			<option>이용안내</option>
			<option>결제</option>
			<option>환불</option>
			<option>이용권</option>
			<option>계정</option>
			<option>컨텐츠</option>
			<option>재생</option>
			<option>서비스</option>
		</select>	
	</div>

	<!-- 테이블 영역 -->
	<div id="helpMain">
		<input id="helpData" type="hidden" value="${total }"/>
		<table id="helpTable" class="table talbe table-striped text-center align-middle">
		<thead>
			<tr>
				<th>#</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${help }" var="help" varStatus="status">
			<tr>
				<td>${help.help_id }</td>
				<td>${help.help_type }</td>
				<td>${help.help_title }</td>
				<td><fmt:formatDate value="${help.help_date }" pattern="yyyy-MM-dd"/></td>
				<td>
					<button id="" class="btn btn-primary">수정</button>
					<button id="" class="btn btn-danger">삭제</button>
				</td>
			</tr>
			</c:forEach>
		</tbody>	
		</table>
	</div>
	
	<!-- 페이지 네이트 영역 -->
	<div id="pagenate">
		<ul  class="pagination justify-content-center">	
		</ul>
	</div>
	
</div>


<!-- 정보모달 -->
<div class="modal" tabindex="-1" id="infoconfrim">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-dark">
      	<img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body" id="alertBody">
	     <span id="alertMsg"></span>
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">확인</button>
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
<script src="/kflix/resources/js/movie/pagenate.js?ver=8"></script>
<script>
$(document).ready(function() { 
	var len = $('#helpData').val();
	var pnum = 1;
	var amount = 10;
	makePageNate(len, pnum, amount);
});

// alert 창
var infomodal = function() {$('#infoconfrim').modal("show")}

function infoMsg(msg){
	$('#alertMsg').html(msg);
	infomodal();
}

$('#searchType').change(function() {
	ajaxCon(1);
});

function pageClick(pnum) {
	ajaxCon(pnum);	
}

function makeTable(data, pnum, amount) {
	var table = $('#helpTable>tbody');
	
	$('#helpTable>tbody').html('');

	var first_li = (pnum - 1) * amount;
	var last_li = first_li + amount;
	
	try{
		for	(var i = first_li; i < last_li; i++) {
			table.append(
					'<tr>'
					+'<td>' + data[i].help_id + '</td>'
					+'<td>' + data[i].help_type + '</td>'
					+'<td>' + data[i].help_title + '</td>'
					+'<td>' + moment(data[i].help_date).format("YY/MM/DD") + '</td>'
					+'<td>'
					+'<button id="" class="btn btn-primary">수정</button> '
					+'<button id="" class="btn btn-danger">삭제</button>'
					+'</td>'
					+'</tr>'
			);
		}
		
	} catch(err){
		console.log("마지막 데이터 입니다.")
	}
};



function ajaxCon(pnum){
	
	$.ajax({
		type: "POST",
		url: "/kflix/FQARest/index",
		data: JSON.stringify({
			help_type: $('#searchType').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			var len = data.length;
  			var amount = 10;
  	
 			makePageNate(len, pnum, amount);
  			 
  			makeTable(data, pnum, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}


</script>
</body>
</html>