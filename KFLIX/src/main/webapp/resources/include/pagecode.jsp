<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:url var="nextHref" value="./index?page=${page.startPage - page.size}&amount=${page.amount}" />
<c:url var="preHref" value="./index?page=${page.startPage + page.size}&amount=${page.amount}" />

<nav aria-label="...">
  <ul class="pagination justify-content-center">                
          <li class="page-item<c:if test="${not page.prev }"> disabled</c:if>">
             <a class="page-link" href="${nextHref}" tabindex="-1" aria-disabled="true">&laquo;</a>
          </li>
          <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">                                
                  <li class="page-item<c:if test="${page.currPage eq i }"> active</c:if>" aria-current="page">
                        <a class="page-link" href="./index?page=${i }&amount=${page.amount}">${i }</a>
              </li>                                
          </c:forEach>
          <li class="page-item<c:if test="${not page.next || page.endPage eq page.lastPage}"> disabled</c:if>">
              <a class="page-link" href="${preHref}" tabindex="-1" aria-disabled="true">&raquo;</a>
          </li>    
    </ul>
</nav>