package com.kflix.watch.domain;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.kflix.genre.domain.Genre;

import lombok.Data;

@Data
@Component
public class Basket {

	List<MovieVO> movie;
	List<WatchVO> watch;
	List<WatchVO> watching;
	List<WishVO> wish; 
	List<Genre> genre;
	
}
