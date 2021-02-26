var thumb = $("div#thumbnail");

function posterCheck(e) {
	var poster_div = $("#poster_div");
	var poster_text = $("#poster_text");
	var poster_val = poster_text.val();
	var reader = new FileReader();

	if( poster_val != "" ){
		
		var ext = poster_val.split('.').pop().toLowerCase();
	
	    if($.inArray(ext, ['png','jpg','jpeg','jfif','pjpeg','pjp']) == -1) {
	   		poster_text.remove();
	    	poster_div.html("");
	    	poster_div.append('<label class="input-group-text" for="poster_text">포스터</label>');
	    	poster_div.append('<input type="file" name="poster" class="form-control" id="poster_text" accept="image/png, image/jpeg, image/jpg" onchange="posterCheck(this);" required/>');
	    	 
		 	infoMsg('잘못된 파일명 입니다.');
		 	thumb.html('');
	    } else {
	
			reader.onload = function (e) {
				thumb.removeAttr('style');
			 	thumb.attr('style', 'background-image: url("' + e.target.result + '");');
			}
			reader.readAsDataURL(poster_text[0].files[0]);
		}
	} 
};


function teaserCheck(){
	var teaser_div = $("#teaser_div");
	var teaser_text = $("#teaser_text");
	var teaser_val = teaser_text.val();
	
	if( teaser_val != "" ){
	
		var ext = teaser_val.split('.').pop().toLowerCase();
	
	    if($.inArray(ext, ['mp4','avi','mkv','mov','m4v']) == -1) {
			
	    	teaser_text.remove();
	    	teaser_div.html("");
	    	teaser_div.append('<label class="input-group-text" for="teaser_text">티저</label>')
	    	teaser_div.append('<input type="file" name="teaser" class="form-control"  id="teaser_text" accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" onchange="teaserCheck();" required/>');
	    	
		 	infoMsg('잘못된 파일명 입니다.');
	    }
	}
}



function videoCheck(){ 
	var video_div = $("#video_div");
	var video_text = $("#video_text");
	var video_val = video_text.val();

	var files = video_text[0].files;
	console.log(files);
	var video = document.createElement('video');
     video.preload = 'metadata';
    
    video.src = URL.createObjectURL(files[0]);
     



	if( video_val != "" ){
	
		var ext = video_val.split('.').pop().toLowerCase();
		
		if($.inArray(ext, ['mp4','avi','mkv','mov','m4v']) == -1) {
			video_text.remove();
			video_div.html("");
			video_div.append('<label class="input-group-text" for="video_text">영화</label>');
			video_div.append('<input type="file" name="video"  class="form-control" id="poster_text" accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" onchange="videoCheck();" required/>');
			
		 	infoMsg('잘못된 파일명 입니다.');
		 	
		 	$('input[name="play_time"]').val('');
		 	
	    } else{
	    
   		    video.onloadedmetadata = function() {
				window.URL.revokeObjectURL(video.src);
				var duration = video.duration;
				
				var getMin = Math.ceil(duration / 60);
				
				$('input[name="play_time"]').val(getMin);
		  	}
	    }
	}
}
