<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" 
		integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css?ver=1" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#contents{
	width: 1400px;
	height: 1000px;
	margin-left: 350px;
	padding-top: 65px;
}
body {
	background-color: lightgray;
}
.chartArea{
	color:white;
	background-color: rgba(85,85,85, 0);
	border-radius: 5px;
}
</style>

<%@include file="/WEB-INF/views/main/header.jsp"%>
<body>

<%@include file="../manage/navbar.jsp"%>

<div id="contents" class="container-xl">
	<div class="pt-5 pb-3">
		<h1 class="text-light">차트</h1>
	</div>

	<div class="row h-50">
	    <div class="col-lg-6">	
		    <div class="chartArea pb-3">
			    <div class="ps-2 pt-2">
			    	<h5><i class="fas fa-chart-pie"></i> 장르별 영화 분포</h5>
			    </div>
		    	<hr />
				<canvas class="ps-5" id="myChart" width="450" height="350"></canvas>
			</div>
		</div>
	
		<div class="col-lg-6 chartArea">
		   	<div>
		    	<h5><i class="fas fa-chart-bar"></i>그래프1</h5>
		   	</div>
		</div>
	</div>
	  
	<div class="row">
	  <div class="col-lg chartArea">
	  	<div>
	  		<h5><i class="fas fa-chart-line"></i>그래프2</h5>
	  	</div>
	  </div>
	  
	  <div class="col-lg chartArea">
	  	<div>
	  		<h5><i class="fas fa-chart-line"></i>그래프2</h5>
	  	</div>
	  </div>
	  
	  <div class="col-lg chartArea">
	  	<div>
	  		<h5><i class="fas fa-chart-bar"></i>그래프2</h5>
	  	</div>
	  </div>
	</div>
	
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/kflix/resources/js/movie/alertCustom.js?ver=30"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
<script>
var label_list = new Array();
var data_list = new Array();
var bc_list = new Array();
var color = ['#0091ff', '#209fff', '#51b4ff', '#86cbfe', '#bae1ff', '#d7baff', '#bf91fd'];
var ctx = document.getElementById('myChart').getContext('2d');

$( document ).ready(function() {
	$('#chart').prepend('<span class="nav-clicked"></span>');
	$.ajax({
		type: "GET",
		url: "/kflix/chartRest",
		contentType: 'application/json',
			success: function(data){
				for (var i = 0; i < data.genre.length; i++) {
					bc_list[i] = color[Math.round(Math.random() * (color.length - 1))];
					data_list[i] = 0;
					label_list[i] = data.genre[i].genre_name;	
				} 
				
				for (var j = 0; j < data.movie.length; j++){
					data_list[label_list.indexOf(data.movie[j].genre_name1)] += 1;
					data_list[label_list.indexOf(data.movie[j].genre_name2)] += 1;
				}
				
				var chart = new Chart(ctx, {
				    type: 'pie',
				    data: {
				        labels: label_list,
				        datasets: [{           
				            backgroundColor: bc_list,
				            data: data_list,
				            borderWidth:1,
				            borderColor: 'black'
				        }]
				    },
				    options: { 
				    	maintainAspectRatio : false,
			            responsive: false,
			            legend: {
			                display: false
			            },
				    	plugins: {
					    	  	labels: [
				    	  			{   render: 'label',
				    		      	    fontSize: 10,
				    		      	    fontStyle: 'bold',
				    		      	    fontColor: 'white',
				    		      	    precision: 2
				    		    	}, 
				    		    	{
					    		      	render: 'percentage',
				    		      		position: 'outside',
					    		      	fontSize: 10,
				    		      	    fontStyle: 'bold',
				    		      	    fontColor: 'white',
				    		      	    precision: 2
					    		    }
				    			]
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