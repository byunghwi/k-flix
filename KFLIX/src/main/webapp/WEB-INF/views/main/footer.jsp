<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
<style>
footer {
	position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    padding: 15px 0;
    color: white;
    z-index: 0;
}

.logo_footer {
	padding-left: 1rem;
	text-decoration: none;
	text-align: center;
	line-height: 3rem;
	font-size: 3rem;
	display: inline;
}

.logo_footer a img {
	height: 1em;
    padding: 10px 5px;
    position: absolute;
    display: block;
    margin-left: 10px;
}

.footer_content {
	display: block;
    margin-left: 15px;
    font-size: 0.8rem;
    color: gray;
}

.footer_content a {
	text-decoration: none;
	color: white;
}
</style>
</head>
<body>

<footer>
<div>
	<div class="logo_footer">
		<a href="/kflix/browse"><img
			src="/kflix/resources/imgs/watch/kflixlogo.png" alt="NETFLIX">
		</a>
	</div>

	<div class="footer_content">
		<a href="/kflix/service">고객센터</a>
		<br>
		KFLIX Copyright ⓒ 2021 by KFLIX, Inc. All rights reserved.
	</div>
</div>
</footer>

<script>
/* $(function(){
	stickyFooter();

	//$(window).scroll(stickyFooter).resize(stickyFooter);
});


function stickyFooter(){
	document_height = $(document).height(); // 문서 전체 높이
	document_scrollTop = $(document).scrollTop(); // 문서 전체 높이 중 스크롤 위치
	window_height = $(window).height(); // 창 높이
	footer_height = $("footer").height();

	//alert("문서전체높이:" + document_height + " , 스크롤위치:" + document_scrollTop + ", 창 높이:" + window_height + ", footer_height:" + footer_height);

	bottom = document_height - footer_height - window_height; 


	$("footer").css("bottom", bottom+"px");

}  */

</script>
</body>
</html>