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
<link rel="stylesheet" type="text/css" href=//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.accordion-body{
		background-color: rgb(231,241,255);
	}
	.contentfont{
		font-family: 'Jua', sans-serif;
	}
	#headArea{
		background-image: url('/kflix/resources/imgs/service/servicehead.jpg');
		height: 200px;
		background-size: 100% 200px;
		text-align: center;

	}
	#userFAQView{
		background-color: rgb(234,234,234);
	}
	#inqBtn, #titleArea{
		background-color: lightgray;
	}
	.titlefont {	
		font-family: 'Black Han Sans', sans-serif;
	}
	b{
		font-size: 20px;
	}
	
	#faqArea{
		width: 1200px;
		background-color: rgb(234,234,234);
	}
	
	#backhelp{
		color: red;
		text-decoration: none;
	}
</style>
</head>
<body>
<input id="helpData" type="hidden" value="${total }"/>
<input id="helpPage" type="hidden" value="${page }"/>

<section id="faqArea">


<div id="headArea">
	<h1 class="pt-5 titlefont">FAQ</h1>
</div>

<div id="userFAQView">

<div class="pt-3">
	<a href="/kflix/service" id="backhelp" class="contentfont">&lt;&lt; 고객센터 홈으로 돌아가기</a>
</div>
	<div class="d-flex justify-content-between py-4">
		<div class="px-2">
				<input type="radio" class="btn-check" name="help_type" id="all" autocomplete="off" value="all" onclick=" typeClick(this);" checked>
				<label class="btn btn-outline-secondary btn-sm contentfont" for="all">전체 보기</label>
			<c:forEach items="${category }" var="i" begin="0" end="${category.size()}" varStatus="status">
				<input type="radio" class="btn-check" name="help_type" id="${i }" autocomplete="off" value="${i }" onclick=" typeClick(this);">
				<label class="btn btn-outline-secondary btn-sm contentfont" for="${i }">${i }</label>
			</c:forEach>
		</div>
		
		<!-- 컨텐츠 개수 -->
		<div class="amount pe-2">
			<select class="form-select form-select-sm contentfont" id="helpAmount">
				<option value="5">5개 씩 보기</option>
				<option value="${amount }" selected>${amount }개 씩 보기</option>
				<option value="20">20개 씩 보기</option>
			</select>
		</div>
	</div>
	

	
	<!-- 아코디언 -->
	<div class="accordion accordion-flush" id="help_accordion">
	</div>
	
	<!-- 페이지 네이트 -->
	<div id="pagenate">
		<ul  class="pagination justify-content-center">	
		</ul>
	</div>
	
	<div class="d-flex justify-content-center border-top border-2 border-light py-3" id="inqBtn">
		<h3 class="titlefont">더 자세한 내용은 1:1로 문의하기가 가능합니다. &nbsp;&nbsp;&nbsp;</h3>
		<a href="/kflix/inquiry" class="btn btn-secondary contentfont">1:1 문의하기</a>
	</div>
	
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
$(document).ready(function() { 
	var len = $('#helpData').val();
	var pnum = $('#helpPage').val();
	var amount = $('#helpAmount').val();
	var type = 'GET';
	var url = '/kflix/FAQ/user';
	var data = '';
	ajax(type, url, data, pnum)
});


// 페이지
function pageClick(pnum) {
	var type = "POST";
	var url = "/kflix/FAQ/user";
	var data = JSON.stringify({
		help_type: $('input[name="help_type"]').val()
	});
	ajax(type, url, data, pnum);
}

// 타입 검색
function typeClick(clickData){
	var pnum = parseInt($('.active').text());
	var type = "POST";
	var url = "/kflix/FAQ/user";
	var data = JSON.stringify({
		help_type: clickData.value
	});
	ajax(type, url, data, pnum);	
}

// 개수 보기
$('#helpAmount').change(function(){
	var pnum = parseInt($('.active').text());
	var type = "POST";
	var url = "/kflix/FAQ/user";
	var data = JSON.stringify({
		help_type: $('input[name="help_type"]').val()
	});
	
	ajax(type, url, data, pnum);
})

function ajax(type, url, data, pnum) {
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
  					|| $('.active').text() == 0){
  				pnum = 1;
  				
  			} else if (anotherPnum > 0 && anotherPnum < pnum){
  				pnum = anotherPnum;
  			}
  			
  			console.log(pnum)
  			console.log(amount);
  			
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
	var table = $('#help_accordion');
	var first_li = (pnum - 1) * amount;
	var last_li = first_li + amount;

	table.html('');
	
	try{
		
		for	(var i = first_li; i < last_li; i++) {

			table.append(
					'<div class="accordion-item ps-3">'
					+'<h6 class="accordion-header contentfont" id="help-head' + i + '">'
					+'<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"' 
					+'data-bs-target="#playcoll-' + i + '" aria-expanded="false" aria-controls="playcoll-' + i + '">' 
					+'<b>' + data[i].help_type + '</b>&nbsp;&nbsp;&nbsp; '  + data[i].help_title + '</button></h6>'
					+'<div id="playcoll-' + i + '" class="accordion-collapse collapse"'
					+'aria-labelledby="play-head' + i + '" data-bs-parent="#help_accordion">'
					+'<div class="accordion-body"><div class="ps-4">'+ data[i].help_content + '</div></div>'
					+'</div></div>');		
		}
		
	} catch(err){}
};
</script>

</body>
</html>