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
<meta charset="UTF-8">
<title>내 문의 내역</title>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">
</head>
<style>
	body {
		background-color: rgb(20,20,20);
		color:white;
	}
	#myinq{
		padding-top: 100px;
		padding-bottom: 100px;
		width: 1200px;
		margin-left: calc(50% - 600px);
	}

	thead>tr> th:nth-child(1){
		width: 150px;
	}
	thead>tr> th:nth-child(2){
		width: 500px;
	}
	thead>tr> th:nth-child(3){
		width: 200px;
	}
	.wrapper {
	
		position:relative;
	
	    min-height:100%;

	}
</style>
<body>

<div class="wrapper">
<%@include file="/WEB-INF/views/main/header.jsp"%>

<section id="myinq">
	<div class="pb-2 text-center" id="myinq_title">
		<h1 class="text-center">내 문의</h1>
	</div>
	
	

	<div class="px-5">
	
		<div>
			<a href="/kflix/inquiry" class="btn btn-secondary contentfont">1:1 문의하기</a>
		</div>
		
		<div class="d-flex justify-content-end pb-1">
			<!-- 검색 영역 -->
			<div id="searchArea" class="pe-2">
			  <select class="form-select form-select-sm" id="searchType" required>
			  	<option value="all">모든 카테고리</option>
				<c:forEach items="${category }" var="i" begin="0" end="${category.size()}" varStatus="status">
					 <option>${i }</option>
				</c:forEach>
			  </select>
			</div>
			
				
			<!-- 답변 미답변 -->
			<div class="pe-2">
			 <select class="form-select form-select-sm" id="isreply" required>
			  	<option value="all">전체보기</option>
				 <option>미답변</option>
				 <option>답변</option>
			  </select>
			</div>
			
			<!-- 컨텐츠 개수 -->
			<div class="amount">
				<select class="form-select form-select-sm" id="helpAmount">
					<option value="5">5개 씩 보기</option>
					<option value="10" selected>10개 씩 보기</option>
					<option value="20">20개 씩 보기</option>
				</select>
			</div>
		</div>	
	
		<div id="tablediv">
		<table id="myinq_table" class="table text-center text-light align-middle">
			<thead>
				<tr class="bg-dark">
					<th>카테고리</th>
					<th>문의 제목</th>
					<th>문의 날짜</th>
					<th>답변 날짜</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${inq }" var="i" varStatus="status">
				<tr>
					<td>${i.inquiry_type }</td>
					<td>${i.inquiry_title }</td>
					<td><fmt:formatDate value="${i.inquiry_date }" pattern="yyyy-MM-dd"/></td>
					<td>					
					<c:choose>
						<c:when test="${empty i.reply_date}">
							<button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#noReplyModal"
								data-type="${i.inquiry_type }" data-inqcont="${i.inquiry_content }" data-inqtitle="${i.inquiry_title }">미답변</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#ReplyModal"
								data-type="${i.inquiry_type }" data-inqcont="${i.inquiry_content }" data-inqtitle="${i.inquiry_title }" 
								data-rcont="${i.reply_content }" data-rtitle="${reply_title }">
								<fmt:formatDate value="${i.reply_date }" pattern="yyyy-MM-dd"/>
							</button>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				</c:forEach>			
			</tbody>
		</table>
		</div>
	</div>
	<!-- 페이지 네이트 영역 -->
	<div id="pagenate" class="pb-3">
		<ul  class="pagination justify-content-center">	
		</ul>
	</div>
	
</section>

<%@include file="/WEB-INF/views/main/footer.jsp"%>


</div>

<div class="modal" tabindex="-1" id="noReplyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-dark">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">	
  		<div class="mb-3">
		  <h6 class="text-dark">카테고리</h6>
		  <input type="text" class="form-control" id="n_inq_type" required readonly>
		</div>
		
		<div class="mb-3">
		  <h6 class="text-dark">문의 제목</h6>
		  <input type="text" class="form-control" id="inq_title" required readonly>
		</div>
		
		<div class="mb-3">
		  <h6 class="text-dark">문의하신 내용</h6>
		  <textarea class="form-control" id="inq_content" rows="15" style="resize: none;" required readonly></textarea>
		</div>
		
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>


<div class="modal" tabindex="-1" id="ReplyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-dark">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">	
  		<div class="mb-3">
		  <h6 class="text-dark">카테고리</h6>
		  <input type="text" class="form-control" id="inq_type" required readonly>
		</div>
      
		<div class="mb-3">
		  <h6 class="text-dark">문의 제목</h6>
		  <input type="text" class="form-control" id="re_inq_title" required readonly>
		</div>
		
		<div class="mb-3">
		  <h6 class="text-dark">문의하신 내용</h6>
		  <textarea class="form-control" id="re_inq_content" rows="7" style="resize: none;" required readonly></textarea>
		</div>

		<div class="mb-3">
		  <h6 class="text-dark">답변 내용</h6>
		  <textarea class="form-control" id="re_content" rows="7" style="resize: none;" required readonly></textarea>
		</div>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
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
<script src="/kflix/resources/js/movie/pagenate.js?ver=12"></script>
<script src="/kflix/resources/js/movie/alertCustom.js?ver=10"></script>
<script>
$('document').ready(function(){
	var check = '${inqCheck}';
	if (check != null && check != ''){
		infoMsg(check);
		$('#infoconfrim').on('hidden.bs.modal', function(){
			location.reload();		
		})
	}
})
$(document).ready(function() { 
	makePageNate(${total}, 1, 10);
});

//답변 미답변
$('#isreply').change(function(){
	var pnum = 0;
	
	if ($('.active').text() == '' 
			|| $('.active').text() == 0
			|| $('.active').text() != 'number'
			|| $('.active').text() == null){
		pnum = 1;
		
	} else {
		pnum = parseInt($('.active').text());
	}
	
	var type = "POST";
	var url = "/kflix/inquiry/user";
	var data = JSON.stringify({
		page: pnum,
		amount: parseInt($('#helpAmount').val()),
		inquiry_type: $('#searchType').val(),
		reply_status: $('#isreply').val(),
		email: '${login.email}'
	});
	
	ajax(type, url, data, pnum);
})

// 검색
$('#searchType').change(function(){
	var pnum = 0;
	
	if ($('.active').text() == '' 
			|| $('.active').text() == 0
			|| $('.active').text() != 'number'
			|| $('.active').text() == null){
		pnum = 1;
		
	} else {
		pnum = parseInt($('.active').text());
	}
	
	var type = "POST";
	var url = "/kflix/inquiry/user";
	var data = JSON.stringify({
		page: pnum,
		amount: parseInt($('#helpAmount').val()),
		inquiry_type: $('#searchType').val(),
		reply_status: $('#isreply').val(),
		email: '${login.email}'
	});
	
	ajax(type, url, data, pnum);
})

// 개수보기 
$('#helpAmount').change(function(){
	var type = "POST";
	var url = "/kflix/inquiry/user";
	var data = JSON.stringify({
		page: 1,
		amount: parseInt($('#helpAmount').val()),
		inquiry_type: $('#searchType').val(),
		reply_status: $('#isreply').val(),
		email: '${login.email}'
	});
	
	ajax(type, url, data, 1);
})

function ajax(type, url, data, pnum) {
	$.ajax({
		type: type,
		url: url,
		data: data,
		contentType: 'application/json',
 		success: function(data){
  			var len = data.len;
  			var amount =  parseInt($('#helpAmount').val())
  			
  			console.log(data.len)
  			console.log(data.inq)
	
  			var anotherPnum = Math.ceil(len / amount);
  			if ($('.active').text() == '' 
  					|| $('.active').text() == 0
  					|| $('.active').text() != 'number'){
  				pnum = 1;
  				
  			} else if (anotherPnum > 0 && anotherPnum < pnum){
  				pnum = anotherPnum;
  			}
  			
 			makePageNate(len, pnum, amount);
  			 
 			makeTable(data.inq, amount);
 			
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		},
   		complete: function(){
   			$('#replyModal').modal('hide');
   		}
	}) 
}
function pageClick(pnum) {
	var p = {
		page: pnum,
		amount: parseInt($('#helpAmount').val()),
		inquiry_type: $('#searchType').val(),
		reply_status: $('#isreply').val(),
		email: '${login.email}'
	}

	$.ajax({
		type: "POST",
		url: "/kflix/inquiry/user",
		data: JSON.stringify(p),
		contentType: 'application/json',
		global: false,
 		success: function(data){
  			var len = data.len;
  			var amount =  parseInt($('#helpAmount').val())
  			console.log(data.len)
  			console.log(data.inq)
  			
 			makePageNate(len, pnum, amount);
  			 
  			makeTable(data.inq, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}

function makeTable(data, amount){
	var table = $('#myinq_table>tbody');
	
	$('#myinq_table>tbody').html('');
		
	try{
	
		for	(var i = 0; i < amount; i++) {
			var make = '';
			if (data[i].reply_date == null) {
				make = '<button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#noReplyModal"'
						+'data-type="' + data[i].inquiry_type + '" data-inqcont="' + data[i].inquiry_content + '" data-inqtitle="' + data[i].inquiry_title + '">미답변</button>'
	
			} else {
				make = '<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#ReplyModal"'
						+'data-type="' + data[i].inquiry_type + '" data-inqcont="' + data[i].inquiry_content + '" data-inqtitle="' + data[i].inquiry_title + '"'
						+'data-rcont="' + data[i].reply_content + '" data-rtitle="' + data[i].reply_title + '">'
						+moment(data[i].reply_date).format("YYYY-MM-DD") + '</button>'
			}
			
			table.append('<tr>'
					+'<td>' + data[i].inquiry_type + '</td>'
					+'<td>' + data[i].inquiry_title + '</td>'
					+'<td>' + moment(data[i].inquiry_date).format("YYYY-MM-DD") + '</td>'
					+'<td>' + make
					+'</td></tr>');
			
		}
		
	} catch(err){}
}

var noReModal = document.getElementById('noReplyModal')
noReModal.addEventListener('show.bs.modal', function (event) {
	type = $(event.relatedTarget).data('type');
	rtitle = $(event.relatedTarget).data('inqtitle');
	rcont = $(event.relatedTarget).data('inqcont');
	
	$('#n_inq_type').val(type);
	$('#inq_title').val(rtitle);
	$('#inq_content').html(rcont);
})

var reModal = document.getElementById('ReplyModal')
reModal.addEventListener('show.bs.modal', function (event) {
	type = $(event.relatedTarget).data('type');
	icont = $(event.relatedTarget).data('inqcont');
	ititle = $(event.relatedTarget).data('inqtitle');
	rtitle = $(event.relatedTarget).data('rtitle');
	rcont = $(event.relatedTarget).data('rcont');

		
	$('#inq_type').val(type);
	$('#re_inq_title').val(ititle);
	$('#re_inq_content').html(icont);
	$('#re_content').html(rcont);
})
</script>
</body>
</html>