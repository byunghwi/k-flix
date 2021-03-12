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
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c7adb7b803.js"
	crossorigin="anonymous"></script>

<!--  <link href="/kflix/resources/css/ticket/ticket.css" rel="stylesheet"> -->
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
body {
	background-color: #141414;
	color: white;
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
}

section {
	position: absolute;
	left: 5%;
	top: 13%;
	width: 90%;
	height: auto;
	border: 3px solid white;
}

section .hr-title {
	margin: 1rem 0;
	color: inherit;
	background-color: currentColor;
	border: 1px solid white;
	opacity: .25;
	width: 13%;
	margin-left: 10px;
}

section .hr-divide {
	margin: 1rem 0;
	color: inherit;
	background-color: currentColor;
	border: 1px solid white;
	opacity: .25;
	width: 99%;
	margin-left: 10px;
	margin-bottom: 50px;
}

section h3 {
	font-size: 1.6rem;
	text-align: left;
	margin-top: 20px;
	margin-left: 20px;
	font-weight: bold;
	color: white;
}

section .cert_msg {
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
	color: lightgrey;
}

/* 이메일보내기 버튼 */
section #sendEmail {
	border-color: white white white white;
	background: transparent;
	margin: 10p;
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
	padding: 10px 30px 10px 30px;
	color: white;
	border-radius: 4px;
	transition: all 0.6s;
}

section #modifyInfoBtn {
	position: absolute;
	border-color: white white white white;
	margin-left: 4%;
	background: transparent;
	padding: 3px 8px 3px 8px;
	color: white;
	border-radius: 4px;
	transition: all 0.6s;
}

section #modifyConfirmBtn {
	border-color: white white white white;
	background: transparent;
	padding: 3px 8px 3px 8px;
	color: white;
	border-radius: 4px;
	transition: all 0.6s;
}

/* 이메일 보내기 마우스 오버 */
section #sendEmail:hover {
	background-color: red;
	border-color: transparent;
}

/* 정보수정 마우스 오버 */
section #modifyInfoBtn:hover {
	background-color: red;
	border-color: transparent;
}

section #modifyConfirmBtn:hover {
	background-color: red;
	border-color: transparent;
}

section .table-myinfo {
	display: inline;
}

section .table-myinfo-modify {
	display: none;
}

section td {
	text-align: center;
	padding-left: 25px;
	/* font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; */
}

section input {
	outline: 0 !important;
	border-width: 0 0 1px 0 !important;
	border-color: #eee !important;
	margin: 0 auto;
	padding: 10px 3%;
	background: transparent;
	font-size: 15px;
	width: 300px;
	height: 25px;
	font-family: "FontAwesome";
	border: 1px solid #eee;
	position: relative;
	color: #eee;
	margin-bottom: 15px;
	border-radius: 3px;
}

section .contents_mem {
	padding-bottom: 20px;
}

.wrapper {

	position:relative;

    min-height:100%;

}
</style>

</head>
<body>

<div class="wrapper">
	<%@include file="/WEB-INF/views/main/header.jsp"%>

	<script>
		var msg = '${msg}';
		if (msg === 'OK') {
			alert('이용권 해지가 완료되었습니다.\r\n만료일까지 정상적으로 시청 가능합니다.');
		}
	</script>

		<div class="total_wrap">
			<section>
				<div class="contents_cert">
					<h3>본인인증</h3>
					<hr class="hr-title">
					<table class="table-email">
						<tr>
							<td>본인인증 상태</td>
							<c:choose>
								<c:when test="${member.cert eq 'N' && sendChk eq 'OK'}">
									<td>미인증</td>
									<td>이메일을 전송했습니다.</td>
								</c:when>

								<c:when test="${member.cert eq 'N'}">
									<td>미인증
									<td />
									<td><button type="button" id="sendEmail"
											onclick="sendEmail();">이메일 인증 보내기</button></td>
								</c:when>

								<c:when test="${member.cert eq 'Y'}">
									<td>인증완료</td>
								</c:when>

							</c:choose>
						</tr>
					</table>
				</div>

				<hr class="hr-divide">

				<form id="del_t_form" method="POST">
					<div class="contents_ticket">
						<h3>이용권</h3>
						<hr class="hr-title">
						<table class="table-ticket">
							<tr>
								<c:choose>
									<c:when
										test="${member.ticket_id eq null || member.ticket_id eq 0}">
										<td>이용권 없음</td>
									</c:when>

									<c:when
										test="${member.ticket_id ne null && member.ticket_id ne 0 && not empty member.ticket_id}">
										<input type="hidden" name="ticket" id="ticket"
											value="${ticket }">
										<td>${ticket.ticket_name }</td>
										<td>만료일 : <fmt:formatDate value="${member.pay_exp_date }"
												pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
										<td id="remove"><c:if
												test="${member.pay_remove_dt eq null}">
												<button id="sendEmail" onclick="removePay();">이용권
													해지</button>
											</c:if></td>
									</c:when>
								</c:choose>
							</tr>
						</table>
					</div>
				</form>

				<hr class="hr-divide">

				<form id="modify_form" method="POST">
					<div class="contents_mem">
						<input type="hidden" name="email" value="${member.email }">

						<h3>내 정보</h3>
						<hr class="hr-title">
						<table class="table-myinfo">
							<tr>
								<td>E-MAIL</td>
								<td>${member.email }</td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td>${member.nick }</td>
							</tr>
						</table>
						<button id="modifyInfoBtn" onclick="modify();">정보수정</button>


						<table class="table-myinfo-modify">

							<tr>
								<td><input type="text" name="nick" id="nick"
									placeholder="변경할 닉네임을 입력하세요." required></td>
							</tr>
							<tr>
								<td><button id="modifyConfirmBtn"
										onclick="modify_confirm();">확인</button></td>
							</tr>

						</table>
					</div>
				</form>

			</section>

		</div>
		<%@include file="/WEB-INF/views/main/footer.jsp"%>
	</div>
	<script type="text/javascript">
		function sendEmail() {
			document.getElementById('sendEmail').style.display = "none";
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

		function removePay() {

			if (confirm("정말 해지하시겠습니까?") == true) {

				var form = document.getElementById('del_t_form');
				form.action = "${pageContext.request.contextPath}/ticket/removeKakaoPay"
				form.submit();
				
				/* var formsubmit = $("#del_t_form").serialize();
				$.ajax({
						type : 'POST',
						url : "${pageContext.request.contextPath}/ticket/removeKakaoPay",
						dataType : "json",
						data : formsubmit,
						success : function(result) {
							if (result == 1) {
								
								$('#remove').remove();

								alert('이용권 해지가 완료되었습니다. 만료일까지 정상적으로 시청 가능합니다.');
							} else {
								alert('회원 업데이트 오류');
							}
						},
						error : function(request, status, error) {
							alert("code = " + request.status
									+ " message = " + request.responseText
									+ " error = " + error); // 실패 시 처리
						}
				}); */
			} else {
				return;
			}

		}

		function modify() {
			$('#modifyInfoBtn').css("display", "none");
			$('.table-myinfo-modify').css("display", "inline");
		}

		// ajax 닉네임 업데이트
		function modify_confirm() {

			var formsubmit = $("#modify_form").serialize();
			var nick = $("#nick").val();
			//alert('보내기 전 데이터' + formsubmit);

			$.ajax({
				type : 'POST',
				url : "${pageContext.request.contextPath}/member/modifyMem",
				dataType : "json",
				data : formsubmit,
				success : function(result) {
					if (result == 1) {
						$('#modifyInfoBtn').css("display", "inline");
						$('.table-myinfo-modify').css("display", "none");
						$("#nick").val(nick);
					} else {
						alert('회원 업데이트 오류');
					}
				},
				error : function(request, status, error) {
					alert("code = " + request.status + " message = "
							+ request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
	</script>
</body>
</html>
