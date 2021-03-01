<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex justify-content-end pb-2">
	<div class="input-group input-group-sm mb-1 justify-content-end search_label"> 
	<div class="search_select">
		<select class="form-select" id="search_cols" name="searching_index">
			<option value="" selected>선택</option>
		    <option value="movie_title">제목</option>
		    <option value="director_name">감독</option>
		    <option value="genre_name">장르</option>
		    <option value="reg_date">등록일</option>
		  </select>
	</div>
		<input type="text" name="searching_word" id="search_val" class="form-control" aria-describedby="search">
  		<button class="btn btn-outline-secondary btn-sm" onclick="searching(1);"><i class="fas fa-search"></i></button>
	</div>

<div class="ps-2">
	<button class="btn btn-outline-secondary btn-sm" onclick="allView(1);">ALL</button>
</div>

</div>