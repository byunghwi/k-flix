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
<link rel="stylesheet" href="/kflix/resources/css/table/table.css?ver=7" />
<meta charset="UTF-8">
<style>
	#contentTip{
		color: gray;
		font-size: 12px;
	}
	.amount {
		width: 150px;
	}
	tbody>tr {
		height: 55px;
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
	
	#tk_table>tbody>tr>td:nth-child(4){
		color: white;
		font-weight: bolder;
	}
	
	#tk_table>tbody>tr>td:nth-child(4)>span{
		border: 2px solid;
		border-radius: 5px;
		padding: 10px;
		border-color: #2929fa;
		background-color: #2929fa;
	}
	
	#tk_table>tbody>tr>td:nth-child(4)>span:hover{
		cursor:pointer;
	}
	
	#tk_table>tbody>tr>td:nth-child(2){
		color: #7575ff;
		font-weight: bolder;
	}
	
	
	#tk_table>tbody>tr>td:nth-child(2)>span{
		border: 1px #7575ff solid;
		border-radius: 5px;
		padding: 10px;
	}
	
	#tk_table>tbody>tr>td:nth-child(2)>span:hover{
		cursor: pointer;
		background-color: #7575ff;
		color: white;
	}
	.modal_content{
		padding-left: 50px;
		padding-bottom: 10px;
		user-select:none;
	}
</style>
<title>이용권 관리</title>
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
		<h1><i class="fas fa-ticket-alt"></i> 이용권</h1>
	</div>

	<div class="d-flex justify-content-between pb-2">
		<div>
			<button class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#ticket_add" id="addBtn">+ 추가</button>
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
			<c:forEach items="${ticket }" begin="0" end="${ticket.size() }" var="i" varStatus="status">
			<tr>
				<td>${i.ticket_id }</td>
				<td><span onclick="getTicketId(${i.ticket_id }, '${i.ticket_name}', ${i.ticket_period }, ${i.ticket_price });">${i.ticket_name }</span></td>
				<td>${i.ticket_price }</td>
				<td><span onclick="stat(this, ${i.ticket_id})">${i.ticket_status }</span></td>
				<c:choose>
					<c:when test="${empty i.ticket_recommend  || i.ticket_recommend eq 'N'}">
						<td onclick="recommend(this, ${i.ticket_id});"><button class="btn btn-outline-danger" ><i class="far fa-thumbs-down"></i></button></td>
					</c:when>
					<c:otherwise>
						<td onclick="norecommend(this, ${i.ticket_id});"><button class="btn btn-danger"><i class="fas fa-thumbs-up"></i></button></td>
					</c:otherwise>
				</c:choose>
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

<div class="modal" tabindex="-1" id='ticket_update'>
  <div class="modal-dialog">
    <div class="modal-content bg-dark">
      <div class="modal-header">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-light">
        <div class="modal_content">
	        <span>이용권 번호&nbsp;:&nbsp; </span>
	        <input type="number" id="update_ticket_id" value="" required/>
        </div>
        
        <div class="modal_content">
	        <span>이용권 이름&nbsp;:&nbsp; </span>
	        <input type="text" id="update_ticket_name" required/>
        </div>
        
        <div class="modal_content">
	        <span>이용권 기간&nbsp;:&nbsp; </span>
	        <input type="text" id="update_ticket_period" required/>
        </div>
        
        <div class="modal_content">
	        <span>이용권 가격&nbsp;:&nbsp; </span>
	        <input type="text" id="update_ticket_price" required/>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="ticketUpdate();">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id='ticket_add'>
  <div class="modal-dialog">
    <div class="modal-content bg-dark">
      <div class="modal-header">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-light">
        <div class="modal_content">
	        <span>이용권 번호&nbsp;:&nbsp; </span>
	        <input type="number" name="ticket_id" id="add_ticket_id" readonly required/>
        </div>
        
        <div class="modal_content">
	        <span>이용권 이름&nbsp;:&nbsp; </span>
	        <input type="text" name="ticket_name" id="add_ticket_name" required/>
        </div>
        
        <div class="modal_content">
	        <span>이용권 기간&nbsp;:&nbsp; </span>
	        <input type="text" name="ticket_period" id="add_ticket_period" required/>
        </div>
        
        <div class="modal_content">
	        <span>이용권 가격&nbsp;:&nbsp; </span>
	        <input type="text" name="ticket_price" id="add_ticket_price" required/>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="ticketAdd();">추가</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
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
function stat(st, id){
	var status = $(st);
	console.log(status.html())
	console.log(id)
	if (status.html() == 'Y'){
		status.html('N');
		status.css('border-color', 'red')
		status.css('background-color', 'red')

	} else if (status.html() == 'N'){
		status.html('Y');
		status.css('border-color', '#2929fa')
		status.css('background-color', '#2929fa')
	}
	
	var delete_data = {
			ticket_id: id,
			ticket_status: status.html()
	}
	
	$.ajax({
		type: "PATCH",
		url: "/kflix/changeTicketStatus",
		data: JSON.stringify(delete_data),
		contentType: 'application/json',
		success: function(data){console.log(data)},
		error: function(){infoMsg('불러오기 실패!')},
		complete: function(){$('#ticket_update').modal('hide');}
	})
	
}

function getTicketId(id, name, period, price) {
	$('#update_ticket_id').val(id)
	$('#update_ticket_name').val(name)
	$('#update_ticket_period').val(period)
	$('#update_ticket_price').val(price)

	$('#ticket_update').modal('show');

}

function ticketUpdate() {
	var ticket_data = {
			ticket_id: $('#update_ticket_id').val(),
			ticket_name: $('#update_ticket_name').val(),
			ticket_period: $('#update_ticket_period').val(),
			ticket_price: $('#update_ticket_price').val()
	}

	
	$.ajax({
		type: "PATCH",
		url: "/kflix/updateTicket",
		data: JSON.stringify(ticket_data),
		contentType: 'application/json',
		success: function(data){
 			var len = data.len
 			var pnum = 1
 			var amount = parseInt($('#helpAmount').val())
  			
 			makePageNate(len, pnum, amount);
  			location.reload();
		},
		error: function(){infoMsg('불러오기 실패!')},
		complete: function(){$('#ticket_update').modal('hide');}
	})
	
}


function ticketAdd() {
	var ticket_data = {
			ticket_id: $('#add_ticket_id').val(),
			ticket_name: $('#add_ticket_name').val(),
			ticket_period: $('#add_ticket_period').val(),
			ticket_price: $('#add_ticket_price').val()
	}
	
	$.ajax({
		type: "PATCH",
		url: "/kflix/addTicket",
		data: JSON.stringify(ticket_data),
		contentType: 'application/json',
		success: function(data){
 			var len = data.len
 			var pnum = 1
 			var amount = parseInt($('#helpAmount').val())

   			var table = $('#tk_table>tbody');
 			data.tk.ticket_recommend = '<td onclick="norecommend(this, ' + data.tk.ticket_id + ');"><button class="btn btn-danger"><i class="fas fa-thumbs-up"></i></button></td>'
		
			table.prepend('<tr>'
					+'<td>' + data.tk.ticket_id + '</td>'
					+'<td><span onclick="getTicketId(' + data.tk.ticket_id + ', \'' + data.tk.ticket_name + '\', ' + data.tk.ticket_period + ', ' + data.tk.ticket_price + ');">' + data.tk.ticket_name + '</span></td>'
					+'<td>' + data.tk.ticket_price + '</td>'
					+'<td><span onclick="stat(this, ' + data.tk.ticket_id + ')">' + data.tk.ticket_status + '</span></td>'
					+ data.tk.ticket_recommend +
					+'</tr>');
 	
 			makePageNate(len, pnum, amount);
		},
		error: function(){infoMsg('불러오기 실패!')},
		complete: function(){$('#ticket_add').modal('hide');}
	})
}



$('#addBtn').click(function(){
	var lastId = parseInt($('#tk_table>tbody>tr:first-child>td').html()) + 1;
	console.log(lastId)
	$('#add_ticket_id').val(lastId);
})

var recomend = ''; 
function recommend(obj, ticketId) {
	var id = ticketId;
	recomend = $(obj);
	recomend.html('<button class="btn btn-danger"><i class="fas fa-thumbs-up"></i></button>')
	recomend.removeAttr("onclick")
	recomend.attr("onclick", "norecommend(this, "+id+");");
	
	var input_data = {
		ticket_id: ticketId,
		ticket_recommend: "Y"
	}
	recommendChange(input_data)
}

function norecommend(obj, ticketId) {
	var id = ticketId;
	recomend = $(obj);
	recomend.html('<button class="btn btn-outline-danger"><i class="far fa-thumbs-down"></i></button>')
	recomend.removeAttr("onclick")
	recomend.attr("onclick", "recommend(this, "+id+");");
	
	var input_data = {
			ticket_id: ticketId,
			ticket_recommend: "N"
	}
	recommendChange(input_data)
}


function recommendChange(input_data) {
	$.ajax({
		type: "PATCH",
		url: "/kflix/changeTicketReco",
		data: JSON.stringify(input_data),
		contentType: 'application/json',
		success: function(result){console.log(result + ' DB, 게시판 새로고침 확인')},
		error: function(request){
			infoMsg(request)	
		}
	})
}

//로딩시 페이징
$(document).ready(function() {
	$('#ticket_').prepend('<span class="nav-clicked"></span>');
	makePageNate(${total}, ${page}, ${amount});
	
	for(var i = 0; i < ${total}; i++){
		var status = $('#tk_table>tbody>tr:nth-child('+(i+1)+')>td:nth-child(4)>span');
		if (status.html() == 'N'){
			// status.attr('style', 'background-color: red; border-color: red;')
			status.css('background-color', 'red');
			status.css('border-color', 'red');
		} else if (status.html() == 'Y'){
			status.attr('style', 'border-color: #2929fa; background-color: #2929fa;')
		}
	}
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
			
			if (data[i].ticket_recommend == null || data[i].ticket_recommend == 'N'){
				data[i].ticket_recommend = '<td onclick="recommend(this, ' + data[i].ticket_id + ');"><button class="btn btn-outline-danger" ><i class="far fa-thumbs-down"></i></button></td>'			
			} else {
				data[i].ticket_recommend = '<td onclick="norecommend(this, ' + data[i].ticket_id + ');"><button class="btn btn-danger"><i class="fas fa-thumbs-up"></i></button></td>'
			}
			
			if(data[i].ticket_status == null || data[i].ticket_status == 'N') {
				data[i].ticket_status = '<td><span onclick="stat(this, ' + data[i].ticket_id + ')" style="background-color: red; border-color: red;">' + data[i].ticket_status + '</span></td>'
			} else {
				data[i].ticket_status = '<td><span onclick="stat(this, ' + data[i].ticket_id + ')" style="background-color: #2929fa; border-color: #2929fa;">' + data[i].ticket_status + '</span></td>'
			}
			
			
			table.append('<tr>'
					+'<td>' + data[i].ticket_id + '</td>'
					+'<td><span onclick="getTicketId(' + data[i].ticket_id + ', \'' + data[i].ticket_name + '\', ' + data[i].ticket_period + ', ' + data[i].ticket_price + ');">' + data[i].ticket_name + '</span></td>'
					+'<td>' + data[i].ticket_price + '</td>'
					+ data[i].ticket_status 
					+ data[i].ticket_recommend 
					+'</tr>');
			
		}
		
	} catch(err){}
};
</script>
</body>
</html>
