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
<style>
	#inquirtForm{
		width: 50%;
	}
</style>
<title>문의하기</title>
</head>
<body>

<!-- 문의하기 폼  -->
<div id="inquirtForm">
	<form action="./inquiry" method="post" id="sendForm">
	<h1>1:1문의하기</h1>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="form_eamil">보내시는 분</span>
	  <input type="text" class="form-control" name="email" value="${loginEmail }" required readonly aria-label="Username" aria-describedby="form_eamil">
	</div>
	
	<div class="input-group mb-3">
	  <label class="input-group-text" for="from_type">카테고리</label>
	  <select class="form-select" id="from_type" name="inquiry_type" required>
			<c:forEach items="${constraint }" var="i" begin="0" end="${constraint.size()}" varStatus="status">
				 <option>${i }</option>
			</c:forEach>
	  </select>
	</div>
	
	<div class="input-group mb-3">
	  <span class="input-group-text" id="form_title">제목</span>
	  <input type="text" class="form-control" placeholder="제목" name="inquiry_title" required aria-label="Username" aria-describedby="form_title">
	</div>
	
	<div class="input-group mb-2">
	  <span class="input-group-text">문의 내용</span>
	  <textarea class="form-control" rows="10" name="inquiry_content" required style="resize: none;" aria-label="With textarea"></textarea>
	</div>
	
	<div class="d-flex justify-content-end">
		<div>
			<input type="submit" value="보내기" class="btn btn-secondary"/>
			<a href="" class="btn btn-danger">취소</a>
		</div>
	</div>
	</form>
</div>

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
	$('#sendForm').submit(function(){
		// 유효성 한번더
		
		infoMsg("접수 되었습니다!");
	})
</script>
</body>
</html>