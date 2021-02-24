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
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<style>
	#faqArea{
		width: 70%;
	}
</style>

<body>
<!-- 헤더 -->
<h1>고객센터</h1>


<!-- FAQ -->
<section id="faqArea">
	<div class="d-flex justify-content-start">
		<h2>FAQ</h2>
	</div>
	
	<div class="d-flex justify-content-between">	
		<div>
			<h4>재생 관련</h4>
			<ul type="none">
			<c:forEach items="${help_play }" var="i" begin="0" end="${help_play.size()}" varStatus="status">
				<li><a href="">${i }</a></li>
			</c:forEach>
			</ul>
		</div>
		
		<div>
			<h4>이용안내</h4>
			<ul type="none">
			<c:forEach items="${info }" var="i" begin="0" end="${info.size()}" varStatus="status">
				<li><a href="">${i }</a></li>
			</c:forEach>
			</ul>
		</div>
		
		<div>
			<h4>결제 관련</h4>
			<ul type="none">
			<c:forEach items="${payment }" var="i" begin="0" end="${payment.size()}" varStatus="status">
				<li><a href="">${i }</a></li>
			</c:forEach>
			</ul>
		</div>
	</div>
	
	<div class="d-flex justify-content-end">
		<a href="">전체보기&gt;&gt;</a>
	</div>
</section>

<!-- 1:1문의하기  -->
<div>
	<a href="/kflix/inquiry" class="btn btn-primary">문의하기</a>
</div>

<!-- 풋터 -->


<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</body>
</html>