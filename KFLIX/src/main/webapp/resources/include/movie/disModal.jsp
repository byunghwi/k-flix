<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
	#deletemodal, #recoveryconfirm{width:380px; left:calc(50% - 190px); top:250px;}
</style>

<div class="modal" tabindex="-1" id="recoverymodal">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body fs-5 text-center">
	        <p>정말 활성화 하시겠습니까?</p>
	      </div>
          <div class="modal-footer border-top-0">
          	<input type="hidden" id="recoveryid" name="movie_id"/>
	        <button onclick="recoveryBtn(1);" class="btn btn-danger btn-sm">활성화</button>
	        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
	     </div>
      </div>
    </div>
  </div>
  
<div class="modal" tabindex="-1" id="recoveryconfirm">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body fs-5 text-center">
	        <span id="recoveryMsg"></span>
	      </div>
          <div class="modal-footer border-top-0">
          	<input type="hidden" id="recoveryid" name="movie_id"/>
	        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">확인</button>
	     </div>
      </div>
    </div>
  </div>
