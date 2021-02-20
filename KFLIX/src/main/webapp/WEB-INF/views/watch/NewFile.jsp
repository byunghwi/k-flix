<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/kflix/resources/css/watch/csstest.css">
</head>
<body>


	<input type="checkbox" id="popup">
	<label for="popup">View</label>
	<div>
		<div>
			<label for="popup"></label>
		</div>
		<label for="popup"></label>
	</div>


	<div class="slide_wrapper_Watching">

		<ul class="slides_Watching">
			<c:forEach items="${watch }" var="watch" varStatus="status">
				<c:forEach items="${Allmovie }" var="Allmovie" varStatus="status">
					<c:if test="${watch.movie_id eq Allmovie.movie_id }">
						<li><a class="atag"
							href="<%=application.getContextPath()%>/browse/${Allmovie.movie_id }">
								<div class="atagdiv">
									<img style="margin: 0;" src="${Allmovie.poster_path }"
										class="d-block dis img1" alt="...">
									<div class="videohover">
										<video class="video" muted autoplay loop
											poster="${Allmovie.poster_path}">
											<source src="${Allmovie.teaser_path}" type="video/mp4">
										</video>
									</div>
								</div>

						</a></li>


					</c:if>
				</c:forEach>
			</c:forEach>
		</ul>

	</div>
	<p class="controls_Watching">
		<span class="prev_Watching">prev</span> <span class="next_Watching">next</span>
	</p>


	<script src="/kflix/resources/js/watch/jstest.js"></script>






</body>
</html>