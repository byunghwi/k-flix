<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
	#recoveryconfrim,#recoverymodal{width: 300px; left:calc(50% - 190px); top:200px;}
	.modal-content{background-color: #212529; color:white;};
	.modal-body{text-align: center; font-size:1.25rem}
	.modal-footer{border-top: 0;}
</style>
<div class="modal" tabindex="-1" id="recoverymodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header border-secondary">
        <h5 class="modal-title text-light">활성화</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body">
	        <p>활성화 하시겠습니까?</p>
	      </div>
          <div class="modal-footer">
	          	<input type="hidden" id="recoveryid" name="genre_id"/>
		        <button onclick="recoveryBtn(1);" class="btn btn-danger btn-sm" >활성화</button>
	        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
	     </div>
      </div>
    </div>
  </div>
  
<div class="modal" tabindex="-1" id="recoveryconfrim">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header border-secondary">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
	      활성화되었습니다.
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>
