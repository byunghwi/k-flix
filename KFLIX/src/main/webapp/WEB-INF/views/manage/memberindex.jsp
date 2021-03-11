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
<link rel="stylesheet" href="/kflix/resources/css/table/table.css?ver=9" />
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
		width: 300px;
	}
	thead>tr> th:nth-child(2){
		width: 100px;
	}
	thead>tr> th:nth-child(3){
		width: 50px;
	}
	thead>tr> th:nth-child(4){
		width: 50px;
	}
	thead>tr> th:nth-child(5){
		width: 100px;
	}
	thead>tr> th:nth-child(6){
		width: 250px;
	}
	thead>tr> th:nth-child(7){
		width: 150px;
	}	
	thead>tr> th:nth-child(8){
		width: 130px;
	}

	#sus_span{background-color: red; border-radius: 5px; padding: 5px; font-weight: bolder;}
	#sus_span:hover{cursor:pointer;}
	
	
	#re_span{background-color: blue; border-radius: 5px; padding: 5px; font-weight: bolder;}
	#re_span:hover{cursor:pointer;}
	
</style>
<title>회원관리</title>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">
</head>
<style>
	.wrapper {position:relative; min-height:100%;}
</style>
</head>
<body>
<div class="wrapper">
<%@include file="/WEB-INF/views/main/header_admin.jsp"%>
<%@include file="../manage/navbar.jsp"%>


<section id="table_list">
	<div class="d-flex justify-content-start pb-2" id="board">
		<h1><i class="far fa-user"></i> 회원</h1>
	</div>

	<div class="d-flex justify-content-between pb-2">
		<div class="d-flex justify-content-start">
			<form name="excelForm" id="excelForm" method="POST" action="/kflix/excelDownload">
				<input type="hidden" name="target" value="MEMBER"/>
				<input type="submit" id="excelDown" class="btn btn-secondary btn-sm ps-2" value="EXEL">
			</form>
		</div>
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
		<table id="mem_table" class="table talbe text-light text-center align-middle border-dark">
		<thead class="bg-dark">
			<tr>
				<th>이메일</th>
				<th>닉네임</th>
				<th>나이</th>
				<th>성별</th>
				<th>인증여부</th>
				<th>이용권</th>
				<th>정기결제여부</th>
				<th>가입일</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${mem }" var="i" varStatus="status">
			<tr>
				<td>${i.email }</td>
				<td>${i.nick }</td>
				<td>${i.member_age }</td>
				<td>${i.gender }</td>
				<td>${i.cert }</td>
				<td>${i.ticket_name }</td>
				<c:choose>
					<c:when test="${empty i.pay_sid || i.pay_sid eq null}">
						<td>N</td>
					</c:when>
					<c:otherwise>
						<td>Y</td>
					</c:otherwise>
				</c:choose>
				<td><fmt:formatDate value="${i.join_date }" pattern="yyyy-MM-dd"/></td>
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
	$('#member_').prepend('<span class="nav-clicked"></span>');
	makePageNate(${memTotal}, ${page}, ${amount});
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
		url: "/kflix/memberindex",
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
  			 
  			makeTable(data.mem, amount);
 
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
		url: "/kflix/memberindex",
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
  			 
 			makeTable(data.mem, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}



function makeTable(data, amount) {
	var table = $('#mem_table>tbody');
	
	$('#mem_table>tbody').html('');
	
	try{

		for	(var i = 0; i < amount; i++) {
			if(data[i].nick == null)
				data[i].nick = '';
			
			if(data[i].gender == null)
				data[i].gender = '';
			
			if(data[i].ticket_name == null)
				data[i].ticket_name = '';
			
			if(data[i].pay_sid == null){
				data[i].pay_sid = 'N';
			} else {
				data[i].pay_sid = 'Y';
			}
			
			table.append('<tr>'
					+'<td>' + data[i].email + '</td>'
					+'<td>' + data[i].nick + '</td>'
					+'<td>' + data[i].member_age + '</td>'
					+'<td>' + data[i].gender + '</td>'
					+'<td>' + data[i].cert + '</td>'
					+'<td>' + data[i].ticket_name + '</td>'
					+'<td>' + data[i].pay_sid + '</td>'
					+'<td>' + moment(data[i].join_date).format("YYYY-MM-DD") + '</td>'
					+'</tr>');
			
		}
		
	} catch(err){}
};
</script>
</body>
</html>
