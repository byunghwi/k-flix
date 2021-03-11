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
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">
<style>
	*{
		font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	}
	body{
		background-color: rgb(20,20,20);
		
	}
	.accordion-button:focus {
    	outline: none;
    	border: none;
    	box-shadow: 0 0 0 0;
	}
	#headArea{
		font-size: 40px;
		letter-spacing: 0.2rem;	
		text-align: center;

	}
	#userFAQView{
		color: white;
	}
	
	#faqArea{
		width: 1200px;
		margin-left: calc(50% - 600px);
		padding-top: 55px;
		padding-bottom: 100px;
		color: white;
	}
	
	#backhelp{
		color: white;
		text-decoration: none;
	}
	
	.bg-kflix{
		background-color: rgb(20,20,20)!important; 
	}
	
	.accordion-button::after {
		background-image: url(/kflix/resources/imgs/service/down-arrow-white.png)!important;
	}

	#faqArea b{
		width:150px;
		text-align: center;
		font-size: 20px;
	}
	.helpcontent{
		padding-left: 17%;
		color: gray;
	}
	.wrapper {

	position:relative;

    min-height:100%;

	}
</style>
</head>
<body>

<div class="wrapper">

<%@include file="/WEB-INF/views/main/header.jsp"%>

<input id="helpData" type="hidden" value="${total }"/>
<input id="helpPage" type="hidden" value="${page }"/>

<section id="faqArea" class="netflix-sans-font-loaded">

	<div id="headArea">
		<h1 class="pt-5 titlefont">F.A.Q</h1>
	</div>
	
	<div>
		<a href="/kflix/service" id="backhelp" class="contentfont">&lt;&lt; 고객센터 홈으로 돌아가기</a>
	</div>
	<div class="d-flex justify-content-between py-2">
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
	
<div id="userFAQView" class="">

	<!-- 아코디언 -->
	<div class="accordion accordion-flush" id="help_accordion">
	  <c:forEach items="${help }" var="i" begin="0" end="${help.size()}" varStatus="status">
	  <div class="accordion-item ps-3">
		    <h6 class="accordion-header contentfont" id="play-head-${status.index}">
		      <button class="accordion-button text-light bg-kflix collapsed" type="button" data-bs-toggle="collapse" 
		      		data-bs-target="#playcoll-${status.index}" aria-expanded="false" aria-controls="playcoll-${status.index}">
		        <b> ${i.help_type }</b>&nbsp;&nbsp;&nbsp; ${i.help_title }
		      </button>
		    </h6>
		    <div id="playcoll-${status.index}" class="accordion-collapse collapse" 
		    	aria-labelledby="play-head-${status.index}" data-bs-parent="#help_accordion">
		      <div class="accordion-body">
			      	<div class="helpcontent">${i.help_content }</div>
		      </div>
		    </div>
	  </div>
	  </c:forEach>
	</div>
	
</div>
	<!-- 페이지 네이트 -->
	<div id="pagenate" class="pb-4">
		<ul  class="pagination justify-content-center">	
		</ul>
	</div>
	
	<div class="d-flex justify-content-center border-top border-2 border-light py-3" id="inqBtn">
		<h3 class="titlefont">더 자세한 내용은 1:1로 문의하기가 가능합니다. &nbsp;&nbsp;&nbsp;</h3>
		<a href="/kflix/inquiry" class="btn btn-secondary contentfont">1:1 문의하기</a>
	</div>
</section>

<%@ include file="/resources/include/movie/alertModal.jsp" %>

<!-- 풋터 -->
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
var myCollapsible = document.getElementById('help_accordion')
myCollapsible.addEventListener('show.bs.collapse', function () {
	console.log('아코디언열림')
})

$(document).ready(function() { 
	var len = $('#helpData').val();
	var pnum = $('#helpPage').val();
	var amount = $('#helpAmount').val();
	makePageNate(len, pnum, amount);
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
	var url = "/kflix/FAQ/user";
	var data = JSON.stringify({
		help_type: clickData.value
	});
	ajax(type, url, data, pnum);	
}

// 개수 보기
$('#helpAmount').change(function(){
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
	var url = "/kflix/FAQ/user";
	var data = JSON.stringify({
		help_type: $('input[name="help_type"]:checked').val()
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
					+'<h6 class="accordion-header contentfont" id="help-head-' + i + '">'
					+'<button class="accordion-button text-light bg-kflix collapsed" type="button" data-bs-toggle="collapse"' 
					+'data-bs-target="#playcoll-' + i + '" aria-expanded="false" aria-controls="playcoll-' + i + '">' 
					+'<b>' + data[i].help_type + '</b>&nbsp;&nbsp;&nbsp; '  + data[i].help_title + '</button></h6>'
					+'<div id="playcoll-' + i + '" class="accordion-collapse collapse"'
					+'aria-labelledby="play-head-' + i + '" data-bs-parent="#help_accordion">'
					+'<div class="accordion-body"><div class="helpcontent">'+ data[i].help_content + '</div></div>'
					+'</div></div>');		
		}

	} catch(err){}
};
</script>

</body>
</html>