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
	#dashboard{
		width: 1500px;
		height: 1000px;
		margin-left: 330px;
	}
/* 	section, section div{
		border: 1px dotted red;
	} */
	#movie_total{
		width: 300px;
		height: 150px;
		position: relative;
		z-index: 1;
	}
	
	#inq_total{
		width: 300px;
		height: 150px;
		position: relative;
		z-index: 1;
	}
	
	#movie_total::after {
	  width: 100%;
	  height: 100%;
	  content: "";
	  background-color: teal;
	  border-radius: 15px;
	  position: absolute;
	  opacity: 0.5;
	  top: 0;
	  left: 0;
	  z-index: -1;
	}
	
	#inq_total::after {
	  width: 100%;
	  height: 100%;
	  content: "";
	  background-color: green;
	  border-radius: 15px;
	  position: absolute;
	  opacity: 0.5;
	  top: 0;
	  left: 0;
	  z-index: -1;
	}
	.total_title{
		text-align: right;
		margin-right: 15px;
	}
/* 	.ranking{
	 	width: 200px;
  		height: 200px;
  		opacity: 0.8;
  		background-size: cover;
	} */
	.rankingnum{
		width: 50px;
		height: 100%;
		color: red;
	}
	.rankingOne{
		width: 150px;
		height: 100px;
	}
	
	.rankingAnother{
		width: 120px;
		height: 80px;
	}
	
	.rankingtitle{
		width: 250px;
	}
	
	#first{
		left: 0;
		padding: 0;
		margin: 0;
		width: 1500px;
	}
	.total_content{
		height: 80%;
	}
	.moreBtn{
		text-decoration: none;
		color: gray;
	}
	.totalArea{
		padding-right: 20px;
	}
</style>
<title>Insert title here</title>
</head>
<body>

<%@include file="../manage/navbar.jsp"%>
<section id="dashboard">

<div id="section_title pt-5">
	<h1><i class="fas fa-chess-board"></i> 대시보드</h1>
</div>

<div class="container-lg w-100" id="first">
<hr />
<div class="d-flex pb-5">
  <div class="totalArea">
      	<div id="movie_total">
			<div class="total_content">
				<h3 class="total_title">영화</h3>
				<h4 class="total_title">${movieTotal } 편</h4>
			</div>
			<div class="d-flex justify-content-center p-0 m-0">
				<a href="#" class="moreBtn"> more >> </a>
			</div>
		</div> 
	</div>
	
  <div class="totalArea">
      	<div id="inq_total">
			<div class="total_content">
				<h3 class="total_title">문의</h3>
				<h4 class="total_title">${inqTotal } 건</h4>
			</div>	
			<div class="d-flex justify-content-center">
				<a href="#" class="moreBtn"> more >> </a>
			</div>
		</div>
  </div>
  
  <div class="totalArea">
      	<div id="movie_total">
			<div class="total_content">
				<h3 class="total_title">회원 수</h3>
				<h4 class="total_title">${movieTotal } 편</h4>
			</div>
			<div class="d-flex justify-content-center">
				<a href="#" class="moreBtn"> more >> </a>
			</div>
		</div> 
  </div>
  
  <div class="totalArea">
      	<div id="inq_total">
			<div class="total_content">
				<h3 class="total_title">매출 </h3>
				<h4 class="total_title">${inqTotal } 건</h4>
			</div>	
			<div class="d-flex justify-content-center">
				<a href="#" class="moreBtn"> more >> </a>
			</div>
		</div>
  </div>
  
 </div>
</div>

<div class="d-flex">

	<div class="pe-5">
		<h3>현재 Top5</h3>
		<hr />
		<c:forEach items="${movie }" var="i" varStatus="status">
			<c:choose>
			<c:when test="${status.index == 0 }">
				<div class="d-flex pb-2">
					<div class="rankingnum">
						<h1>${status.index + 1}</h1>
					</div>
					<div class="rankingtitle">
						<h1>${i.movie_title }</h1>
					</div>
					<div class="rankingOne">
						<img src="${i.poster_path }" class="rankingOne" alt="" />
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="d-flex pb-2 ps-3">
					<div class="rankingnum">
						<h3>${status.index + 1}</h3>
					</div>
					<div class="rankingtitle">
						<h3>${i.movie_title }</h3>
					</div>
					<div class="rankingAnother">					
						<img src="${i.poster_path }" class="rankingAnother" alt="" />
					</div>
				</div>
			</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	
	<div class="ps-5">
		<h3>이용권 결제 현황</h3>
		<hr />
		<div class="d-flex">
			<div>이용권 이름</div>
			<div>현황</div>
		</div>
		<c:forEach items="${ticket }" var="i" varStatus="status">
		<div class="d-flex">
			<div>${i.ticket_name }</div>
			<div>${i.ticket_using }</div>
		</div>
		</c:forEach>
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
<script src="/kflix/resources/js/movie/alertCustom.js?ver=10"></script>
<script>
$(document).ready(function() { 
	$('#manage').prepend('<span class="nav-clicked"></span>');
});

</script>
</body>
</html>