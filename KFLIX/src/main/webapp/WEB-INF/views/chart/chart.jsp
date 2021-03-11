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
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">
</head>

<style>
.wrapper {position:relative; min-height:100%;}
#contents{
   width: 1400px;
   margin-left: 350px;
   padding-top: 20px;
}
body {
   background-color: #141414;
}
.chartArea{
   color:white;
   background-color: rgba(85,85,85, 0);
   border-radius: 5px;
}
#myChartLabel{
   font-size: 12px;
}
.gender{
   width: 350px;
   height: 250px;
}
.genre{
   width: 640px;
   height: 460px;
}
</style>

<body>

<div class="wrapper">
<%@include file="/WEB-INF/views/main/header_admin.jsp"%>
<%@include file="../manage/navbar.jsp"%>


<div id="contents" class="container-xl">
   <div class="pt-5 pb-3">
      <h1 class="text-light">차트</h1>
   </div>

   <div class="row h-50">
       <div class="col-lg-6">   
          <div class="chartArea pb-3 genre">
             <div class="ps-2 pt-2">
                <h5><i class="fas fa-chart-pie"></i> 장르별 영화 분포</h5>
             </div>
             <hr />
             <div class="d-flex ps-0 ms-0">
                <div>
                  <canvas id="myChart" width="400" height="350"></canvas>
               </div>
               <div id="myChartLabel" class="d-flex">
               </div>            
            </div>
         </div>
      </div>
   
      <div class="col-lg-6 chartArea gender">
            <div>
            <div class="ps-2 pt-2">
             <h5><i class="fas fa-chart-pie"></i> 회원 성별 분포</h5>
          </div>
          <hr />
          <div class="d-flex ps-0 ms-0">
             <div>
               <canvas id="genderChart" width="200" height="150"></canvas>
            </div>   
            <div id="genderChartLabel" class="d-flex">
            </div>   
         </div>
            </div>
      </div>
   </div>
     
<!--    <div class="row">
     <div class="col-lg chartArea">
        <div>
           <h5><i class="fas fa-chart-line"></i> 그래프2</h5>
        </div>
     </div>
     
     <div class="col-lg chartArea">
        <div>
           <h5><i class="fas fa-chart-line"></i> 그래프2</h5>
        </div>
     </div>
     
     <div class="col-lg chartArea">
        <div>
           <h5><i class="fas fa-chart-bar"></i> 그래프2</h5>
        </div>
     </div>
   </div> -->
   
</div>
<%@include file="/WEB-INF/views/main/footer.jsp"%>
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

$( document ).ready(function() {
   $('#chart').prepend('<span class="nav-clicked"></span>');
   $.ajax({
      type: "GET",
      url: "/kflix/chartRest",
      contentType: 'application/json',
         success: function(data){
            // 장르별 영화분포 piechart
            var genre_ctx = document.getElementById('myChart').getContext('2d');
            var genre_label_list = new Array();
            var genre_data_list = new Array();
            var genre_bc_list = new Array();
            var color = ['#0091ff', '#209fff', '#51b4ff', '#86cbfe', '#bae1ff', '#d7baff', '#bf91fd'];
            for (var i = 0; i < data.genre.length; i++) {
               genre_bc_list[i] = color[Math.round(Math.random() * (color.length - 1))];
               genre_data_list[i] = 0;
               genre_label_list[i] = data.genre[i].genre_name;   
            } 
            for (var j = 0; j < data.movie.length; j++){
               genre_data_list[genre_label_list.indexOf(data.movie[j].genre_name1)] += 1;
               genre_data_list[genre_label_list.indexOf(data.movie[j].genre_name2)] += 1;
            }             
            pieChart(genre_ctx, genre_label_list, genre_bc_list, genre_data_list);
            makeLabels(genre_label_list, genre_bc_list, genre_data_list, 'myChartLabel');
            
             // 남녀 비율
             var gender_ctx = document.getElementById('genderChart').getContext('2d');
             var gender_label = new Array();
             var gender_color = new Array();
             var gender_data = new Array();
             for (var i =0; i < data.gender.length; i++){
                var name = data.gender[i].gender;
                if (name == 'M'){
                   gender_label[i] = '남자';
                   gender_color[i] = 'rgb(95,159,255)';
                } else if (name == 'F'){
                   gender_label[i] = '여자';
                   gender_color[i] = 'rgb(255,95,95)';
                } else {
                   gender_label[i] = '알수 없음';
                   gender_color[i] = 'rgb(112,255,95)';
                }
                gender_data[i] = data.gender[i].gender_cnt;
             }
             pieChart(gender_ctx, gender_label, gender_color, gender_data);
             makeLabels(gender_label, gender_color, gender_data, 'genderChartLabel');
            
         },
         error: function(){},
         complete: function(){}
    
   })
   

});


let barChart = function (ctx, input_label, input_color, input_data){
   new Chart(ctx,{
      type:'bar',
      data: {
         labels: input_label,
         datasetx: [{
            backgroundColor: input_color,
            data: input_data,
            borderColor: 'rgb(250,89,89)',
            barThickness: 40
         }]
      },
      options: { 
            responsive: false,
            legend: {
               labels: {fontColor: 'rgb(255,255,255)', fontSize:14}
            },
            scales: {
            yAxes: [{
               ticks: {
                  stepSize : 100,
                  fontSize : 14,
                  fontColor : 'rgb(255,255,255)'
               },
               gridLines:{
                  color: 'rgb(255,255,255)',
                  lineWidth:1
               }
            }],
            xAxes: [{
               ticks: {
                  fontSize : 14,
                  fontColor : 'rgb(255,255,255)'
               },
               gridLines:{
                  color: 'rgb(255,255,255)',
                  lineWidth:1
               }
            }]
         },
         plugin: [{
            labels: {
               render: 'value', 
               fontColor: 'rgb(255,255,255)'
            }
         }]

       }
   })
}

let pieChart = function (ctx, input_label, input_color, input_data) {
   /*             var sort_data = new Array();
   for (var i = 0; i <content_len; i++){
      var obj = new Object();
      obj.label = data.genre[i].genre_name;
      obj.cnt = 0;
      obj.color = color[Math.round(Math.random() * (color.length - 1))];
      
      sort_data.push(obj)
   }

   sort_data.sort(function(a,b){
       return b['cnt'] - a['cnt'];
   })
   
   console.log(sort_data); */    
    new Chart(ctx, {
        type: 'pie',
        data: {
              labels: input_label,
              datasets: [{           
                  backgroundColor: input_color,
                  data: input_data,
                  borderWidth:1,
                  borderColor: 'white'
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
                       {
                            render: 'percentage',
                            fontSize: 10,
                             fontStyle: 'bold',
                             fontColor: 'black',
                             precision: 2,
                        fontSize: 10
                       }
                   ]
             }
         }
    });
    

      
};


function makeLabels (input_label, input_color, input_data, div_id) {   
   var content_len = input_label.length;
   var oneUlLine = 20;
   var laben_cnt = parseInt(content_len / oneUlLine) + 1;
   
   
   for (var i = 0; i < laben_cnt; i++){
      $('#'+div_id).append('<ul id="'+div_id+'labels'+ i +'" type="none"></ul>');
      for (var j = 0; j < oneUlLine; j++){
         var label_index = i * oneUlLine + j;
         if(label_index == content_len){
            break;
         }
         
         if(input_data[label_index] == 0){
            $('#'+div_id+'labels'+i).append('<li style="color:red;"><span style="background-color: ' + input_color[label_index] + '; display: inline-block; width: 15px; height: 12px;"></span> <del>' + input_label[label_index] + '</del></li>');
         } else{
            $('#'+div_id+'labels'+i).append('<li><span style="background-color: ' +  input_color[label_index] + '; display: inline-block; width: 15px; height: 12px;"></span> ' + input_label[label_index] + '</li>');
         }
      }
   }
}
</script>
</body>
</html>