<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	#nav_bar{
		background-color: rgb(48,53,55);
		height: 100%;	
		width: 250px;
		position: fixed;
		/* float: left; */
		padding: 0;
		margin: 0;
	}
	
	#navlist a{
		color: white;
		letter-spacing: 1em;
	}
	
	a b{
		font-size: 30px;
		color: red;
		letter-spacing: 0.5em;
		padding-left: 40px;
	}
	
	/* 게시판 설정 후에 css로 옮기기 */
	#board {
		height: 100%;
	}
	
</style>
<nav id="nav_bar" class="float-md-start">
	<ul class="nav flex-column" id="navlist">
	  <li class="nav-item">
	    <a class="nav-link" id="movie" aria-current="page" href="#"><b>KFLIX</b></a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" id="movie" aria-current="page" href="/kflix/movie/movieindex"><i class="fas fa-video"></i> 영화</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="genre" href="/kflix/genre/genreindex"><i class="far fa-list-alt"></i> 장르</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="director" href="#"><i class="fas fa-bullhorn"></i> 감독</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="actor" href="#"><i class="fab fa-redhat"></i> 배우</a>
	  </li>
	</ul>
</nav>