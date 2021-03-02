<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">

<link href="/kflix/resources/css/ticket/ticket.css" rel="stylesheet">

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
body, html {
	background: #141414;
	color: #fff;
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
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
	<h1>=========================</h1>
	<c:choose>
		<c:when test="${member.cert eq 'N' && sendChk eq 'OK'}">
			<h3>이메일을 전송했습니다.</h3>
		</c:when>

		<c:when test="${member.cert eq 'N'}">
			<button id="sendEmail" onclick="sendEmail();">이메일 인증 보내기</button>
		</c:when>

		<c:when test="${member.cert eq 'Y'}">
			<h3>이메일인증이 완료된 회원입니다.</h3>
			<button type="button" data-toggle="modal"
				data-target="#registerModal">이용권 구매</button>
		</c:when>

	</c:choose>

	<!-- 회원가입 모달 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="login-form-wrap">
			<div class="logform-content">
				<div id="vertical-flip" class="card">
					<div class="flip">
						<div class="front">
							<form id="form"
								action="${pageContext.request.contextPath}/ticket/kakaoPay"
								method="post">
								<input type="hidden" id="member_age" name="member_age" />
								<div class="box-input">
									<div class="text-first">이용권을 선택해주세요.</div>

									<input type="hidden" name="item_name" value="테스트용이용권명">
									<input type="hidden" name="total_amount" value=7700>

									<div class="text-second">원하는 멤버쉽 요금제를 선택하고 KFLIX의 모든 컨텐츠를
										즐겨보세요</div>
									<div>
										<table border="1" style="width: 80%">
											<tr style="height: 50px; border: 5px; border-color: white;">
												<td colspan="2">추천</td>
												<td colspan="2">일반</td>
											</tr>

											<tr style="height: 50px; border: 1px;">
												<td>정기권</td>
												<td>7,500원</td>

											</tr>
											<tr style="height: 50px; border: 1px;">
												<td>365일권</td>
												<td>69,000원</td>
											</tr>

										</table>
									</div>

									
									<button type="button" onclick="kakaopay();">구매</button>

								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function sendEmail() {

			document.getElementById('sendEmail').disabled = true;
			window.location.href = "/kflix/ticket/sendEmail";
		}

		function kakaopay() {
			var form = document.getElementById('form');
			form.submit();
		}
	</script>
</body>
</html>