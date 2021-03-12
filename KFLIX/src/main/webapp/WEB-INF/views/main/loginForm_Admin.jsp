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
<title>관리자 로그인</title>
<style>
* {
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
}

.admin-div {
    position: relative;
    color: white;
    border-radius: 2px;
    font-size : 2rem;
    font-weight: bolder;

}
</style>
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
							<form action="${pageContext.request.contextPath}/adminLoginPost"
								method="post">
								<div class="box-input">
								<hr style="border:3px color= silver; margin-top:3px; margin-bottom: 5px;" width="25%">
								<div class="admin-div">ADMIN</div>
								<hr style="border:3px color= silver; margin-top:3px; margin-bottom: 40px;" width="25%">
									<input type="text" name="email" placeholder="&#xf007;" required /> 
									<input type="password" name="pwd" placeholder="&#xf11c;" required />
									<button type="submit">Login</button>	
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