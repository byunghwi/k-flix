<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div id="pagenate">
	<nav aria-label="...">
	  <ul class="pagination justify-content-center">                
	          <li class="page-item<c:if test="${not page.prev }"> disabled</c:if>">
	             <a class="page-link bg-dark text-light" id="pre" tabindex="-1" aria-disabled="true">&laquo;</a>
	          </li>
	          
	          <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">                                
	              <li class="page-item<c:if test="${page.currPage eq i }"> active</c:if>" aria-current="page">
	                 <c:if test="${i > 0}" >
	                 	<button class="page-link bg-dark text-light" id="pnum${i }" onclick="pageClick(${i});">${i }</button>
	                 </c:if>
	              </li>                                
	          </c:forEach>
	          
	          <li class="page-item<c:if test="${not page.next || page.endPage eq page.lastPage}"> disabled</c:if>">
	              <a class="page-link bg-dark text-light" id="next" tabindex="-1" aria-disabled="true">&raquo;</a>
	          </li>    
	    </ul>
	</nav>
</div>