/**
 * 
 */
 var infomodal = function() {$('#infoconfrim').modal("show")}

function infoMsg(msg){
	$('#alertMsg').html(msg);
	infomodal();
}
 
 
function allView(pnum) {
	searchReset();
	ajaxCon(pnum);
}

function pageClick(pnum) {

	ajaxCon(pnum);	
}

$('#helpAmount').change(function(){

	ajaxCon(1);
})

function searching(pnum) {
	
	var select_word = $('#search_val').val();
	var select_index = $('#search_cols').val();
	var regexp = /^[0-9]{2}[\/](0[1-9]|1[0-2])$/; 
	
	if (select_word == '' || select_word == null){
		infoMsg("검색할 단어를 입력 해주세요")
		
	} else if (select_index == '' || select_index == null){
		infoMsg("검색할 목록을 선택해 주세요")
		
	} else if (select_index == 'reg_date' && regexp.test(select_word)){
		ajaxCon(pnum);	
		
	} else if (select_index == 'reg_date' && !regexp.test(select_word)) {
		infoMsg('날짜 형식이 맞지 않습니다. (' + select_word + ') \n예시) 21/02');	
	} else {
		ajaxCon(pnum);
	}
}

function ajaxCon(pnum){
	
	$.ajax({
		type: "POST",
		url: "/kflix/movie/findDeletedindex",
		data: JSON.stringify({
			searching_index: $('#search_cols').val(),
   			searching_word: $('#search_val').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			var len = data.length;
  			var amount = parseInt($('#helpAmount').val())
	
  			var anotherPnum = Math.ceil(len / amount);
  			if ($('.active').text() == '' 
  					|| $('.active').text() == 0){
  				pnum = 1;
  				
  			} else if (anotherPnum > 0 && anotherPnum < pnum){
  				pnum = anotherPnum;
  			}
  
  			// 데이터, page - 클릭페이지, amount - 보여줄 수 
  			makeTable(data, pnum, amount);
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}

// 테이블 만들기
function makeTable(data, pnum, amount) {
		var table = $('#movietable>tbody');
			
		$('table>tbody>*').remove();
	
		var first_li = (pnum - 1) * amount;
		var last_li = first_li + 5;
		
		try{
			for	(var i = first_li; i < last_li; i++) {
				table.append('<tr>'
						+'<td>' + data[i].movie_id + '</td>'
						+'<td><img alt="사진" src="' + data[i].poster_path + '"/></td>'
						+'<td>' + data[i].movie_title + '</td>'
						+'<td>' + data[i].director_name + '</td>'
						+'<td>' + data[i].genre_name1 + " / " + data[i].genre_name2 + '</td>'
						+'<td>' + data[i].play_time + '분</td>'
						+'<td>' + moment(data[i].reg_date).format("YY/MM/DD") + '</td>'
						+'<td><button type="button" class="btn btn-outline-warning" data-bs-toggle="modal"'
						+'data-movieid="'+data[i].movie_id+'" data-bs-target="#recoverymodal">활성화</button></td>'
						+'</tr>'
				);
			}
			
		} catch(err){
			console.log("전부 출력 완료")
		}
};


// 페이지 네이트
function makePageNate(len, pnum, amount)	{
		var page_size = 10;
		var end_page = pnum % page_size == 0 ? parseInt(pnum / page_size) * size : parseInt(pnum / page_size + 1) * page_size; 
		var start_page = end_page - (page_size - 1);
		var last_page = len % amount == 0 ? parseInt(len / amount) : parseInt(len / amount) + 1;
		end_page = end_page > last_page ? last_page : end_page;
		
		var prev_page = start_page != 1;
		var next_page = end_page != last_page;
				
		var pagenate = $('#pagenate ul');
		
		pagenate.html('');
		
		var pagebtn = '';
		
		// pre 버튼
		if (prev_page) {
			pagebtn = '<li class="page-item">';
		} else {
			pagebtn = '<li class="page-item disabled">';
		}
		pagebtn += '<button class="page-link" id="pre" tabindex="-1" aria-disabled="true">«</button>';
		pagebtn += '</li>';
		
		// 페이지 버튼
		for (var i = start_page; i < end_page+1; i++) {
			if (i == pnum){
				pagebtn += '<li class="page-item active" aria-current="page">';
			} else {
				pagebtn += '<li class="page-item" aria-current="page">';
			}
			
			pagebtn += '<button class="page-link" id="pnum'+ (i) +'" onclick="pageClick('+ (i) +');">'+ (i) +'</button>'
			pagebtn += '</li>'
		}
		
		// next 버튼
		if (!next_page || end_page == last_page){
			pagebtn += '<li class="page-item disabled">';
		} else {
			pagebtn += '<li class="page-item">';			
		}
		
		pagebtn += '<button class="page-link" id="next" tabindex="-1" aria-disabled="true">»</button>';
		pagebtn += '</li>';
		
		pagenate.html(pagebtn);
}


$('#search_cols').change(function(){
	var searchVal = $('#search_val');
	searchVal.val('');
		
	if ($('#search_cols').val() == 'reg_date'){
		 searchVal.attr("placeholder", " yy/mm");
		
	} else {
		searchVal.removeAttr("placeholder");
	}
})


$(document).ready(function() { 
	var movieid="";
	$('#recoverymodal').on('show.bs.modal', function(event){
		movieid = $(event.relatedTarget).data('movieid');

		$('#recoveryid').val(movieid);		
	});
})


function recoveryBtn(pnum) {

	var movieId = $('#recoveryid').val();
	
	$.ajax({
		type: "PATCH",
		url: "/kflix/movie/recovery",
		data: JSON.stringify({
			movie_id: movieId,
			searching_index: $('#search_cols').val(),
   			searching_word: $('#search_val').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
			
			$('#recoverymodal').modal("hide");
			
  			var len = data.length;
  			var amount = parseInt($('#helpAmount').val())
	
  			var anotherPnum = Math.ceil(len / amount);
  			if ($('.active').text() == '' 
  					|| $('.active').text() == 0){
  				pnum = 1;
  				
  			} else if (anotherPnum > 0 && anotherPnum < pnum){
  				pnum = anotherPnum;
  			}
  			
 			makePageNate(len, pnum, amount);
  
  			// 데이터, page - 클릭페이지, amount - 보여줄 수 
  			makeTable(data, pnum, amount);
 			
 			$('#recoveryMsg').html(movieId + '번이 복구되었습니다.');
			$('#recoveryconfirm').modal("show");
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
	
}


function searchReset(){
	$('#search_val').val('');
	$('#search_val').removeAttr("placeholder");
	$('#search_cols').val('');	
}

