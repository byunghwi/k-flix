<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	#infoconfrim{
		width: 500px; left: calc(50% - 250px);
	}
</style>

<div class="modal" tabindex="-1" id="infoconfrim">
  <div class="modal-dialog">
    <div class="modal-content bg-dark">
      <div class="modal-header border-secondary">
      	<img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body text-light fs-5" id="alertBody">
	     <span id="alertMsg"></span>
	  </div>     
	   
      <div class="modal-footer border-top-0">
       	<button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal" id="alertBtn">확인</button>
       </div>    
    </div>
  </div>
</div>