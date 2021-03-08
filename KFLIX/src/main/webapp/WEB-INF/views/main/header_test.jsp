<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	display: none;
	width: 65%;
	height: 65%;
	padding: 20px 60px;
	background-color: #0c0c0c;
	color: white;
	border-radius: 8px;
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	text-align: center;
	-moz-osx-font-smoothing: grayscale;
	transition: all 0.6s;
}

#ticket_info {
	float: left;
	width: 70%;
}

.ticket_detail {
	float: left;
	width: 30%;
	margin-top: 30px;
}

.text-first {
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
	color: white;
	font-size: 30px;
	font-weight: bold;
}

#buy_btn {
	position: absolute;
	left: 50%;
	top: 80%;
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

.ticket_box {
	border: 1px solid;
	padding: 10px;
	text-align: left;
}

.t_title {
	font-weight: bold;
	font-size: 20px;
}

.t_content {
	font-size: 14px;
	color: darkgray;
	padding: 4px;
	margin-left: 10px;
}

.ticket_box2 {
	border: none;
	text-align: left;
}

.t_content2 {
	font-size: 13px;
	font-weight: lighter;
	color: dimgray;
}

.t_title2 {
	font-size: 17px;
	color: dimgrey;
	padding: 5px;
	font-weight: bold;
}

.tr_class {
	border: 1px solid;
}
<
c






:import



 



url






="/
mapping한



 



url






"/
>
</style>
</head>
<body>
	<div id="ticket_modal">
		<form id="form"
			action="${pageContext.request.contextPath}/ticket/kakaoPay"
			method="post">
			<input type="hidden" name="ticket_id" id="ticket_id">
			<div class="box-input">
				<div class="text-first">이용권을 선택해주세요!</div>
				<div class="text-second">원하는 멤버쉽 요금제를 선택하고 KFLIX의 모든 컨텐츠를
					즐겨보세요</div>
				<div id="ticket_info">
					<c:if test="${not empty tickets }">
						<table border="1" id="ticket_table"
							style="width: 95%; margin-top: 30px; margin-bottom: 30px;"
							align="center">
							<tr style="height: 50px; border: 5px; border-color: white;">
								<td colspan="2">이용권번호</td>
								<td colspan="2">이용권명</td>
								<td colspan="2">가격</td>
							</tr>
							<c:forEach items="${tickets }" var="ticket">

								<tr class="tr_class"
									style="height: 50px; border: 5px; border-color: white;"
									onclick="focuss(this)">
									<td colspan="2">${ticket.ticket_id }</td>
									<td colspan="2">${ticket.ticket_name }</td>
									<td colspan="2">${ticket.ticket_price }</td>
								</tr>
							</c:forEach>

						</table>
					</c:if>

				</div>
				<div class="ticket_detail">
					<div class="ticket_box">
						<div class="t_title">
							<i class="fas fa-chevron-circle-down" style="color: #ff0101ad;"></i>
							지속적인 신작 업데이트
						</div>
						<div class="t_content">저렴한 월 요금으로 일체의 광고 없이 원하는 시간에 원하는 만큼
							즐길 수 있습니다.</div>
						<div class="t_title">
							<i class="fas fa-chevron-circle-down" style="color: #ff0101ad;"></i>
							무궁무진한 콘텐츠
						</div>
						<div class="t_content">무궁무진한 콘텐츠가 준비되어 있으며 매주 새로운 TV 프로그램과
							영화가 제공됩니다.</div>
					</div>
					<div class="ticket_box2">
						<div class="t_title2">KFLIX 요금에 대하여</div>
						<div class="t_content2">- 멤버십 요금은 2,000원부터 73,000원까지 다양합니다.</div>
						<div class="t_content2">- 무궁무진한 콘텐츠가 준비되어 있으며 매주 새로운 영화가
							제공됩니다.</div>
						<div class="t_title2">멤버십 해지에 대하여</div>
						<div class="t_content2">- KFLIX는 부담 없이 간편합니다. 성가신 계약도, 약정도
							없으니까요.</div>
						<div class="t_content2">- 멤버십 해지도 온라인에서 클릭 두 번이면 완료할 수 있습니다.</div>
						<div class="t_content2">- 해지 수수료도 없으니 원할 때 언제든 계정을 시작하거나
							종료하세요.</div>
					</div>

				</div>


				<button type="button" id="buy_btn" onclick="kakaopay();">구매</button>
				<!-- <button type="button" onclick="removePay();">정기결제해제</button> -->

			</div>
		</form>
	</div>

	<!-- header -->
	<header>

		<div class="header_ticket" style="display: none;">
			지금 이용권을 구매하고 KFLIX의 모든 영상을 시청해보세요! 단 한 번의 클릭으로 언제든 해지할 수 있습니다. <a
				href="#registerModal2" id="ticket" style="text-align: right;"
				data-toggle="modal" data-target="#registerModal2">이용권구매</a>
		</div>

		<div class="header_container" id="header_container">
			<div class="logo">
				<a href="/kflix/browse"> <img
					src="/kflix/resources/imgs/watch/kflixlogo.png" alt="NETFLIX">
				</a>
				<button class="header_toggleBtn">
					<i class="fa fa-bars"></i>
				</button>
			</div>
			<ul class="main_nav">
				<li class="main_nav_tab"><a class="nav-link hometag"
					aria-current="page" href="/kflix/browse#abody">홈</a></li>
				<li class="main_nav_tab "><a class="nav-link movietag"
					href="/kflix/browse#amovie">영화</a></li>
				<li class="main_nav_tab"><a class="nav-link top10tag"
					href="/kflix/browse#atop" tabindex="-1">요즘 대세 콘텐츠!</a></li>
				<li class="main_nav_tab"><a class="nav-link wishtag"
					href="/kflix/browse#awish">내가 찜한 콘텐츠</a></li>
				<li id="testdsf" class="main_nav_tab"></li>
			</ul>
			<ul class="sub_nav">
				<li class="sub_nav_tab">
					<form id="searchform" action="/kflix/browse/search"></form> <input
					id="search" type="checkbox" style="display: none;"> <input
					id="searchinput" form="searchform" name="searchValue" type="text"
					style="display: none; border: none; width: 135px; margin: 0px 1.5rem; padding: 3px 15px; border-radius: 0.3rem;"
					autocomplete="off"> <label for="search"><i
						class="fas fa-search color_white nav-icon"></i></label>
				</li>
				<li class="sub_nav_tab"><button id="btnGroupDrop_bell"
						type="button" class="btn" data-bs-toggle="dropdown"
						aria-expanded="false" style="padding: 0; border: 0;">

						<i class="fas color_white fa-bell"></i>
						<c:if test="${alarm.alarm_count != 0}">
							<span
								style="font-size: 11px; background-color: #ed2927; padding: 0 4px; border-radius: 50rem; position: relative; top: -8px; right: 12px; color: white;">${alarm.alarm_count }<!-- 신규 카운트 -->
							</span>
						</c:if>
					</button>
					<ul class="dropdown-menu" aria-labelledby="btnGroupDrop_bell">
						<li style="font-size: 14px"><a id="newmovie_update"
							href="/kflix/browse/newmovie" class="dropdown-item">신규 콘텐츠 <c:if
									test="${alarm.alarm_count != 0}">
									<span class="arum"
										style="float: right; background-color: #ed2927; padding: 0 11px; border-radius: 50rem;">
										${alarm.alarm_count } <!-- 신규 카운트 -->
									</span>
								</c:if>
						</a></li>
					</ul></li>



				<li class="sub_nav_tab">
					<button id="btnGroupDrop_login" type="button" class="btn"
						data-bs-toggle="dropdown" aria-expanded="false"
						style="padding: 0; border: 0;">

						<i class="fas color_white fa-user"></i>
					</button>

					<ul class="dropdown-menu" aria-labelledby="btnGroupDrop_login">
						<li style="padding: 2px 1rem; font-size: 14.5px;">${login.email}</li>
						<li style="padding: 2px 1rem; height: 1rem; font-size: 14.5px;"><c:if
								test="${not empty login.ticket_id }">
								<c:forEach items="${tickets }" var="ticket">
									<c:if test="${login.ticket_id eq ticket.ticket_id}">
							${ticket.ticket_name }
							</c:if>
								</c:forEach>
							</c:if> <c:if test="${empty login.ticket_id or login.ticket_id eq 0}">
						이용권 없음
						</c:if></li>
						<li style="height: 0.5rem;">
							<hr>
						</li>
						<li><a href="logout" class="dropdown-item">로그아웃</a></li>
						<li><a href="" class="dropdown-item">내 정보</a></li>
						<li><a href="/kflix/myinquiry" class="dropdown-item">1:1문의</a></li>
						<li><a href="/kflix/service" class="dropdown-item">고객센터</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</header>






	<!-- scripts -->
	<script src="/kflix/resources/js/main/header.js"></script>
	<script type="text/javascript">
	

		search = document.getElementById('search');

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

	
	 if(${login.ticket_id} == null || ${login.ticket_id} == 0){
			$(".header_container").css("top", "45px");
			$(".header_ticket").css("display", "block");
	 }else{
	 		$(".header_ticket").css("display", "none");
	 }
	 
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

 	//모달 띄우기
	function modal(id){
		var z_index = 9999;
		var modal = document.getElementById(id);

		//모달 뒤에 배경 어두워지게하기
		var bg = document.createElement('div');
		bg.setStyle({
			position: 'fixed',
	        zIndex: z_index,
	        left: '0px',
	        top: '0px',
	        width: '100%',
	        height: '100%',
	        overflow: 'auto',
	        backgroundColor: 'rgba(0,0,0,0.7)',
		    transition : 'all 0.6s'
		});

		document.body.append(bg);

		//모달부분 이외 클릭시 모달 꺼지기
		$(document).mouseup(function (e){
			var modal_area = $('#ticket_modal');
			
			  if(modal_area.has(e.target).length === 0){
					bg.remove();
					modal_area.css("display", "none");
			  }
			});

		//실제 모달 내용있는 부분
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
		        webkitTransform: 'translate(-50%, -50%)',
		        	transition : 'all 0.6s'
		});

	}

	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};


	//요금표 tr 마우스 오버시 색 변경하기
	$("#ticket_table .tr_class").hover(function() {
		$(this).css("color","red");
	}, function(){
		$(this).css("color","white");
	});

	//요금표 클릭 이벤트
    $("#ticket_table .tr_class").click(function(){     

    	$(this).css("color","red").css("font-weight", "bold");
    	
        var str = ""
        var tdArr = new Array();    // 배열 선언
            
        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();

        // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        console.log("클릭한 Row의 모든 데이터 : "+tr.text());
                
        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });

        // input태그 값 넣어주기
		$("#ticket_id").val(tdArr[0]);
		$("#ticket_name").val(tdArr[1]);
		$("#ticket_price").val(tdArr[2]);

    });

	//구매 버튼 마우스오버시 효과주기
    $("#buy_btn").hover(function() {
		$(this).css("backgroundColor","red").css("border-color","red");
	}, function(){
		$(this).css("backgroundColor","transparent").css("border-color","white");
	});

   	//구매버튼 클릭시 구매페이지 이동
    function kakaopay() {
		var form = document.getElementById('form');

		/* alert($("#ticket_id").val());
		alert($("#ticket_name").val());
		alert($("#ticket_price").val()); */
		
		form.submit();
	}
   	
    var newmovie_update = document.getElementById('newmovie_update');
   	
    newmovie_update.addEventListener("click", function(e) {
		var data = {
			email : "${login.email}",
			alarm_date : "${today}",
			alarm_count : 0
		}

		var xhttp = new XMLHttpRequest();

		xhttp.open('Post', '/kflix/rest/newmovie', true);
		xhttp.setRequestHeader('content-type', 'application/json');
		xhttp.send(JSON.stringify(data));
	});

	</script>

</body>

</html>