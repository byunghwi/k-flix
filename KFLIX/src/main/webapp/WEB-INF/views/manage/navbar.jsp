<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#sidebar{
		width: 300px;
		height: 100%;
		background-color: rgb(20,20,20);
		position: fixed;
		left: -290px;
		z-index: 1;
		transition: all .35s;
		padding: 0;
		margin: 0;
	}

	#closeMenu{
		display: none;
	}
	
	#closeMenu+label{
		background-color: rgb(20,20,20);
		display: block;
		width: 10px;
		height: 60px;
		position: fixed;
		cursor: pointer;
		border-bottom-right-radius: 10px;
		border-top-right-radius: 10px;
		left: 10px;
		top: 50%;
		transition: all .35s;
	}
	#closeMenu+label span{
		display: block;
		position: absolute;
		width: 80%;
		height: 2px;
		border-radius: 30px;
		background-color: lightgray;
		transition: all .35s;
		padding-left: 10%;
	}
	
	#closeMenu + label span:nth-child(1){
		top: 45%;
		transform: translateY(-50%) rotate(45deg);
	}
	#closeMenu + label span:nth-child(2){
		top: 50%;
		transform: translateY(50%) rotate(-45deg);
	}

	#closeMenu:checked + label span:nth-child(1){
		top: 45%;
		transform: translateY(-50%) rotate(143deg);
	}
	#closeMenu:checked + label span:nth-child(2){
		top: 50%;
		transform: translateY(50%) rotate(-143deg);
	}

	#closeMenu:checked + label + div{
		left: 0;
	}
	
	#closeMenu:checked + label{
		z-index: 2;
		left: 300px;
	}
	
	#logoImg{
		width: 220px;
		height: 80px;
		padding-left: 80px;
		padding-top: 30px;
		margin-bottom: 20px;
	}
	
	#navlist a{
		color: white;
		letter-spacing: 0.5rem;
		margin-left: 40px;
		margin-bottom: 10px;
		font-size: 20px;
		font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;
	}

	.dropdown-menu-kflix{
		background-color: rgb(20,20,20);
		margin-left: 20px;
		font-size: 15px;
		letter-spacing: 0.5rem;
		font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;
	}
	
	.nav-link {
		display: inline-table;
		position: relative;
		overflow: hidden;
	}

	.nav-link::after{
		content: '';
		display: block;
		width: 100%;
		height: 4px;
		background-color: red;
		position: absolute;
		bottom:0;
		left: -100%;
		transform: translateY(50%);
		transition: all .35s;
		z-index:1;
	}
	
	.nav-link:hover::after{
		left: 0;
	}
	
	.nav-clicked{
		content: '';
		display: block;
		width: 100%;
		height: 4px;
		left: 0;
		background-color: red;
		position: absolute;
		bottom:0;
		transform: translateY(50%);
	}
	
</style>
<input type="checkbox" id="closeMenu" checked/>
 <label for="closeMenu">
 	<span></span>
 	<span></span>
 </label>
<div id="sidebar">
	<div id="logo">
		<img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="logoImg" alt="" />
	</div>
	<hr style="color: gray;"/>
	<div class="wrapper">
		<ul id="navlist" type="none">
		  <li class="nav-item">
		    <a class="nav-link" id="movie" aria-current="page" href="/kflix/movie/movieindex"><i class="fas fa-video"></i> 영화</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="genre" href="/kflix/genre/genreindex"><i class="far fa-list-alt"></i> 장르</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="director" href="/kflix/director/directorindex"><i class="fas fa-bullhorn"></i> 감독</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="actor" href="/kflix/actor/actorindex"><i class="fab fa-redhat"></i> 배우</a>
		  </li>
           <li>
           	<a class="nav-link" id="FAQ" href="/kflix/FAQ/index"><i class="far fa-question-circle"></i> FAQ</a>
           </li>
           <li>
           	<a class="nav-link" id="inq" href="/kflix/inquiry/index"><i class="far fa-envelope"></i> 1:1문의</a>
           </li>
  	</div>
</div>