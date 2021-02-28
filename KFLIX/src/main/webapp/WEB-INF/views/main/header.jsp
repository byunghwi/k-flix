<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<h1>TEST 확인용 -> ${login}</h1>
	<a href="logout">로그아웃</a>
	<a href="" id="ticket">티켓구매</a>
	<a href="/kflix/service">고객센터</a>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#ticket').click(function() {
			var email = '${login.email}';
			
			$.ajax({
				type : 'POST',
				url : "${pageContext.request.contextPath}/ticket/cert",
				dataType : "text",
				data : "email="+email,
				success : function(result) {
					if (result == "Y") {
						alert('인증처리된 회원입니다.\r\n이용권 구매페이지로 이동합니다.');
						document.location.href = '${pageContext.request.contextPath}/ticket/info';
					} else if(result == "N" || result == "" || result == null){	
						if (confirm('이용권을 구매하시려면 본인 인증을 먼저 해주세요. \r\n 본인 인증페이지로 이동할까요?'))
						{
							document.location.href = '${pageContext.request.contextPath}/ticket/info';
						}
					}
				},
				error : function(error) {
					alert('[ 에러발생 ]' + error);
				}
			});
		})

	})
</script>
</html>