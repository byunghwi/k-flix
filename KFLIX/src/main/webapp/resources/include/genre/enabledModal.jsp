<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	추가 모달 
-->
<style>
	#addmodal{width: 300px; left: 430px; top:80px;}
	#updatemodal,#deletemodal,#addconfirm,#updateconfrim,#deleteconfrim{width: 300px; left:calc(50% - 190px); top:200px;}
	.modal-content{background-color: #212529; color:white;};
	.modal-body{text-align: center; font-size:1.25rem}
	.modal-footer{border-top: 0;}
</style>

<div class="modal" tabindex="-1" id="addmodal">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
        <h5 class="modal-title text-light">추가</h5>
        <button type="button" id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
      <div class="d-flex justify-content-center">
	      <div class="input-group mb-3 input_text">
	      	<span class="input-group-text" id="inputGroup-sizing-sm">장르명</span>
	  		<input type="text" class="form-control" name="genre_name" id="addGenre"
	  				aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	  </div>
	  </div>     
	   
	      <div class="modal-footer border-top-0">
        	<button onclick="addBtn(1);" class="btn btn-danger btn-sm">추가</button>
        	<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
          </div>    
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="addconfrim">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button"  id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body text-center fs-5">
	      추가되었습니다.
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>


<!-- 
	수정 모달 
-->
<div class="modal" tabindex="-1" id="updatemodal">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
        <h5 class="modal-title text-light">수정</h5>
        <button type="button"  id="alertClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="d-flex justify-content-center">
	      <div class="input-group mb-3 input_text d-flex justify-content-end">
	      	<span class="input-group-text" id="inputGroup-sizing-sm">장르명</span>
	  		<input type="hidden" id="update_id" name="genre_id" value=""/>
	  		<input type="text" class="form-control" name="genre_name" id='updateGenre'
	  				aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	  	</div>
	    </div>
        	
   		<div class="modal-footer">
   			<button onclick="updateBtn(1);" class="btn btn-danger btn-sm" >수정</button>
        	<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>    
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" id="updateconfrim">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
       <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body text-center fs-5">
	      수정되었습니다.
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>



<!-- 
	비활성화 모달 
-->
<div class="modal" tabindex="-1" id="deletemodal">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
        <h5 class="modal-title text-light">비활성화</h5>
        <button type="button" id="alertClose"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body text-center fs-5">
	        <p>정말 비활성화 하시겠습니까?</p>
	      </div>
          <div class="modal-footer">
	          	<input type="hidden" id="deleteid" name="genre_id" value=""/>
		        <button onclick="deleteBtn(1);" class="btn btn-danger btn-sm" >비활성화</button>
	        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
	     </div>
      </div>
    </div>
  </div>
  
<div class="modal" tabindex="-1" id="deleteconfrim">
  <div class="modal-dialog">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
        <img src="<%=request.getContextPath() %>/resources/imgs/watch/kflixlogo.png" id="alertImg" alt="" />
        <button type="button" id="alertClose"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body text-center fs-5">
	      비활성화 되었습니다.
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>
