<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">

<meta charset="UTF-8">
<title>상세보기</title>
</head>

<style>
	
	#img-back{
	    width: 85%;
	    height: 100%;	
	    float: right;
	    position: relative;	
	    z-index: 1;
	}
	
	#img-back::after {
	  width: 100%;
	  height: 100%;
	  content: "";
	  background-size: cover;
	  background-image: url('${movie.poster_path}');
	  position: absolute;
	  top: 0;
	  left: 0;
	  z-index: -1;
	  opacity: 0.4;
	}
 
    #detail{
    	width: 500px;
	    height: 100vh;
	    padding-top: 50px;
	    padding-left: 0;
    }
    
	b {
		color: gray;
	}
</style>
<body>

<%@include file ="/resources/include/movie/nav.jsp" %>

<div class="" id="img-back">

<div id="detail">
	<h1>${movie.movie_title }</h1>
	<br />
	<c:choose>
		<c:when test="${movie.rating eq 'all'}">
			<p>전체 연령 관람가 ㆍ ${movie.play_time }분</p>
		</c:when>
		<c:otherwise>
			<p>${movie.rating }세 이상 관람가 ㆍ ${movie.play_time }분</p>
		</c:otherwise>
	</c:choose>
	<br />
	<h4>${movie.summary }</h4>
	<br />
  	<h6> <b>감독</b> &nbsp; ${movie.director_name } </h6>
  	<h6> <b>출연</b> &nbsp; ${movie.actor_name1 } ㆍ ${movie.actor_name2 } ㆍ ${movie.actor_name3 }</h6>
  	<h6> <b>개요</b> &nbsp; ${movie.genre_name1 } ㆍ ${movie.genre_name2 } &nbsp;<b> | </b> &nbsp;<b> ${movie.country } </b> &nbsp;<b> | </b> 
  	&nbsp; <b><fmt:formatDate value="${movie.movie_release }" pattern="yyyy.MM.dd"/></b> </h6>

	<c:choose>
		<c:when test="${movie.movie_status eq 'Y'}">
			<a href="../delete/${movie.movie_id }">삭제</a>
		</c:when>
		<c:otherwise>
			<a href="../recovery/${movie.movie_id }">복구</a>
		</c:otherwise>
	</c:choose>
<div class="img-cover"></div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
</body>
</html>