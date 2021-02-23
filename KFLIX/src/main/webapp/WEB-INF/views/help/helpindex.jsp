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
<title>FAQ</title>
</head>
<body>

<!-- 본체 영역 -->
<div class="container">

	<!-- 테이블 영역 -->
	<div id="helpMain">
		<input id="helpData" type="hidden" value="${total }"/>
		<table id="helpTable" class="table talbe table-striped text-center align-middle">
		<thead>
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
					<button id="" class="btn btn-primary">수정</button>
					<button id="" class="btn btn-danger">삭제</button>
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


<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/kflix/resources/js/movie/pagenate.js?ver=8"></script>
<script>
$(document).ready(function() { 
	var len = $('#helpData').val();
	var pnum = 1;
	var amount = 10;
	makePageNate(len, pnum, amount);
});


</script>
</body>
</html>