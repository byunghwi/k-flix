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
<link rel="stylesheet" href="/kflix/resources/css/table/table.css?ver=5" />
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
	width: 50px;
	}
	thead>tr> th:nth-child(2){
		width: 150px;
	}
	thead>tr> th:nth-child(3){
		width: 250px;
	}
	thead>tr> th:nth-child(6){
		width: 150px;
	}
	thead>tr> th:nth-child(5){
		width: 130px;
	}
</style>
<title>문의 관리</title>
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


<input id="helpData" type="hidden" value="${total }"/>
<input id="helpPage" type="hidden" value="${page }"/>
<section id="table_list">
	
	<div class="d-flex justify-content-start pb-2" id="board">
		<h1><i class="far fa-envelope"></i> 1:1 문의</h1>
	</div>

	<div class="d-flex justify-content-end pb-2">
		<!-- 컨텐츠 개수 -->
		<div class="amount">
			<select class="form-select form-select-sm" id="helpAmount">
				<option value="5">5개 씩 보기</option>
				<option value="${amount }" selected>${amount }개 씩 보기</option>
				<option value="20">20개 씩 보기</option>
			</select>
		</div>
		
		<!-- 검색 영역 -->
		<div id="searchArea" class="px-2">
		  <select class="form-select form-select-sm" id="searchType" required>
		  	<option value="all">모든 카테고리</option>
			<c:forEach items="${category }" var="i" begin="0" end="${category.size()}" varStatus="status">
				 <option>${i }</option>
			</c:forEach>
		  </select>
		</div>
		
		<!-- 답변 미답변 -->
		<div>
		 <select class="form-select form-select-sm" id="isreply" required>
		  	<option value="all">전체보기</option>
			 <option>미답변</option>
			 <option>답변</option>
		  </select>
		</div>
	</div>

	<!-- 테이블 영역 -->
	<div id="table_main">
		
		<table id="inqTable" class="table talbe text-light text-center align-middle border-dark">
		<thead class="bg-dark">
			<tr>
				<th>#</th>
				<th>카테고리</th>
				<th>회원 이메일</th>
				<th>제목</th>
				<th>접수일</th>
				<th>답변일자</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${inq }" var="inq" varStatus="status">
			<tr>
				<td>${inq.inquiry_id }</td>
				<td>${inq.inquiry_type }</td>
				<td>${inq.email }</td>
				<td>${inq.inquiry_title }</td>
				<td><fmt:formatDate value="${inq.inquiry_date }" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:choose>
						<c:when test="${empty inq.reply_date}">
							<button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#replyModal"
								data-replyid="${inq.inquiry_id }" data-inqcont="${inq.inquiry_content }" data-replycont="${inq.reply_content }"
								data-memail="${inq.email }">답변하기</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#detailModal"
								data-type="${inq.inquiry_type }" data-rcont="${inq.reply_content }" data-rtitle="${inq.inquiry_title }" data-icont="${inq.inquiry_content }">
								<fmt:formatDate value="${inq.reply_date }" pattern="yyyy-MM-dd"/>
							</button>
						</c:otherwise>
					</c:choose>
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
	
</section>

<%@ include file="/resources/include/movie/alertModal.jsp" %>
<%@include file="/WEB-INF/views/main/footer.jsp"%>
</div>
<div class="modal" tabindex="-1" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-dark">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <input type="hidden" id="memail"/>
      <input type="hidden" id="reply_id"/>
       	<div class="mb-3">
		  <h6>관리자 이메일</h6>
		  <input type="text" class="form-control" id="manager_email" value="belfort91919@gmail.com" required readonly>
		</div>

		<div class="mb-3">
		  <h6>문의 내용</h6>
		  <textarea class="form-control" id="reply_inq_content" rows="7" style="resize: none;" required readonly></textarea>
		</div>
				
		<div class="mb-3">
		  <h6>제목</h6>
		  <input type="text" class="form-control" id="reply_title" value="[KFLIX] 문의 주신 내용에 대한 답변입니다." required>
		</div>
		
		<div class="mb-3">
		  <h6>답변 &nbsp;&nbsp;<span id="contentTip">"/" 로 개행</span></h6>
		  <textarea class="form-control" id="reply_content" rows="7" style="resize: none;" required></textarea>
		</div>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="replyBtn">답변</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="cancleBtn">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="loading_modal">
  <div class="modal-dialog">
    <div class="modal-content bg-dark">
      <div class="modal-header border-secondary">
      	<img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
      </div>
      
      <div class="modal-body text-light fs-5" id="alertBody">
	     <div class="fa-5x"><i class="fas fa-spinner fa-spin"></i></div><span>메일 보내는 중...</span>
	  </div>       
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="detailModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-dark">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<div class="mb-3">
		  <h6>카테고리</h6>
		  <input type="text" class="form-control" id="detail_type" required readonly>
		</div>
		
		<div class="mb-3">
		  <h6>제목</h6>
		  <input type="text" class="form-control" id="detail_title" required readonly>
		</div>
		
		<div class="mb-3">
		  <h6>문의주신내용</h6>
		  <textarea class="form-control" id="detail_inq_content" rows="7" style="resize: none;" required readonly></textarea>
		</div>
		
		<div class="mb-3">
		  <h6>답변</h6>
		  <textarea class="form-control" id="detail_content" rows="7" style="resize: none;" required readonly></textarea>
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
$(document).ajaxStart(function(){
	$('#replyModal').modal("hide");
	$('#loading_modal').modal({backdrop: 'static', keyboard: false});
	$('#loading_modal').modal("show");
})

$(document).ajaxStop(function(){
	$('#loading_modal').modal("hide");
})
//로딩시 페이징
$(document).ready(function() { 
	var len = $('#helpData').val();
	var pnum = $('#helpPage').val();
	var amount = $('#helpAmount').val();
	$('#inq').prepend('<span class="nav-clicked"></span>');
	makePageNate(len, pnum, amount);
});

// alert
var infomodal = function() {$('#infoconfrim').modal("show")}

function infoMsg(msg){
	$('#alertMsg').html(msg);
	infomodal();
}

// 상세보기 모달
var detailModal = document.getElementById('detailModal')
detailModal.addEventListener('show.bs.modal', function (event) {
	type = $(event.relatedTarget).data('type');
	rtitle = $(event.relatedTarget).data('rtitle');
	rcont = $(event.relatedTarget).data('rcont');
	icont = $(event.relatedTarget).data('icont');
	
	$('#detail_type').val(type);
	$('#detail_title').val(rtitle);
	$('#detail_inq_content').val(icont);
	$('#detail_content').html(rcont.replaceAll('/', ''));
})

// 답변 모달
var memail = '';
var replyid = '';
var replyModal = document.getElementById('replyModal')
replyModal.addEventListener('show.bs.modal', function (event) {
	replyid = $(event.relatedTarget).data('replyid');
	memail = $(event.relatedTarget).data('memail');
	replycont = $(event.relatedTarget).data('replycont');
	inqcont = $(event.relatedTarget).data('inqcont');
	
	$('#reply_inq_content').val(inqcont);
	$('#reply_content').val(replycont)
})


// 답변 모달 버튼
$('#replyBtn').click(function(){
	var type = "PATCH";
	var url = "/kflix/inquiry/reply";
	var data = JSON.stringify({
		inquiry_id: replyid,
		email: memail,
		manager_email: $('#manager_email').val(),
		inquiry_content: $('#reply_inq_content').val(),
		reply_title: $('#reply_title').val(),
		reply_content: $('#reply_content').val()
	});
	
	$.ajax({
		type: type,
		url: url,
		data: data,
		contentType: 'application/json',
 		success: function(data){
  			var len = data.length;
  			var amount =  parseInt($('#helpAmount').val())
	
  			var anotherPnum = Math.ceil(len / amount);
  			if ($('.active').text() == '' 
  					|| $('.active').text() == 0
  					|| $('.active').text() != 'number'){
  				pnum = 1;
  				
  			} else if (anotherPnum > 0 && anotherPnum < pnum){
  				pnum = anotherPnum;
  			}
  			  			
 			makePageNate(len, pnum, amount);
  			 
 			makeTable(data, pnum, amount);
 			
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		},
   		complete: function(){
   			$('#replyModal').modal('hide');
   		}
	}) 
})


// 답변 미답변
$('#isreply').change(function(){
	console.log("답변미답변")
	var type = "POST";
	var url = "/kflix/inquiry/index";
	var data = JSON.stringify({
		inquiry_type: $('#searchType').val(),
		reply_status: $('#isreply').val()
	});
	
	ajax(type, url, data, parseInt($('.active').text()));
})

// 검색
$('#searchType').change(function(){
	console.log("카테고리 검색")
	var type = "POST";
	var url = "/kflix/inquiry/index";
	var data = JSON.stringify({
		inquiry_type: $('#searchType').val(),
		reply_status: $('#isreply').val()
	});
	
	ajax(type, url, data, parseInt($('.active').text()));
})

// 개수보기 
$('#helpAmount').change(function(){
	var type = "POST";
	var url = "/kflix/inquiry/index";
	var data = JSON.stringify({
		inquiry_type: $('#searchType').val(),
		reply_status: $('#isreply').val()
	});
	
	ajax(type, url, data, 1);
})

// 페이지
function pageClick(pnum) {
	console.log("페이지누르기")
	$.ajax({
		type: "POST",
		url: "/kflix/inquiry/index",
		data: JSON.stringify({
			inquiry_type: $('#searchType').val(),
			reply_status: $('#isreply').val()
		}),
		contentType: 'application/json',
		global: false,
 		success: function(data){
  			var len = data.length;
  			var amount =  parseInt($('#helpAmount').val())
  			
  			amount = parseInt(amount);
  			
  			
 			makePageNate(len, pnum, amount);
  			 
  			makeTable(data, pnum, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}

function ajax(type, url, data, pnum) {
	$.ajax({
		type: type,
		url: url,
		data: data,
		global: false,
		contentType: 'application/json',
 		success: function(data){
  			var len = data.length;
  			var amount =  parseInt($('#helpAmount').val())
	
  			var anotherPnum = Math.ceil(len / amount);
  			if ($('.active').text() == '' 
  					|| $('.active').text() == 0
  					|| $('.active').text() != 'number'
  					|| $('.active').text() == null){
  				pnum = 1;
  				
  			} else if (anotherPnum > 0 && anotherPnum < pnum){
  				pnum = anotherPnum;
  			}

  			
 			makePageNate(len, pnum, amount);
  			 
 			makeTable(data, pnum, amount);
 			
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		},
   		complete: function(){
   			$('#replyModal').modal('hide');
   		}
	}) 
}

function makeTable(data, pnum, amount) {
	var table = $('#inqTable>tbody');
	
	$('#inqTable>tbody').html('');
	
	
	var first_li = (pnum - 1) * amount;
	var last_li = first_li + amount;

	
	try{

		for	(var i = first_li; i < last_li; i++) {
			var make = '';
			if (data[i].reply_date == null) {
				make = '<button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#replyModal"'
						+'data-replyid="' + data[i].inquiry_id + '" data-inqcont="' + data[i].inquiry_content + '"' + 'data-replycont="' + data[i].reply_content + '"'
						+'data-memail="' + data[i].email + '">답변하기</button>'
	
			} else {
				make = '<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#detailModal"'
						+'data-type="' + data[i].inquiry_type + '" data-rcont="' + data[i].reply_content + '" data-rtitle="' + data[i].inquiry_title + '" '
						+'data-icont="' + data[i].inquiry_content + '">'
						+moment(data[i].reply_date).format("YYYY-MM-DD") + '</button>'
			}
			
			table.append('<tr>'
					+'<td>' + data[i].inquiry_id + '</td>'
					+'<td>' + data[i].inquiry_type + '</td>'
					+'<td>' + data[i].email + '</td>'
					+'<td>' + data[i].inquiry_title + '</td>'
					+'<td>' + moment(data[i].inquiry_date).format("YYYY-MM-DD") + '</td>'
					+'<td>' + make
					+'</td></tr>');
			
		}
		
	} catch(err){}
};
</script>
</body>
</html>