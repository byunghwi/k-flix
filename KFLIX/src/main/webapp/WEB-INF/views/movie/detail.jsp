<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>

<h1>영화 상세보기 페이지</h1>

<h3>${movie }</h3>

<a href="../updatepage/${movie.movie_id }">수정</a><br />

<c:choose>
	<c:when test="${movie.movie_status eq 'Y'}">
		<a href="../delete/${movie.movie_id }">삭제</a>
	</c:when>
	<c:otherwise>
		<a href="../recovery/${movie.movie_id }">복구</a>
	</c:otherwise>
</c:choose>

</body>
</html>