package com.kflix.movie.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.mapper.MovieMapper;
import com.kflix.movie.domain.Movie;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieMapper mv_mapper;
	
	/*
	 * 활성화된 목록, 삭제된 목록
	 */
	@Override
	public List<Movie> selectAllMovieVeiw(char status) {
		return mv_mapper.getAllMovieView(status);
	}
	
	/*
	 * 상세
	 */
	@Override
	public Movie selectMovieById(int movie_id) {
		return mv_mapper.getMovieById(movie_id);
	}
	
	/*
	 * 등록
	 */
	@Override
	public int insertNewMovie(Movie movie) {
		
		
		return mv_mapper.addMovie(movie);
	}

	/*
	 *  삭제, 복구
	 */
	@Override
	public int deleteOrRecoveryMovieById(int movie_id, char status) {
		return mv_mapper.deleteOrRecoveryMovie(movie_id, status);
	}

	/*
	 * 수정
	 */
	@Override
	public int updateMovie(Movie movie) {
		return mv_mapper.updateMovie(movie);
	}

	
	/*
	 * 영화의 개수
	 */
	@Override
	public int getCountMovie(char status) {
		return mv_mapper.countMovie(status);
	}

	@Override
	public List<Movie> selectPageMovieView(PageNation pagenation, char status) {
		return mv_mapper.getPageMovieView(pagenation.getPage(), pagenation.getAmount(), status);
	}
	
	
	@Override
	public boolean checkDate(Movie movie) {
		Date today= new Date();
		Calendar yesterday = Calendar.getInstance();
		Calendar tomorrow = Calendar.getInstance();
		Calendar reg_date = Calendar.getInstance();
		Calendar release_date = Calendar.getInstance();

		// 받은 날짜값
		reg_date.setTime(movie.getReg_date());
		release_date.setTime(movie.getMovie_release());
		
		tomorrow.setTime(today);
		tomorrow.add(Calendar.DATE, +1);
		
		yesterday.setTime(today);
		yesterday.add(Calendar.DATE, -1);
		
		// 등록일이 어제와 내일 사이면
		boolean check_reg = tomorrow.getTime().after(reg_date.getTime()) 
						&& yesterday.getTime().before(reg_date.getTime());
		
		// 개봉일이 오늘 날짜 이후면 false
		boolean check_release = today.after(release_date.getTime());

		log.info("오늘: " + today);
		log.info("개봉일: " + release_date.getTime());
		log.info("등록: " + reg_date.getTime());
		log.info("내일: " +tomorrow.getTime());
		log.info("어제: " +yesterday.getTime());
		
		// 양쪽다 만족시 true
		if(check_reg && check_release) {
			
			return true;
			
		} else {
			
			return false;
		}
	}

}
