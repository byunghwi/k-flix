<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
	#dashboard{
		width: 1400px;
		height: 1000px;
		margin-left: 330px;
	}
	section, section div{
		border: 1px dotted red;
	}
</style>
<title>Insert title here</title>
</head>
<body>

<%@include file="../manage/navbar.jsp"%>
<section id="dashboard">

<div id="section_title">
	<h1><i class="fas fa-chess-board"></i> 대시보드</h1>
</div>

<div>현재 top5 영화</div>
<div>영화 총 편수</div> 
<div>총 문의 수</div>
<div>현재 메인 화면</div>
<div>이용권 결제 현황</div>
</section>



<%@ include file="/resources/include/movie/alertModal.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/kflix/resources/js/movie/alertCustom.js?ver=10"></script>
<script>
$(document).ready(function() { 
	$('#manage').prepend('<span class="nav-clicked"></span>');
});

</script>
</body>
</html>