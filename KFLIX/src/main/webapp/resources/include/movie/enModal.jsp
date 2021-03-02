<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal" tabindex="-1" id="deletemodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-danger">
        <h5 class="modal-title text-light">삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body">
	        <p>정말 삭제 하시겠습니까?</p>
	      </div>
          <div class="modal-footer">
          	<input type="hidden" id="deleteid" name="movie_id"/>
	        <button onclick="deleteBtn(1);" class="btn btn-danger">삭제</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	     </div>
      </div>
    </div>
  </div>
  
  <div class="modal" tabindex="-1" id="deleteconfirm">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-danger">
        <h5 class="modal-title text-light">삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body">
	        <span id="deleteMsg"></span>
	      </div>
          <div class="modal-footer">
          	<input type="hidden" id="recoveryid" name="movie_id"/>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	     </div>
      </div>
    </div>
  </div>
  

<div class="modal" tabindex="-1" id="infoconfrim">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-danger">
        <h5 class="modal-title text-light">정보!!</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
	     <span id="alertMsg"></span>
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>