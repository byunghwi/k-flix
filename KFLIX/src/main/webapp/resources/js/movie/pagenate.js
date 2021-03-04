/**
 * 
 */
//페이지 네이트
function makePageNate(len, pnum, amount)	{
		var page_size = 10;
		var end_page = pnum % page_size == 0 ? parseInt(pnum / page_size) * page_size : parseInt(pnum / page_size + 1) * page_size; 
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
		pagebtn += '<button class="page-link bg-dark text-light" id="pre" tabindex="-1" aria-disabled="true">«</button>';
		pagebtn += '</li>';
		
		// 페이지 버튼
		for (var i = start_page; i < end_page+1; i++) {
			if (i == pnum){
				pagebtn += '<li id="pageli" class="page-item active" aria-current="page">';
			} else {
				pagebtn += '<li id="pageli" class="page-item" aria-current="page">';
			}
			
			pagebtn += '<button class="page-link bg-dark text-light" id="pnum'+ (i) +'" onclick="pageClick('+ (i) +');">'+ (i) +'</button>'
			pagebtn += '</li>'
		}
		
		// next 버튼
		if (!next_page || end_page == last_page){
			pagebtn += '<li class="page-item disabled">';
		} else {
			pagebtn += '<li class="page-item">';			
		}
		
		pagebtn += '<button class="page-link bg-dark text-light" id="next" tabindex="-1" aria-disabled="true">»</button>';
		pagebtn += '</li>';
		
		pagenate.html(pagebtn);
}