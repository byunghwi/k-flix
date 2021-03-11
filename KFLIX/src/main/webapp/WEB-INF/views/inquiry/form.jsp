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
<link rel="stylesheet" type="text/css" href=//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css>
<link rel="stylesheet" href="/kflix/resources/css/movie/alert.css" />
<meta charset="UTF-8">
<style>
	body {
		background-color: rgb(20,20,20);
	}
	
	#inquirtForm{
		width: 700px;
		color:white;
		margin-left: calc(50% - 350px);
		padding-top: 85px;
	}
	
	#byteInfo{
		font-weight: bolder;
	}
	
	h1 {
		text-align: center;
	}
	
	h5 class="px-2" {
		
	}
	.wrapper {
	
		position:relative;
	
	    min-height:100%;

	}
</style>
<title>문의하기</title>
<link rel="icon" href="/kflix/resources/imgs/main/Favicon.png">
<link rel="shortcut icon" href="/kflix/resources/imgs/main/Favicon.png">
</head>
<body>

<div class="wrapper">

<%@include file="/WEB-INF/views/main/header.jsp"%>
<!-- 문의하기 폼  -->
<div id="inquirtForm">
	<form action="./inquiry" method="post" id="sendForm">
	<div class="py-3">
		<h1>1:1문의하기</h1>
	</div>
	
	<div class="pb-2">
		<h5 class="px-2">보내시는 분</h5>
		<div class="px-4">
			<input type="text" class="form-control" name="email" id="email" value="${loginEmail }" required readonly aria-label="Username" aria-describedby="form_eamil">
		</div>			
	</div>
	
	<div class="pb-2">
		<h5 class="px-2">카테고리</h5>
		<div class="px-4">
		  	<select class="form-select" id="inquiry_type" name="inquiry_type" required>
				<c:forEach items="${constraint }" var="i" begin="0" end="${constraint.size()}" varStatus="status">
					 <option>${i }</option>
				</c:forEach>
		  	</select>
		</div>
	</div>
	
	<div>
		<h5 class="px-2">제목</h5>
		<div class="px-4">
		  	<input type="text" class="form-control" onKeyUp="titleByteChk(this);" placeholder="100Byte 이내" 
		  		id="inquiry_title"	name="inquiry_title" aria-label="Username" aria-describedby="form_title">
			<div class="d-flex justify-content-end mb-3">
			  <span id="titleByteInfo"></span>
			</div>
		</div>
	</div>
	
	<div>
		<h5 class="px-2">문의 내용</h5>
		<div class="px-4">
		  	<textarea class="form-control" id="inquiry_content" name="inquiry_content" onKeyUp="contByteChk(this);" rows="10" 
		  			placeholder="4000Byte 이내" style="resize: none;" aria-label="With textarea"></textarea>
			<div class="d-flex justify-content-end">
			  <span id="contentByteInfo"></span>
			</div>
		</div>
	</div>
	
	<div class="d-flex justify-content-end px-4 py-3">
		<div>
			<input type="submit" value="보내기" class="btn btn-secondary"/>
			<a onclick="cancleBtn();" class="btn btn-danger">취소</a>
		</div>
	</div>
	</form>
</div>

<%@ include file="/resources/include/movie/alertModal.jsp" %>
<%@include file="/WEB-INF/views/main/footer.jsp"%>
</div>

<div class="modal" tabindex="-1" id="loading_modal">
  <div class="modal-dialog">
    <div class="modal-content bg-dark">
      <div class="modal-header border-secondary">
      	<img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
      </div>
      
      <div class="modal-body text-light fs-5" id="alertBody">
	     <div class="fa-5x"><i class="fas fa-spinner fa-spin"></i></div><span>접수 중...</span>
	  </div>       
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.js" 
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
		crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" 
		crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/kflix/resources/js/movie/alertCustom.js?ver=10"></script>
<script>
var mail = $('#email');
var type = $('#inquiry_type');
var title = $('#inquiry_title');
var content = $('#inquiry_content');

function cancleBtn() {
	window.history.back();
}

$('document').ready(function(){
	document.getElementById('titleByteInfo').innerText = '0 / 100';
	document.getElementById('contentByteInfo').innerText = '0 / 4000';
	window.history.forward();
})

$('#sendForm').submit(function(){
	
	if (title.val() == '') {
		infoMsg("제목을 입력 해주세요");
		return false;
	} else if (content.val() == '') {
		infoMsg("내용을 입력 해주세요");
		return false;
	} else {
		$('#loading_modal').modal({backdrop: 'static', keyboard: false});
		$('#loading_modal').modal("show");
	}

})

function titleByteChk(e) {

	var str = e.value;
	var str_len = str.length;
	
	var max_byte = 100;
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";

    for(var i=0; i<str_len; i++) {
        one_char = str.charAt(i);
        
        if(escape(one_char).length > 4){
            rbyte += 2;                                         //한글2Byte
        } else {
            rbyte++;                                            //영문 등 나머지 1Byte
        }

        if(rbyte <= max_byte) {
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
	
    if(rbyte > max_byte) {
		infoMsg("메세지는 최대 " + max_byte + "byte를 초과할 수 없습니다.")
		str2 = str.substr(0,rlen);                                  //문자열 자르기
		e.value = str2;
		
		titleByteChk(e);
		
    } else {
    	
       document.getElementById('titleByteInfo').innerText = rbyte + ' / ' + max_byte;
    }
}


function contByteChk(e) {
	
	var str = e.value;
	var str_len = str.length;
	
	var max_byte = 4000;
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";
    
    for(var i=0; i<str_len; i++) {
        one_char = str.charAt(i);
        
        if(escape(one_char).length > 4){
            rbyte += 2;                                         //한글2Byte
        } else {
            rbyte++;                                            //영문 등 나머지 1Byte
        }

        if(rbyte <= max_byte) {
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
	
    if(rbyte > max_byte) {
		infoMsg("메세지는 최대 " + max_byte + "byte를 초과할 수 없습니다.")
		str2 = str.substr(0,rlen);                                  //문자열 자르기
		e.value = str2;
		
		contByteChk(e);
		
    } else {
    	
       document.getElementById('contentByteInfo').innerText = rbyte + ' / ' + max_byte;
    }
}
    



</script>
</body>
</html>