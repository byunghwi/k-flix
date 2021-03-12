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
<link rel="stylesheet" href="/kflix/resources/css/table/table.css?ver=4" />
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css?ver=1" />
<style>
thead>tr> th:nth-child(1){
	width: 50px;
}
thead>tr> th:nth-child(2){
	width: 150px;
}
thead>tr> th:nth-child(5){
	width: 200px;
}
thead>tr> th:nth-child(4){
	width: 150px;
}
#infoconfrim{
	z-index: 9999;
}
</style>
<meta charset="UTF-8">
<title>FAQ 관리</title>
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
<!-- 본체 영역 -->
<div class="container" id="board">
	<div class="d-flex justify-content-between pb-2">
		<div>
			<h1><i class="far fa-question-circle"></i> FAQ</h1>
		</div>
		
		<div class="mt-3">
			<a href="./deletedindex" type="button" class="btn btn-outline-secondary btn-sm">비활성 목록</a>
		</div>
	</div>
	
	<div class="d-flex justify-content-between">
		<!-- 추가 버튼 영역 -->
		<div id="addArea" class="ps-2 pb-2">
			<button id="addBtn" class="btn btn-success btn-sm" data-bs-toggle="modal" 
					data-bs-target="#processModal" data-bs-whatever="add">+ 추가</button>
		</div>
	
		<div class="d-flex justify-content-end">
			<div class="px-2">
				<input id="helpData" type="hidden" value="${total }"/>
					<input id="helpPage" type="hidden" value="${page }"/>
					<select id="helpAmount" class="form-select form-select-sm" onchange="amountChange();">
						<option value="5">5개 씩 보기</option>
						<option value="${amount }" selected>${amount }개 씩 보기</option>
						<option value="20">20개 씩 보기</option>
					</select>
			</div>	
				
			<!-- 검색 영역 -->
			<div id="searchArea" class="pe-2">
				<select name="searching_word" class="form-select form-select-sm" id="searchType" onchange="searchChange();">
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
			
			<div class="ps-2">
				<button class="btn btn-outline-secondary btn-sm" onclick="allView(1);">ALL</button>
			</div>
		</div>
	</div>
	
	<!-- 테이블 영역 -->
	<div id="table_main">
		
		<table id="helpTable" class="table talbe text-light text-center align-middle border-dark">
		<thead class="bg-dark">
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
					<button id="" class="btn btn-outline-primary" data-bs-toggle="modal" 
						data-bs-target="#processModal" data-bs-whatever="update"
						data-id="${help.help_id }" data-type="${help.help_type }" 
						data-title="${help.help_title }" data-content="${help.help_content }">수정</button>
					<button id="" class="btn btn-outline-danger" data-bs-toggle="modal" 
						data-helpid="${help.help_id }" data-bs-target="#deleteModal">비활성화</button>
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
</section>
<%@include file="/WEB-INF/views/main/footer.jsp"%>
</div>
<!-- 정보모달 -->
<div class="modal" tabindex="100" id="infoconfrim">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-dark">
      	<img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body" id="alertBody">
	     <h4 id="alertMsg"></h4>
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>

<!-- 기능 모달 -->
<div class="modal fade" id="processModal" tabindex="-1" aria-labelledby="processModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-dark">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="process-body">
        <form>
        	<input type="hidden" id="hid" />
          <div class="mb-3">
          	<label for="htype" class="col-form-label">카테고리</label>
	        <select class="form-select" name="help_type" id="htype" required>
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
          <div class="mb-3">
            <label for="htitle" class="col-form-label">제목</label>
            <input type="text" class="form-control" name="help_title" id="htitle" required>
          </div>
          <div class="mb-3">
            <label for="hcontent" class="col-form-label">내용</label>
            <textarea class="form-control" name="help_content" id="hcontent" rows="10"  style="resize: none;" required></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" id="processBtn" onclick="modalBtn();"></button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 삭제모달 -->
<div class="modal" tabindex="-1" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content bg-dark">
      <div class="modal-header border-seconadry">
      	<img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body text-center fs-5 text-light" id="deleteBody">
	  </div>     
	   
      <div class="modal-footer border-top-0">
       	<button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="deleteModalBtn();">확인</button>
       	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
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
<script src="/kflix/resources/js/movie/pagenate.js?ver=10"></script>
<script>
//로딩시 페이지 네이트
$(document).ready(function() { 
	var len = $('#helpData').val();
	var pnum = $('#helpPage').val();
	var amount = $('#helpAmount').val();
	$('#FAQ').prepend('<span class="nav-clicked"></span>');
	makePageNate(len, pnum, amount);
});

function allView(pnum) {
	$('#helpAmount').val(10)
	$('#searchType').val('all')
	
	$.ajax({
		type: "POST",
		url: "/kflix/FQARest/index",
		data: JSON.stringify({
			searching_word: 'all'
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

//페이지보기
function amountChange() {
	$.ajax({
		type: "POST",
		url: "/kflix/FQARest/index",
		data: JSON.stringify({
			searching_word: $('#searchType').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			var len = data.length;
  			var amount =  parseInt($('#helpAmount').val())
  			var pnum = 1;
  			amount = parseInt(amount);
  			
 			makePageNate(len, pnum, amount);
  			 
  			makeTable(data, pnum, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}

// 검색
function searchChange() {
	ajaxCon(parseInt($('.active').text()), $('#helpAmount').val());
}

// 페이지넘버 클릭
function pageClick(pnum) {
	
	$.ajax({
		type: "POST",
		url: "/kflix/FQARest/index",
		data: JSON.stringify({
			searching_word: $('#searchType').val()
		}),
		contentType: 'application/json',
		
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

//alert 모달
var infomodal = function() {$('#infoconfrim').modal("show")}

function infoMsg(msg){
	$('#alertMsg').html(msg);
	infomodal();
}

//삭제모달
var deleteModal = document.getElementById('deleteModal')
deleteModal.addEventListener('show.bs.modal', function (event) {
	helpid = $(event.relatedTarget).data('helpid');
	
	$('#deleteBody').html('');
	$('#deleteBody').append("<h3>" + helpid + "번을 비활성화합니다.</h3>")
	
})

// 기능 모달
var processModal = document.getElementById('processModal')
processModal.addEventListener('show.bs.modal', function (event) {
  var button = event.relatedTarget
  var recipient = button.getAttribute('data-bs-whatever')  
  var data = '';

  if(recipient == 'add') {
	  $('#htype').val('');
	  $('#htitle').val('');
	  $('#hcontent').val('');
	  $('#hid').val('');
	  $('#processBtn').html('추가');
	  
  } else if(recipient == 'update'){
	  var id = $(event.relatedTarget).data('id')
	  var title = $(event.relatedTarget).data('title')
	  var type =  $(event.relatedTarget).data('type')
	  var content = $(event.relatedTarget).data('content')
	  	  
	  $('#htype').val(type);
	  $('#htitle').val(title);
	  $('#hcontent').val(content);
	  $('#hid').val(id);
	  $('#processBtn').html('수정');  
  }
  
})

// 추가,수정 ajax
function modalBtn() {
		var btnVal = $('#processBtn').html();
		var url = '';
		var type = '';
		var processMsg = '';
		var data = {
				  help_id:  $('#hid').val(),
				  help_title:  $('#htitle').val(),
				  help_type:  $('#htype').val(),
				  help_content:  $('#hcontent').val(),
				  searching_word: $('#searchType').val()
		} 
			
		if(data.help_type == null){			
			infoMsg("카테고리를 설정 해주세요");
			return;
			
		} else if(data.help_title == ''){
			infoMsg("제목을 채워주세요");
			return;
			
		} else if (data.help_content == ''){
			infoMsg("내용을 채워주세요");
			return;		
		} 
		
		if (btnVal == '추가'){
			type = "POST"
			url = "/kflix/FQARest/add"
			processMsg = $('#htitle').val() + " (이)가 추가 되었습니다."
			
		} else if (btnVal == '수정') {
			type = "PATCH"
			url = "/kflix/FQARest/update"
			processMsg = $('#hid').val() + " 번이 수정 되었습니다."
		}

 		$.ajax({
			type: type,
			url: url,
			data: JSON.stringify(data),
			contentType: 'application/json',
			
	 		success: function(data){
	  			var len = data.length;
	  			var amount =  parseInt($('#helpAmount').val())
	  			var pnum = $('.active').text();
	  			
	  			var anotherPnum = Math.ceil(len / amount);
	  			if ($('.active').text() == '' 
	  					|| $('.active').text() == 0
	  					|| $('.active').text() == null){
	  				pnum = 1;
	  				
	  			} else if (anotherPnum > 0 && anotherPnum < pnum){
	  				pnum = anotherPnum;
	  			}
	  			
	  			try{
	  				pnum = parseInt(pnum)
	  				console.log('try임')
	  			}catch {
	  				console.log('에러임')
	  				pnum = 1;
	  			}
	  			
	 			makePageNate(len, pnum, amount);
	  			 
	  			makeTable(data, pnum, amount);
	  			
	  			$('#processModal').modal("hide");
	  			infoMsg(processMsg);
	   		},
	   		error: function(){
	   			infoMsg('불러오는데 실패하였습니다.');
	   		}
		}) 

}

// 삭제 ajax 
function deleteModalBtn() {
	$.ajax({
		type: "PATCH",
		url: "/kflix/FQARest/delete",
		data: JSON.stringify({
			help_id: helpid,
			searching_word: $('#searchType').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			var len = data.length;
  			var amount =  parseInt($('#helpAmount').val())
  			var pnum = $('.active').text();
  			
  			var anotherPnum = Math.ceil(len / amount);
  			if ($('.active').text() == '' 
  					|| $('.active').text() == 0
  					|| $('.active').text() == null){
  				pnum = 1;
  				
  			} else if (anotherPnum > 0 && anotherPnum < pnum){
  				pnum = anotherPnum;
  			}
  			
  			try{
  				pnum = parseInt(pnum)
  				console.log('try임')
  			}catch {
  				console.log('에러임')
  				pnum = 1;
  			}
  			amount = parseInt(amount);
  			
 			makePageNate(len, pnum, amount);
  			 
  			makeTable(data, pnum, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}


// ajax 기본컨트롤
function ajaxCon(pnum, amount){
	
	$.ajax({
		type: "POST",
		url: "/kflix/FQARest/index",
		data: JSON.stringify({
			searching_word: $('#searchType').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			var len = data.length;
  			var anotherPnum = Math.ceil(len / amount);
  			var pnum = $('.active').text();
  			
  			var anotherPnum = Math.ceil(len / amount);
  			if ($('.active').text() == '' 
  					|| $('.active').text() == 0
  					|| $('.active').text() == null){
  				pnum = 1;
  				
  			} else if (anotherPnum > 0 && anotherPnum < pnum){
  				pnum = anotherPnum;
  			}
  			
  			try{
  				pnum = parseInt(pnum)
  				console.log('try임')
  			}catch {
  				console.log('에러임')
  				pnum = 1;
  			}
  			
  			amount = parseInt(amount);
  			
 			makePageNate(len, pnum, amount);
  			 
  			makeTable(data, pnum, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}

//테이블만들기
function makeTable(data, pnum, amount) {
	var table = $('#helpTable>tbody');
	
	$('#helpTable>tbody').html('');
	console.log(pnum)
	console.log(amount);
	
	var first_li = (pnum - 1) * amount;
	var last_li = first_li + amount;

	try{
		for	(var i = first_li; i < last_li; i++) {
			table.append(
					'<tr>'
					+'<td>' + data[i].help_id + '</td>'
					+'<td>' + data[i].help_type + '</td>'
					+'<td>' + data[i].help_title + '</td>'
					+'<td>' + moment(data[i].help_date).format("YYYY-MM-DD") + '</td>'
					+'<td>'
					+'<button id="" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#processModal" data-bs-whatever="update"'
					+'data-id="' + data[i].help_id + '" data-type="' + data[i].help_type + '" '
					+'data-title="' + data[i].help_title + '" data-content="' + data[i].help_content + '">수정</button> '
					+'<button id="" class="btn btn-outline-danger" data-bs-toggle="modal" data-helpid="' + data[i].help_id + '" data-bs-target="#deleteModal">비활성화</button>'
					+'</td>'
					+'</tr>'
			);
		}
		
	} catch(err){
		console.log("마지막 데이터 입니다.")
	}
};


</script>
</body>
</html>