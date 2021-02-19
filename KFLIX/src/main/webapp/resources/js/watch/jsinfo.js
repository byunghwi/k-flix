
const wish_lab = document.getElementById('wish_lab');
const wish_check = document.getElementById('wish_check');

const thumbs_up_lab = document.getElementById('thumbs_up_lab');
const thumbs_up_check = document.getElementById('thumbs_up_check');

const thumbs_down_lab = document.getElementById('thumbs_down_lab');
const thumbs_down_check = document.getElementById('thumbs_down_check');

wish_check.addEventListener("change", function(){
	if(wish_check.checked){
		console.log("체크됨");
		wish_lab.innerHTML = `<i class="fas fa-check color-w"></i>`;
	}else{
		console.log("체크안됨");
		wish_lab.innerHTML = `<i class="fas fa-plus color-w"></i>`;

	}
});
	
	thumbs_up_check.addEventListener("change", function(){
	if(thumbs_up_check.checked){
		console.log("체크됨");
		thumbs_up_lab.innerHTML = `<i class="fas fa-thumbs-up color-w"></i>`;
	}else{
		console.log("체크안됨");
		thumbs_up_lab.innerHTML = `<i class="far fa-thumbs-up color-w"></i>`;

	}
	
});
	thumbs_down_check.addEventListener("change", function(){
	if(thumbs_down_check.checked){
		console.log("체크됨");
		thumbs_down_lab.innerHTML = `<i class="fas fa-thumbs-down color-w"></i>`;
	}else{
		console.log("체크안됨");
		thumbs_down_lab.innerHTML = `<i class="far fa-thumbs-down color-w"></i>`;

	}
});
	
	
	
	
		 
	