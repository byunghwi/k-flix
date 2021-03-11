<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link href="/kflix/resources/css/login/login.css?ver=2" rel="stylesheet">

<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="login-img">
		<div class="img-cover"></div>
		<div class="login-form-wrap">
			<div class="logform-content">
				<div id="vertical-flip" class="card">
					<div class="flip">
						<div class="front">
							<div class="logo">
								<img src="resources/imgs/watch/kflixlogo.png" alt="Netlflix">
							</div>
						</div>

						<div class="back">
							<form action="${pageContext.request.contextPath}/loginPost"
								method="post">
								<div class="box-input">
									<input type="email" name="email" placeholder="&#xf007;" required /> 
									<input type="password" name="pwd" placeholder="&#xf11c;" required />
									<button type="submit">Login</button>
									<hr style="border:1px color= silver; margin-top:3px; margin-bottom: 17px;" width="50%">
									<div>
										<a href="${naver_url}"><img width= "250px;" height="45px;" style="margin-bottom: 10px;"
											src="resources/imgs/login/네이버 아이디로 로그인_완성형_Green.PNG" /></a>
									</div>
									<div>
										<a href="${kakao_url}"><img width= "250px;" height="45px;"
											src="resources/imgs/login/kakao_login_medium_wide.png" /></a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>