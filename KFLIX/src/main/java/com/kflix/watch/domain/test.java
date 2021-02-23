package com.kflix.watch.domain;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class test {

	List<MovieVO> movie;
	List<WatchVO> watch;
	/* List<WishVO> wish; 
	 * List<GenreVO> genre;
	 * */
	

	public static void main(String[] args) {
		test test1 = new test();
	}
}
