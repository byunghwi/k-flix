<%@page import="javax.inject.Inject"%>
<%@page import="com.kflix.ticket.service.TicketServiceImpl"%>
<%@page import="com.kflix.ticket.domain.Ticket"%>
<%@page import="com.kflix.ticket.service.TicketService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c7adb7b803.js"
	crossorigin="anonymous"></script>
	
 <link href="/kflix/resources/css/ticket/ticket.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>

<style>
body, html {
	background: #141414;
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	cursor: default;
	width: 100%; 
	height: 100%;
	margin: 0;
	padding : 0;

}

body {
    margin: 0;
    font-family: var(--bs-font-sans-serif);
    font-size: 1rem;
    font-weight: 700;
    line-height: 1.5;
    color: #212529;
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
}

section {
    position: absolute;
    left: 5%;
    top: 13%;
    width: 90%;
    height: auto;
    border: 3px solid white;
}

.hr-title{
    margin: 1rem 0;
    color: inherit;
    background-color: currentColor;
    border: 1px solid white;
    opacity: .25;
    width: 10%;
    margin-left: 10px;
}

.hr-divide{
	margin: 1rem 0;
    color: inherit;
    background-color: currentColor;
    border: 1px solid white;
    opacity: .25;
    width: 99%;
    margin-left: 10px;
}

h3 {
     font-size: 1.6rem;
    text-align: left;
    margin-top: 20px;
    margin-left: 20px;
    font-weight: bold;
    color: white;
}

.cert_msg {
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	color: lightgrey;
}

/* 이메일보내기 버튼 */
#sendEmail {
    border-color: white white white white;
    background: transparent;
    margin: 10p;
    font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    padding: 10px 30px 10px 30px;
    color: white;
    border-radius: 4px;
    transition: all 0.6s;
}

/* 이메일 보내기 마우스 오버 */
#sendEmail:hover {
	background-color : red;
	border-color: transparent;
}

.table-email td {
	text-align: center;
	color:white;
	padding-left : 25px;
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

.table-ticket td {
	text-align: center;
	color:white;
	padding-left : 25px;
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

</style>

</head>
<body>

<%@include file="/WEB-INF/views/main/header_test.jsp"%>

<div class = "total_wrap">	

	<section>
		<div class="contents_cert">
		<h3>본인인증</h3>
		<hr class="hr-title">
			<table class="table-email">
				<tr>
					<td>본인인증 상태</td>
					<c:choose>
						<c:when test="${member.cert eq 'N' && sendChk eq 'OK'}">
							<td>미인증</td><td>이메일을 전송했습니다.</td>
						</c:when>
				
						<c:when test="${member.cert eq 'N'}">
							<td>미인증<td/><td><button type="button" id="sendEmail" onclick="sendEmail();">이메일 인증 보내기</button></td>
						</c:when>
				
						<c:when test="${member.cert eq 'Y'}">
							<td>인증완료</td>
						</c:when>
				
					</c:choose>
				</tr>
			</table>
		</div>
		
		<hr class="hr-divide">
		
		<div class="contents_ticket">
		<h3>이용권</h3>
		<hr class="hr-title">
			<table class="table-ticket">
				<tr>
					<c:choose>
						<c:when test="${member.ticket_id eq null || member.ticket_id eq 0}">
							<td>이용권 없음</td>
						</c:when>
				
						<c:when test="${member.ticket_id ne null && member.ticket_id ne 0 && not empty member.ticket_id}">
							<td>${ticket.ticket_name }</td><td>${ticket.ticket_price }</td><td><fmt:formatDate value ="${member.pay_exp_date }" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td><td><button id="sendEmail" onclick="removePay();">이용권 해지</button></td>
						</c:when>		
					</c:choose>
				</tr>
			</table>
		</div>
		
		<hr class="hr-divide">
		
		<div class="contents_mem">
			<h3>내 정보</h3>
			<hr>
		</div>
		</section>
		
		<footer>
			footer
		</footer>
</div>
	<script type="text/javascript">
		function sendEmail() {

			document.getElementById('sendEmail').disabled = true;
			window.location.href = "/kflix/ticket/sendEmail";
		}

		function kakaopay() {
			var form = document.getElementById('form');

/* 			if(!$(':radio[name="ticket_class"]:checked').val()){
				alert('요금제를 선택해주세요');
				return;
			} */
			
			form.submit();
		}

		function removePay(){
			var form = document.getElementById('form');
			form.action = "${pageContext.request.contextPath}/ticket/removeKakaoPay"
			form.submit();
		}
	</script>
</body>
</html>