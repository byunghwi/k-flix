/**
 * 
 */
function posterBtn() {
	var poster_div = $("#poster_div");
	var thum = $("div#thumbnail");
	thum.html('');
	poster_div.html("");
	poster_div.append('<label class="input-group-text" for="poster_text">포스터</label>');
	poster_div.append('<input type="file" name="poster" class="form-control" id="poster_text" accept="image/png, image/jpeg, image/jpg" onchange="posterCheck();" required/>')
	
}

function teaserBtn() {
	var teaser_div = $("#teaser_div");
	
	teaser_div.html("");
	teaser_div.append('<label class="input-group-text" for="teaser_text">티저</label>');
	teaser_div.append('<input type="file" name="teaser" class="form-control"  id="teaser_text" accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" onchange="teaserCheck();" required/>')
	
}

function videoBtn() {
	var video_div = $("#video_div");
	
	video_div.html("");
	video_div.append('<label class="input-group-text" for="video_text">영화</label>');
	video_div.append('<input type="file" name="video"  class="form-control" id="video_text" accept="video/x-msvideo,  video/mp4,  video/quicktime, video/x-matroska" onchange="videoCheck();" required/>');
}