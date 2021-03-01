/**
 * 
 */

var infomodal = function() {$('#infoconfrim').modal("show")}

function infoMsg(msg){
	$('#alertMsg').html(msg);
	infomodal();
}

function pageClick(pnum) {

	ajaxCon(pnum);	
}

function allView(pnum) {
	searchReset();
	ajaxCon(pnum);
}

function searching(pnum) {
	var select_word = $('#search_val').val();
	
	if (select_word == '' || select_word == null){
		infoMsg('검색할 단어를 입력해 주세요.')
		
	} else {
		ajaxCon(pnum);
	}
}