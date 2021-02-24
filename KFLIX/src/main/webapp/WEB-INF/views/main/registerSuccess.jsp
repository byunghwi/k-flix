<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버로 회원가입</title>
<script src="/kflix/resources/js/common/common.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">


<link href="/kflix/resources/css/login/register.css" rel="stylesheet">

</head>
<body>
	<div class="login-img">
		<div class="img-cover"></div>
		<div class="login-form-wrap">
			<div class="logform-content">
				<div id="vertical-flip" class="card">
					<div class="flip">
						<div class="front">
							<div class="box-input">
								<div class="text-first">환영해요!</div>
								<div class="text-second">KFLIX 회원이 되셨군요,</div>
								<div class="text-third">로그인 하고 다양한 영화 컨텐츠를 감상해보세요.</div>
								<button type="button" onclick="document.location.href = '${pageContext.request.contextPath}/login';">로그인 하러 가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>