<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href=//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css>
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<meta charset="UTF-8">
<style>
	#dashboard{
		width: 1500px;
		height: 1000px;
		margin-left: 330px;
	}
/* 	section, section div{
		border: 1px dotted red;
	} */
	#movie_total{
		width: 300px;
		height: 150px;
 		background-color: rgb(64,127,255);
	  	border-radius: 15px;
	}
	#movieMore{color: rgb(64,127,255);}
	
	
	#inq_total{
		width: 300px;
		height: 150px;
	  	background-color: rgb(74,193,35);
	 	border-radius: 15px;
	}
	#inqMore{color: rgb(74,193,35);}
	
	#mem_total{
		width: 300px;
		height: 150px;
	  	background-color: rgb(250,212,23);
	 	border-radius: 15px;
	}
	#memMore{color: rgb(250,212,23);}
	
	#pay_total{
		width: 300px;
		height: 150px;
	  	background-color: rgb(234,65,65);
	 	border-radius: 15px;
	}
	#payMore{color: rgb(234,65,65);}
	
	.morediv{
		background-color: rgb(185,185,185);
		border-bottom-left-radius: 15px;
		border-bottom-right-radius: 15px;
		padding-top: 7px;
	}
	
	.moreBtn{
		text-decoration: none;
		font-weight: bolder;
		font-size: 20px;
		margin-bottom: 7px;
	}
	
	.total_title{
		text-align: right;
		margin-right: 15px;
		padding-top: 15px;
		color: white;
	}
	
	.boardicon{
		font-size: 70px;
		margin-top: 10px;
		margin-left: 20px;
		color: white;
	}
	
	.tackicon{
		transform: rotate(320deg);
		color: rgb(206,236,24);
	}

	.rankingnum{
		width: 50px;
		height: 100%;
		color: red;
	}
	.rankingOne{
		width: 150px;
		height: 100px;
	}
	
	.rankingAnother{
		width: 120px;
		height: 80px;
	}
	
	.rankingtitle{
		width: 250px;
	}
	
	#first{
		left: 0;
		padding: 0;
		margin: 0;
		width: 1500px;
	}
	.total_content{
		height: 80%;
	}

	.totalArea{
		padding-right: 20px;
	}
	.contentArea{
		background-color: rgb(255,255,240);
		border-radius: 10px;
	}
</style>
<title>Insert title here</title>
</head>
<body>

<%@include file="../manage/navbar.jsp"%>
<section id="dashboard">

<div id="section_title pt-5">
	<h1><i class="fas fa-chess-board"></i> 대시보드</h1>
</div>

<div class="container-lg w-100 ps-3 contentArea" id="first">

	<h3><i class="fas fa-thumbtack tackicon"></i> 정보</h3>
	<hr />
	<div class="d-flex pb-5">
	  <div class="totalArea">
	      	<div id="movie_total">
	      		<div class="d-flex justify-content-between">
			      	<div class="boardicon">
			      		<i class="fas fa-video"></i>
			      	</div>
					<div class="total_content">
						<h3 class="total_title">영화</h3>
						<h4 class="total_title">${movieTotal } 편</h4>
					</div>
				</div>
				<div class="d-flex justify-content-center morediv">
					<a href="#" class="moreBtn" id="movieMore"> more >> </a>
				</div>
			</div> 
		</div>
		
	  <div class="totalArea">
	      	<div id="inq_total">
				<div class="total_content">
		   			<div class="d-flex justify-content-between">
				      	<div class="boardicon">
				      		<i class="far fa-envelope"></i>
				      	</div>
						<div class="total_content">
							<h3 class="total_title">문의</h3>
							<h4 class="total_title">${inqTotal } 건</h4>
						</div>
					</div>
				</div>	
				<div class="d-flex justify-content-center morediv">
					<a href="#" class="moreBtn" id="inqMore"> more >> </a>
				</div>
			</div>
	  </div>
	  
	  <div class="totalArea">
	      	<div id="mem_total">
				<div class="total_content">
		   			<div class="d-flex justify-content-between">
				      	<div class="boardicon">
				      		<i class="fas fa-users"></i>
				      	</div>
						<div class="total_content">
							<h3 class="total_title">회원 수</h3>
							<h4 class="total_title">${memTotal } 명</h4>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center morediv">
					<a href="#" class="moreBtn" id="memMore"> more >> </a>
				</div>
			</div> 
	  </div>
	  
	  <div class="totalArea">
	      	<div id="pay_total">
				<div class="total_content">
					<div class="d-flex justify-content-between">
				      	<div class="boardicon">
				      		<i class="fas fa-money-check"></i>
				      	</div>
						<div class="total_content">
							<h3 class="total_title">매출</h3>
							<h4 class="total_title"><fmt:formatNumber value="${inqTotal }" type="currency"/></h4>
						</div>
					</div>
				</div>	
				<div class="d-flex justify-content-center morediv">
					<a href="#" class="moreBtn" id="payMore"> more >> </a>
				</div>
			</div>
	  </div>
  
 </div>
</div>

<div class="d-flex pt-3">

	<div class="pe-5 ps-3 contentArea">
		<h3><i class="fas fa-thumbtack tackicon"></i> 현재 Top5</h3>
		<hr />
		<c:forEach items="${movie }" var="i" varStatus="status">
			<c:choose>
			<c:when test="${status.index == 0 }">
				<div class="d-flex pb-2">
					<div class="rankingnum">
						<h1>${status.index + 1}</h1>
					</div>
					<div class="rankingtitle">
						<h1>${i.movie_title }</h1>
					</div>
					<div class="rankingOne">
						<img src="${i.poster_path }" class="rankingOne" alt="" />
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="d-flex pb-2 ps-3">
					<div class="rankingnum">
						<h3>${status.index + 1}</h3>
					</div>
					<div class="rankingtitle">
						<h3>${i.movie_title }</h3>
					</div>
					<div class="rankingAnother">					
						<img src="${i.poster_path }" class="rankingAnother" alt="" />
					</div>
				</div>
			</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	
	<div class="px-3">
	<div class="px-3 contentArea">
		<h3><i class="fas fa-thumbtack tackicon"></i> 이용권 결제 현황</h3>
		<hr />
		<div>
			<canvas id="ticketChart" height="300px" width="400px"></canvas>
		</div>
	</div>
	</div>
</div>


</section>


<%@ include file="/resources/include/movie/alertModal.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
<script src="/kflix/resources/js/movie/alertCustom.js?ver=10"></script>
<script>
$(document).ready(function() { 
	$('#manage').prepend('<span class="nav-clicked"></span>');
	$.ajax({
		type: "GET",
		url: "/kflix/ticketChart",
		contentType: 'application/json',
		success: function(data){
			var ctx = $('#ticketChart');
			var labelList = new Array();
			var dataList = new Array();
			
			for(var i = 0; i < data.length; i++){
				labelList[i] = data[i].ticket_name; 
				dataList[i] = data[i].ticket_using;
			}
			
			new Chart(ctx, {
			    type: 'horizontalBar',
			    data: {
			        labels: labelList,
			        datasets: [{
			        	label: '이용권 수',
			            data: dataList,
			            backgroundColor: 'rgb(250,89,89)',
			            borderColor: 'rgb(250,89,89)',
			            barThickness: 40
			        }]
			    },
			    options: { 
			    	maintainAspectRatio : false,
		            responsive: false,
		            scales: {
						xAxes: [{
							ticks: {
								stepSize : 100,
								fontSize : 14
							}
						}]
					},
					plugin: {
						render: 'value'
					}

			    }
			});
			
		},
		error: function(){},
		complete: function(){}
	}) 

});

</script>
</body>
</html>