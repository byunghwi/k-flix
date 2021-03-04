/**
 * 
 */

var remodal = function() {$('#recoveryconfrim').modal("show")};

function recoveryBtn(pnum) {
	var id = $('#recoveryid').val();
	var path = "/kflix/director/recovery";
	var name = "none";
	var modal = remodal;
	ajaxModalCon(pnum, id, path, name, modal);
	$('#recoverymodal').modal("hide");
}

$('#helpAmount').change(function(){
	ajaxCon(1);
})

function ajaxCon(pnum){
	
	$.ajax({
		type: "POST",
		url: "/kflix/director/findDeletedindex",
		data: JSON.stringify({
   			director_name: $('#search_val').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			var len = data.length;
  			var amount =  parseInt($('#helpAmount').val())
	
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
 
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}

function ajaxModalCon(pnum, id, path, name, modal){
	
	$.ajax({
		type: "PATCH",
		url: path,
		data: JSON.stringify({
   			director_id: id,
   			director_name: name,
   			searching_word: $('#search_val').val()
		}),
		contentType: 'application/json',
		
 		success: function(data){
  			var len = data.length;
  			var amount =  parseInt($('#helpAmount').val())
	
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
 			modal();
   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
}

// 모달
var directorid="";

$(document).ready(function() { 
	$('#recoverymodal').on('show.bs.modal', function(event){
		directorid = $(event.relatedTarget).data('directorid');

		$('#recoveryid').val(directorid);
	});
})


// 테이블 만들기
function makeTable(data, pnum, amount) {
		var section = $('#directorlist');
		var table = $('#directortable>tbody');
			
		$('table>tbody>*').remove();
	
		var first_li = (pnum - 1) * amount;
		var last_li = first_li + amount;
		
		try{
			for	(var i = first_li; i < last_li; i++) {
				table.append('<tr>'
						+'<td>' + data[i].director_id + '</td>'
						+'<td>' + data[i].director_name + '</td>'
						+'<td><button type="button" class="btn btn-outline-warning" data-bs-toggle="modal"'
						+'data-directorid="' + data[i].director_id + '" data-bs-target="#recoverymodal">활성화</button></td>'
						+'</tr>'
				);
			}
			
		} catch(err){
			console.log("마지막 데이터 입니다.")
		}
};

function searchReset(){
	$('#search_val').val('');
}