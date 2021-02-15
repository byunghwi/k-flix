<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
</head>
<style>
.img {
	position: relative;
	background-image: url("resources/imgs/netflix_main.jpg"); height :
	100vh;
	background-size: cover;
	height: 100vh;
}

.img-cover{
     position: absolute;
     height: 100%;
     width: 100%;
     background-color: rgba(0, 0, 0, 0.7);                                                                 
     z-index:1;
  }

.img .content{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     font-size:5rem;
     color: white;
     z-index: 2;
     text-align: center;
  }
</style>
<body>
	<script>
		var result = '${msg}';

		if (result === 'REGISTERED') {
			alert('등록이 완료되었습니다.');
		}
	</script>

	<div class="img">
		<div class="content">
			<h1 id="" class="our-story-card-title" data-uia="hero-title">영화, TV 프&#65279;로&#65279;그&#65279;램&#65279;을 무제한으로.</h1>
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">회원가입</button>
		</div>
		<div class="img-cover"></div>

	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회원가입</h4>
				</div>
				<form action="${pageContext.request.contextPath}/member/register"
					method="post">
					<div class="modal-body">

						<div class="input-group mb-2">
							<input type="email" name="email" class="form-control"
								placeholder="이메일 주소">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-exclamation"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-2">
							<input type="text" name="nick" class="form-control"
								placeholder="닉네임">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-user"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="text" name="birth" class="form-control"
								placeholder="생년월일">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="text" name="member_age" value="39"
								class="form-control" placeholder="나이">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="password" name="pwd" class="form-control"
								placeholder="비밀번호">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="password" class="form-control" placeholder="비밀번호 확인">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-lock"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-1">
							성별<input type="radio" name="gender" value="N"
								class="form-control" title="남성">남성<br> <input
								type="radio" title="여성" name="gender" value="F"
								class="form-control">여성
						</div>
						<div class="row">
							<div class="col-8">
								<div class="icheck-primary">
									<input type="checkbox" id="agreeTerms" name="terms"
										value="agree"> <label for="agreeTerms">전체 약관
										동의 </label>
								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>