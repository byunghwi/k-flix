<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버로 회원가입</title>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">

<script src="/kflix/resources/js/common/common.js"></script>
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
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
							<form action="${pageContext.request.contextPath}/member/register"
								method="post">
								<c:if test="${not empty naver}">
									<input type="hidden" name="naver" value="${naver.naver }" /> <input
										type="hidden" name="gender" value="${naver.gender }" /> <input
										type="hidden" name="nick" value="${naver.nick }" /> 
										<c:if test="${not empty naver.birth}">
											<input type="hidden" id = "member_age" name="member_age" /> 
										</c:if>
												
								</c:if>
								<c:if test="${not empty kakao}">
									<input type="hidden" name="kakao" value="${kakao.kakao }" /> <input
										type="hidden" name="gender" value="${kakao.gender }" /> <input
										type="hidden" name="nick" value="${kakao.nick }" />
										<c:if test="${not empty kakao.birth}">
											<input type="hidden" id = "member_age" name="member_age" /> 
										</c:if>
								</c:if>
								
								<div class="box-input">
									<div class="text-first">잠깐,</div>
									<div class="text-second">아직 KFLIX 회원이 아니시군요</div>
									<div class="text-third">소셜 아이디로 빠르고 간편하게 가입해보세요</div>
									<input type="email" name="email" id="email"
										placeholder="&#xf007;  E-mail을 입력하세요" required />
									<div class="email-check" id = "email-check"></div>
									<button type="button"
										onclick="checkEmail();">중복확인</button>
									<button type="submit" id="regist">소셜 아이디로 가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var age;
		
 		if('${naver.birth }' != ""){
 			age = calcAge('${naver.birth }');
 			document.getElementById('member_age').value = age;
		}
		if('${kakao.birth }' != ""){
			age = calcAge('${kakao.birth }');
			document.getElementById('member_age').value = age;
		}
		
		//이메일 중복 확인
		function checkEmail() {

			var email = document.getElementById('email').value;

			$.ajax({
				type : 'POST',
				url : "${pageContext.request.contextPath}/member/emailCheck",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				data : email,
				success : function(result) {
					if (result > 0) {
						$("#email-check").text("사용중인 이메일입니다 :(");
						$("#email-check").css("color", "red").css("font-family", "Montserrat").css("font-size", "13px");
						$("#regist").attr("disabled", true);
					} else {
						$("#email-check").text("사용 가능한 이메일 입니다 :D");
						$("#email-check").css("color", "green").css("font-family", "Montserrat").css("font-size", "13px");
						$("#regist").removeAttr("disabled");
					}
				},
				error : function(error) {
					$("#email-check").text("올바른 이메일을 입력해주세요 ");
					$("#email-check").css("color", "red").css("font-family", "Montserrat").css("font-size", "13px");
					$("#regist").attr("disabled", true);
				}
			});
		};
	</script>
</body>
</html>