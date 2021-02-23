<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, html {
    background: #141414;
    color: #fff;
    font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;
    line-height: 1.2;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    cursor: default;
}
</style>
</head>
<body>
<h1>${member}</h1>

<c:choose>
<c:when test="${member.cert eq 'N' && sendChk eq 'OK'}">
<h3>이메일을 전송했습니다.</h3>
</c:when>

<c:when test="${member.cert eq 'N'}">
<button id = "sendEmail" onclick="sendEmail();">이메일 인증 보내기</button>
</c:when>

<c:when test="${member.cert eq 'Y'}"><h3>이메일인증이 완료된 회원입니다.</h3></c:when>

</c:choose>

<script type="text/javascript">
function sendEmail(){
	
	document.getElementById('sendEmail').disabled = true;
	window.location.href ="/kflix/ticket/sendEmail";
}

</script>
</body>
</html>