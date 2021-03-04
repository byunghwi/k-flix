<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	추가 모달 
-->
<div class="modal" tabindex="-1" id="addmodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-success">
        <h5 class="modal-title text-light">추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
      <div class="d-flex justify-content-center">
	      <div class="input-group mb-3 input_text">
	      	<span class="input-group-text" id="inputGroup-sizing-sm">배우이름</span>
	  		<input type="text" class="form-control" name="actor_name" id="addActor"
	  				aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	  </div>
	  </div>     
	   
	      <div class="modal-footer">
        	<button onclick="addBtn(1);" class="btn btn-success">등록</button>
        	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
          </div>    
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="addconfrim">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-success">
        <h5 class="modal-title text-light">추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
	      추가되었습니다.
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-success" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>


<!-- 
	수정 모달 
-->
<div class="modal" tabindex="-1" id="updatemodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title text-light">수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="d-flex justify-content-center">
	      <div class="input-group mb-3 input_text">
	      	<span class="input-group-text" id="inputGroup-sizing-sm">배우이름</span>
	  		<input type="hidden" id="update_id" name="actor_id" value=""/>
	  		<input type="text" class="form-control" name="actor_name" id='updateActor'
	  				aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	      </div>
        </div>	
   		<div class="modal-footer">
   			<button onclick="updateBtn(1);" class="btn btn-primary" >수정</button>
        	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>    
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="updateconfrim">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title text-light">수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
	      수정되었습니다.
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>



<!-- 
	비활성화 모달 
-->
<div class="modal" tabindex="-1" id="deletemodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-danger">
        <h5 class="modal-title text-light">비활성화</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body">
	        <p>정말 비활성화 하시겠습니까?</p>
	      </div>
          <div class="modal-footer">
	          	<input type="hidden" id="deleteid" name="actor_id" value=""/>
		        <button onclick="deleteBtn(1);" class="btn btn-danger" >비활성화</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	     </div>
      </div>
    </div>
  </div>
  
<div class="modal" tabindex="-1" id="deleteconfrim">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-danger">
        <h5 class="modal-title text-light">비활성화</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
	      비활성화되었습니다.
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>

