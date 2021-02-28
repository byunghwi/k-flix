<%@page import="org.springframework.web.servlet.mvc.support.RedirectAttributes"%>
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<style>
	.titlefont {	
		font-family: 'Black Han Sans', sans-serif;
	}
	
	.contentfont{
		font-family: 'Jua', sans-serif;
	}
	
	.accordion-body{
		background-color: rgb(231,241,255);
	}
	
	.accordion-button{
		font-weight: bolder;
	}
	
	#headArea{
		background-image: url('/kflix/resources/imgs/service/servicehead.jpg');
		height: 200px;
		background-size: 100% 200px;
		text-align: center;

	}
	#headArea>h1{
		font-size: 60px;
		letter-spacing: 0.2rem;	
	}
	
	#faqArea{
		width: 1200px;
		background-color: rgb(234,234,234);
	}


	#infoA, #payA{
		padding-top: 20px;
	/* 	width: 300px;
		max-width: 300px; */
	}
	#allhelp{
		color: gray;
		text-decoration: none;
	}
	#inqBtn, #titleArea{
		background-color: lightgray;
	}

</style>

<body>
<!-- 헤더 -->


<section id="faqArea">

<div id="headArea">
	<h1 class="pt-5 titlefont">고객 센터</h1>
</div>

<div class="py-4 ps-5 border-top border-2 border-light" id="titleArea">
	<h3 class="titlefont">${login.email }님, &nbsp;안녕하세요!</h3>
	<br />
	<h5 class="ps-2 contentfont">빠르고 정확하게 해결해 드리겠습니다.</h5>	
</div>

<!-- FAQ -->
<div class="d-flex justify-content-start py-4 border-top border-2 border-light ps-4">
	<h2 class="titlefont">자주하는 질문</h2>
</div>

<div class="accordion accordion-flush" id="playaccordion">
<div class="px-5">
	<div id="playA">
	  <h5 class="contentfont">재생 관련</h5>
	  <c:forEach items="${help_play }" var="i" begin="0" end="${help_play.size()}" varStatus="status">
	  <div class="accordion-item ps-3">
		    <h6 class="accordion-header" id="play-head${status.index}">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
		      		data-bs-target="#playcoll-${status.index}" aria-expanded="false" aria-controls="playcoll-${status.index}">
		        ${i.help_title }
		      </button>
		    </h6>
		    <div id="playcoll-${status.index}" class="accordion-collapse collapse" 
		    	aria-labelledby="play-head${status.index}" data-bs-parent="#playaccordion">
		      <div class="accordion-body">
		      	<div class="ps-4">${i.help_content }</div>
		      </div>
		    </div>
	  </div>
	  </c:forEach>
	</div>
	
	<div id="infoA">
	 	<h5 class="contentfont">이용 안내</h5>
 		<c:forEach items="${info }" var="i" begin="0" end="${info.size()}" varStatus="status">
	  	<div class="accordion-item ps-3">
		    <h6 class="accordion-header" id="info-head${status.index}">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
		      		data-bs-target="#infocoll-${status.index}" aria-expanded="false" aria-controls="infocoll-${status.index}">
		         ${i.help_title }
		      </button>
		    </h6>
		    <div id="infocoll-${status.index}" class="accordion-collapse collapse" 
		    	aria-labelledby="info-head${status.index}" data-bs-parent="#playaccordion">
		      <div class="accordion-body">
		      	<div class="ps-4">${i.help_content }</div>
		      </div>
		    </div>
		 </div>
		 </c:forEach>
	</div>
	 
 	<div id="payA">
	 	<h5 class="contentfont">결제 관련</h5>
 		<c:forEach items="${payment }" var="i" begin="0" end="${info.size()}" varStatus="status">
	  	<div class="accordion-item ps-3">
		    <h6 class="accordion-header" id="payment-head${status.index}">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
		      		data-bs-target="#paymentcoll-${status.index}" aria-expanded="false" aria-controls="paymentcoll-${status.index}">
		         ${i.help_title }
		      </button>
		    </h6>
		    <div id="paymentcoll-${status.index}" class="accordion-collapse collapse" 
		    	aria-labelledby="payment-head${status.index}" data-bs-parent="#playaccordion">
		      <div class="accordion-body">
		      	<div class="ps-4">${i.help_content }</div>
		      </div>
		    </div>
		 </div>
		 </c:forEach>
	</div>
	
</div>
</div>
	
<div class="d-flex justify-content-end pb-5 pe-5 pt-3">
	<a href="./FAQ" id="allhelp">전체보기&gt;&gt;</a>
</div>
	
	
<!-- 1:1문의하기  -->
<div class="d-flex justify-content-center border-top border-2 border-light py-3" id="inqBtn">
	<h3 class="titlefont">더 자세한 내용은 1:1로 문의하기가 가능합니다. &nbsp;&nbsp;&nbsp;</h3><a href="/kflix/inquiry" class="btn btn-secondary">1:1 문의하기</a>
</div>

</section>



<!-- 커스텀 alert -->
<%@ include file="/resources/include/movie/alertModal.jsp" %>

<!-- 풋터 -->


<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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

</script>
</body>
</html>