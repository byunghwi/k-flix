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
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<link rel="stylesheet" href="/kflix/resources/css/table/table.css?ver=6" />
<meta charset="UTF-8">
<style>
	#contentTip{
		color: gray;
		font-size: 12px;
	}
	.amount {
		width: 150px;
	}
	thead>tr> th:nth-child(1){
		width: 150px;
	}

	thead>tr> th:nth-child(3){
		width: 200px;
	}
	thead>tr> th:nth-child(4){
		width: 150px;
	}
	thead>tr> th:nth-child(5){
		width: 150px;
	}
</style>
<title>Insert title here</title>
<%@include file="/WEB-INF/views/main/header_test.jsp"%>
</head>
<body>

<%@include file="../manage/navbar.jsp"%>

<section id="table_list">
	<div class="d-flex justify-content-start pb-5" id="board">
		<h1><i class="fas fa-ticket-alt"></i> 이용권</h1>
	</div>

	<div class="d-flex justify-content-end pb-2">
		<!-- 컨텐츠 개수 -->
		<div class="amount">
			<select class="form-select form-select-sm" id="helpAmount">
				<option value="5">5개 씩 보기</option>
				<option value="10">10개 씩 보기</option>
				<option value="${amount }" selected>${amount }개 씩 보기</option>
			</select>
		</div>
	</div>
	
	<!-- 테이블 영역 -->
	<div id="table_main">
		
		<table id="tk_table" class="table talbe text-light text-center align-middle border-dark">
		<thead class="bg-dark">
			<tr>
				<th>#</th>
				<th>이름</th>
				<th>가격</th>
				<th>활성화 여부</th>
				<th>추천 여부</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${ticket }" var="i" varStatus="status">
			<tr>
				<td>${i.ticket_id }</td>
				<td>${i.ticket_name }</td>
				<td>${i.ticket_price }</td>
				<td>${i.ticket_status }</td>
				<td>${i.ticket_recommend }</td>
			</tr>
			</c:forEach>
		</tbody>	
		</table>
	</div>
	<br />
	<!-- 페이지 네이트 영역 -->
	<div id="pagenate">
		<ul  class="pagination justify-content-center">	
		</ul>
	</div>
	
</section>

<%@ include file="/resources/include/movie/alertModal.jsp" %>


<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/kflix/resources/js/movie/pagenate.js?ver=12"></script>
<script src="/kflix/resources/js/movie/alertCustom.js?ver=10"></script>
<script>
//로딩시 페이징
$(document).ready(function() {
	makePageNate(${total}, ${page}, ${amount});
});

// alert
var infomodal = function() {$('#infoconfrim').modal("show")}

function infoMsg(msg){
	$('#alertMsg').html(msg);
	infomodal();
}


// 개수보기 
$('#helpAmount').change(function(){
	$.ajax({
		type: "POST",
		url: "/kflix/ticketindex",
		data: JSON.stringify({
			page: 1,
			amount: parseInt($('#helpAmount').val())
		}),
		contentType: 'application/json',
		global: false,
 		success: function(data){
 			var len = data.len
 			var pnum = data.pagenation.page
 			var amount = data.pagenation.amount
  			
 			makePageNate(len, pnum, amount);
  			 
  			makeTable(data.tk, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
})

// 페이지
function pageClick(pnum) {
	console.log("페이지누르기")
	$.ajax({
		type: "POST",
		url: "/kflix/ticketindex",
		data: JSON.stringify({
			page: pnum,
			amount: parseInt($('#helpAmount').val())
		}),
		contentType: 'application/json',
		global: false,
 		success: function(data){
 			var len = data.len
 			var pnum = data.pagenation.page
 			var amount = data.pagenation.amount
  			
  			
 			makePageNate(len, pnum, amount);
  			 
 			makeTable(data.tk, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}



function makeTable(data, amount) {
	var table = $('#tk_table>tbody');
	
	$('#tk_table>tbody').html('');
	
	try{
		for	(var i = 0; i < amount; i++) {
			table.append('<tr>'
					+'<td>' + data[i].ticket_id + '</td>'
					+'<td>' + data[i].ticket_name + '</td>'
					+'<td>' + data[i].ticket_price + '</td>'
					+'<td>' + data[i].ticket_status + '</td>'
					+'<td>' + data[i].ticket_recommend + '</td>'
					+'</tr>');
			
		}
		
	} catch(err){}
};
</script>
</body>
</html>
