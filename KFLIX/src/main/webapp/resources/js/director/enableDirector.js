/**
 * 
 */

var addmodal = function() {$('#addconfrim').modal("show")};
var updatemodal = function() {$('#updateconfrim').modal("show")};
var deletemodal = function() {$('#deleteconfrim').modal("show")};

function addBtn(pnum) {
	var id = 0;
	var path = "/kflix/director/add";
	var name = $('#addDirector').val();
	var modal = addmodal;
		
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
  			
 			makePageNate(len, 1, amount);
  
  			// 데이터, page - 클릭페이지, amount - 보여줄 수 
  			makeTable(data, 1, amount);
  			
  			modal();

   		},
   		error: function(){
   			infoMsg('불러오는데 실패하였습니다.');
   		}
	}) 
	$('#addmodal').modal("hide");
	
}

$('#helpAmount').change(function(){
	ajaxCon(1);
})

function updateBtn(pnum) {
	var id = $('#update_id').val();
	var path = "/kflix/director/update";
	var name = $('#updateDirector').val();
	var modal = updatemodal;
	ajaxModalCon(pnum, id, path, name, modal);
	$('#updatemodal').modal("hide");
}

function deleteBtn(pnum) {
	var id = $('#deleteid').val();
	var path = "/kflix/director/delete";
	var name = "none";
	var modal = deletemodal;
	ajaxModalCon(pnum, id, path, name, modal);
	$('#deletemodal').modal("hide");
}

function ajaxCon(pnum){
	
	$.ajax({
		type: "POST",
		url: "/kflix/director/findindex",
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
	  			var pnum = $('.active').text();
	  			
	  			var anotherPnum = Math.ceil(len / amount);
	  			if ($('.active').text() == '' 
	  					|| $('.active').text() == 0
	  					|| $('.active').text() == null){
	  				pnum = 1;
	  				
	  			} else if (anotherPnum > 0 && anotherPnum < pnum){
	  				pnum = anotherPnum;
	  			}
	  			
	  			try{
	  				pnum = parseInt(pnum)
	  				console.log('try임')
	  				
	  			} catch(err) {
	  				console.log('에러임')
	  				pnum = 1;
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
	$('#updatemodal').on('show.bs.modal', function(event){
		directorid = $(event.relatedTarget).data('directorid');

		$('#updateDirector').val('');
		$('#update_id').val(directorid);
	});
})

$(document).ready(function() { 
	$('#addmodal').on('show.bs.modal', function(event){

		$('#addDirector').val('');
	});
})
$(document).ready(function() { 
	$('#deletemodal').on('show.bs.modal', function(event){
		directorid = $(event.relatedTarget).data('directorid');

		$('#deleteid').val(directorid);
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
						+'<td>'
						+'<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"'
						+'data-directorid="' + data[i].director_id + '" data-bs-target="#updatemodal">수정</button> '
						+'<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"'
						+'data-directorid="' + data[i].director_id + '" data-bs-target="#deletemodal">비활성화</button></td>'
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
