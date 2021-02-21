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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">


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
							<form action="${pageContext.request.contextPath}/member/register" method="post">
								<input type="hidden" name="naver" value="${naver.naver }" /> <input
									type="hidden" name="gender" value="${naver.gender }" /> <input
									type="hidden" name="nick" value="${naver.nick }" /> <input
									type="hidden" id="member_age" name="member_age" />
								<div class="box-input">
									<div class="text-first">잠깐,</div>
									<div class="text-second">아직 KFLIX 회원이 아니시군요</div>
									<div class="text-third">네이버 아이디로 빠르고 간편하게 가입해보세요</div>
									<input type="email" name="email"
										placeholder="&#xf007;  E-mail을 입력하세요" required />
									<button type="submit">네이버 아이디로 가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var age = calcAge('${naver.birth }'); //만나이 계산
		document.getElementById('member_age').value = age;
		console.log(document.getElementById('member_age').value);
	</script>
</body>
</html>