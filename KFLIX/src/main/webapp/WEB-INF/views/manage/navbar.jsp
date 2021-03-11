<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
   #sidebar{
      width: 300px;
      height: 83%;
      background-color: rgba(0, 0, 0, 0.2);
      position: fixed;
      left: -290px;
      z-index: 1;
      transition: all .35s;
      padding: 0;
      margin: 0;
      margin-top: 60px;
   }

   #closeMenu{
      display: none;
   }
   
   #closeMenu+label{
      background-color: rgba(0, 0, 0, 0.2);
      display: block;
      width: 10px;
      height: 60px;
      position: fixed;
      cursor: pointer;
      border-bottom-right-radius: 10px;
      border-top-right-radius: 10px;
      left: 10px;
      top: 40%;
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

   #navlist a{
      color: white;
      letter-spacing: 0.5rem;
      margin-left: 40px;
      margin-bottom: 10px;
      font-size: 20px;
      font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;
   }
   
   .navLink {
      display: inline-table;
      position: relative;
      overflow: hidden;
      text-decoration: none;
   }

   .navLink::after{
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
   
   .navLink:hover::after{
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
   .wrapCustom{
   	  	padding-top: 20px;
   }
   
   .navCatalog{
		padding-bottom: 20px;
		padding-left: 30px;
		
   }
</style>
<input type="checkbox" id="closeMenu" checked/>
 <label for="closeMenu">
    <span></span>
    <span></span>
 </label>
<div id="sidebar">
   <div class="wrapCustom">
      <ul id="navlist" type="none">
         <li class="navCatalog">
          <a class="navLink" id="manage" aria-current="page" href="/kflix/management"><i class="fas fa-chess-board"></i> 대시보드</a>
        </li>
        <li class="navCatalog">
          <a class="navLink" id="movie" aria-current="page" href="/kflix/movie/movieindex"><i class="fas fa-video"></i> 영화</a>
        </li>
        <li class="navCatalog">
          <a class="navLink" id="genre" href="/kflix/genre/genreindex"><i class="far fa-list-alt"></i> 장르</a>
        </li>
        <li class="navCatalog">
          <a class="navLink" id="director" href="/kflix/director/directorindex"><i class="fas fa-bullhorn"></i> 감독</a>
        </li>
        <li class="navCatalog">
          <a class="navLink" id="actor" href="/kflix/actor/actorindex"><i class="fab fa-redhat"></i> 배우</a>
        </li>
        <li class="navCatalog">
          <a class="navLink" id="member_" href="/kflix/memberindex"><i class="far fa-user"></i> 회원</a>
        </li>
		<li class="navCatalog">
          <a class="navLink" id="ticket_" href="/kflix/ticketindex"><i class="fas fa-ticket-alt"></i> 이용권</a>
        </li>
        <li class="navCatalog">
           <a class="navLink" id="FAQ" href="/kflix/FAQ/index"><i class="far fa-question-circle"></i> FAQ</a>
        </li>
        <li class="navCatalog">
           <a class="navLink" id="inq" href="/kflix/inquiry/index"><i class="far fa-envelope"></i> 1:1문의</a>
        </li>
        <li class="navCatalog">
           <a class="navLink" id="chart" href="/kflix/chart"><i class="fas fa-chart-area"></i> 분석</a>
        </li>        
     </div>
</div>