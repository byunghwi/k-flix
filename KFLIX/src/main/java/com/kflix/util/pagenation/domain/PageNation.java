package com.kflix.util.pagenation.domain;

import lombok.Data;
import lombok.Getter;

@Data
public class PageNation {
	
	private int page;
	private int amount;
	
	public PageNation() {
		this(1, 5);
	}
	

	public PageNation(int page, int amount) {
		this.page = page;
		this.amount = amount <= 0 ? 10 : amount;
	}

	
	public PageDTO getPageData(int paginate_size, int rowCount) {
		return new PageDTO(paginate_size, rowCount);
	}

	@Getter
	public class PageDTO {
		private int currPage;
		private int startPage;
		private int endPage;
		private int lastPage;
		private int size;
		private boolean prev, next;
		
		private PageDTO(int size, int total) {
			this.currPage = page;
			this.endPage = page % size == 0 ? (page / size) * size : (page / size + 1) * size; 
			this.startPage = endPage - (size - 1);
			this.lastPage = total % amount == 0 ? total / amount : total / amount + 1;
			this.endPage = endPage > lastPage ? lastPage : endPage;
			this.size = size;
			this.prev = startPage != 1;
			this.next = endPage != lastPage;
		}
		
		public int getAmount() {
			return amount;
		}
		
	}
	
}
