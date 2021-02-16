<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<h1>삭제된 장르관리</h1>
<a href="./">관리 페이지</a>
</div>

<div>
	<span style="padding-left: 200px;">
		<input type="text" />
		<button>검색</button>
	</span>
</div>

<section style="padding-top: 20px;">
	<table border="2px">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${genre }" var="genre" varStatus="status">
			<tr>
				<td>${genre.genre_id }</td>
				<td>${genre.genre_name }</td>
				<td>
					<a href="./updatepage/${genre.genre_id }">수정</a>
					<a href="./delete/${genre.genre_id }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</section>

</body>
</html>