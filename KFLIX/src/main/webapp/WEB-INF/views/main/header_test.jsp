<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KFLIX</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c7adb7b803.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/init.css">
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/header.css">
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/main/main.css">

<style>
#ticket_modal {
	display:none;
	width: 600px;
	padding : 20px 60px;
	background-color: #020202;
	color : white;
    border-radius: 8px;
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

</style>
</head>
<body>
<div id="ticket_modal">
				<form id="form" action="${pageContext.request.contextPath}/ticket/kakaoPay" method="post">
					<div class="box-input">
						<div class="text-first">이용권을 선택해주세요!!.</div>
							<div class="text-second">원하는 멤버쉽 요금제를 선택하고 KFLIX의 모든 컨텐츠를 즐겨보세요</div>
								<div id="ticket_info">
									<c:if test="${not empty tickets }">
										<table border="1" style="width: 80%; margin-top: 30px; margin-bottom: 30px;" align="center" >
											<c:forEach items="${tickets }" var = "ticket">
												<tr style="height: 50px; border: 5px; border-color: white;">
													<td colspan="2">${ticket.ticket_name }</td>
													<td colspan="2">${ticket.ticket_price }</td>
												</tr>						
											</c:forEach>
				
										</table>			
									</c:if>			
								</div>
								
								<button type="button" onclick="kakaopay();">구매</button>
								<button type="button" onclick="removePay();">정기결제해제</button>
										
							</div>
				</form>
</div>

	<!-- header -->
	<header>

		<div class="header_ticket" style="display: none;">
			지금 이용권을 구매하고 KFLIX의 모든 영상을 시청해보세요!  단 한 번의 클릭으로 언제든 해지할 수 있습니다. <a href="#registerModal2"
				id="ticket" style="text-align: right;" data-toggle="modal" data-target="#registerModal2">이용권구매</a>
		</div>

		<div class="header_container" id="header_container">
			<div class="logo">
				<a href=""> <img src="/kflix/resources/imgs/watch/kflixlogo.png"
					alt="NETFLIX">
				</a>
				<button class="header_toggleBtn">
					<i class="fa fa-bars"></i>
				</button>
			</div>
			<ul class="main_nav">
				<li class="main_nav_tab">홈</li>
				<li class="main_nav_tab">TV 프로그램</li>
				<li class="main_nav_tab">영화</li>
				<li class="main_nav_tab">최신 콘텐츠</li>
				<li class="main_nav_tab">내가 찜한 콘텐츠</li>
			</ul>
			<ul class="sub_nav">
				<li class="sub_nav_tab"><i class="fas fa-search"></i></li>
				<li class="sub_nav_tab"><i class="fas fa-gift"></i></li>
				<li class="sub_nav_tab"><i class="fas fa-bell"></i></li>
				<li class="sub_nav_tab"><i class="fas fa-user"></i></li>
			</ul>
		</div>
		
		
	</header>


	<!-- scripts -->
	<script src="/kflix/resources/js/main/header.js"></script>
	<script type="text/javascript">


	 if(${login.ticket_id} == null || ${login.ticket_id} == 0){
			$(".header_container").css("top", "45px");
			$(".header_ticket").css("display", "block");
	 }else{
	 		$(".header_ticket").css("display", "none");
	 }
	 	
/* 		search = document.getElementById('search');
		searchinput = document.getElementById('searchinput');

		search.addEventListener("click", function() {
			if (search.checked) {
				searchinput.style.display = 'inline-block';
			} else {
				if (searchinput.value != "") {
					console.log("서치 합니다")
					document.getElementById(searchinput.getAttribute('form'))
							.submit();
					searchinput.value = "";
				}
				searchinput.style.display = 'none';
			}
		});
 */
		$(document).ready(function() {
			$('#ticket').click(
					function() {
							var email = '${login.email}';
							$.ajax({
								type : 'POST',
								url : "${pageContext.request.contextPath}/ticket/cert",
								dataType : "json",
								data : "email="+ email,
								success : function(result) 
								{
									if (result.cert == "Y") 
										{
											alert('인증처리된 회원입니다.\r\n지금 바로 이용권을 구매해보세요!');

											values = result.tickets;//
						                    
						                    $.each(values, function( index, value ) {
						                    	document.getElementById('ticket_info');
						                    });

											//바로 모달창 띄우기
						                    modal('ticket_modal');
						                    
											//document.location.href = '${pageContext.request.contextPath}/ticket/info';
										} else if (result.cert == "N" || result.cert == "" || result.cert == null) {
											if (confirm('이용권을 구매하시려면 본인 인증을 먼저 해주세요. \r\n 본인 인증페이지로 이동할까요?')) {
												document.location.href = '${pageContext.request.contextPath}/ticket/info';
											}
										} 
								},error : function(error) {
									alert('[ 에러발생 ]'+ error);
								}});
			})

		});

	function modal(id){
		var z_index = 9999;
		var modal = document.getElementById(id);

		var bg = document.createElement('div');
		bg.setStyle({
			position: 'fixed',
	        zIndex: z_index,
	        left: '0px',
	        top: '0px',
	        width: '100%',
	        height: '100%',
	        overflow: 'auto',
	        backgroundColor: 'rgba(0,0,0,0.7)'
		});

		document.body.append(bg);

		$(document).mouseup(function (e){
			var modal_area = $('#ticket_modal');
			  if(modal_area.has(e.target).length === 0){
					bg.remove();
					modal_area.css("display", "none");
			  }
			});

		modal.setStyle({
			 position: 'fixed',
		        display: 'block',
		        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
		        // 배경레이어보다 한단계 위에 보여지도록
		        zIndex: z_index + 1,
		        // div center 정렬
		        top: '50%',
		        left: '50%',
		        transform: 'translate(-50%, -50%)',
		        msTransform: 'translate(-50%, -50%)',
		        webkitTransform: 'translate(-50%, -50%)'
		});

	}

	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};


	</script>

</body>

</html>