<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String rs = request.getServletPath();
			
	String path = rs.substring(rs.lastIndexOf('/'), rs.indexOf(".jsp"));
%>
<!DOCTYPE html>

<c:url var="nextHref" value=".<%=path %>?page=${page.startPage - page.size}&amount=${page.amount}" />
<c:url var="preHref" value=".<%=path %>?page=${page.startPage + page.size}&amount=${page.amount}" />

<nav aria-label="...">
  <ul class="pagination justify-content-center">                
          <li class="page-item<c:if test="${not page.prev }"> disabled</c:if>">
             <a class="page-link" href="${nextHref}" tabindex="-1" aria-disabled="true">&laquo;</a>
          </li>
          <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">                                
              <li class="page-item<c:if test="${page.currPage eq i }"> active</c:if>" aria-current="page">
                 <c:if test="${i > 0}" ><a class="page-link" href=".<%=path %>?page=${i }&amount=${page.amount}">${i }</a></c:if>
              </li>                                
          </c:forEach>
          <li class="page-item<c:if test="${not page.next || page.endPage eq page.lastPage}"> disabled</c:if>">
              <a class="page-link" href="${preHref}" tabindex="-1" aria-disabled="true">&raquo;</a>
          </li>    
    </ul>
</nav>