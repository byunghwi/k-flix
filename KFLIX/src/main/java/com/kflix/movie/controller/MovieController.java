package com.kflix.movie.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kflix.actor.service.ActorService;
import com.kflix.director.service.DirectorService;
import com.kflix.genre.service.GenreService;
import com.kflix.movie.domain.Movie;
import com.kflix.movie.service.MovieService;
import com.kflix.util.fileupload.FileUploadService;
import com.kflix.util.pagenation.domain.PageNation;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
public class MovieController {

	@Inject
	MovieService mv_service;
	
	@Inject
	DirectorService dt_service;
	
	@Inject
	ActorService at_service;
	
	@Inject
	GenreService gr_service;
	
	@Inject
	FileUploadService upload_service;
	
	@Inject
	Movie movie;
	
	static final char ENABLED = 'Y';
	static final char DISABLED = 'N';
	
	LocalDate max_day = LocalDate.now();
	
	// http://localhost:8081/kflix/movie/movieindex

	/*
	 * 영화 관리 페이지
	 */
	@GetMapping("movieindex")
	public String movieMain(Model model, PageNation pagenation, String searching_index, String searching_word) {
		log.info("============ movieindex Cotnroller ==========");
		List<Movie> list = mv_service.selectPageMovieView(pagenation, ENABLED);
		int page_num = mv_service.getCountMovie(ENABLED);
	
		model.addAttribute("movie", list); 
		model.addAttribute("page", pagenation.getPageData(10, page_num));
		return "movie/movieindex";
	}
	
	/*
	 * 상세보기 페이지
	 */
	@GetMapping("detail/{id}")
	public String detail(Model model, @PathVariable("id") int movie_id) {
		model.addAttribute("movie", mv_service.selectMovieById(movie_id)); 
		
		return "movie/detail";
	}
	
	
	/*
	 * 영화 등록 페이지
	 */
	@GetMapping("addpage")
	public String add(Model model) {
		model.addAttribute("director", dt_service.selectAllDirectorList());
		model.addAttribute("actor", at_service.selectAllActorList());
		model.addAttribute("genre", gr_service.selectAllGenreList(ENABLED));
		model.addAttribute("today", max_day.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		
		return "movie/addMovie";
	}

	// 등록 입력 값 넘기기 , 등록 성공 / 실패 체크 추가하기	
	@PostMapping("add")
	public String addMovie(Model model, Movie movie, 
				MultipartFile poster, MultipartFile teaser, MultipartFile video) {
		
		log.info("======== add Controller ========");
		String msg = "파일 업로드에 실패하였습니다. 다시 한번 확인해주세요";
		//날짜 체크 , 파일 유효성 체크
		if(mv_service.checkDate(movie) 
				&& upload_service.checkExtAll(poster, teaser, video)
				&& upload_service.checkOverLaps(poster, teaser, video, movie)) {

			upload_service.setPathNames(poster, teaser, video, movie);
			
			// 파일 업로드
			boolean upload_result = upload_service.upload(poster, teaser, video, movie);

			// DB 처리
			int db_result = mv_service.insertNewMovie(movie);

			if (db_result > 0 && upload_result) {
				msg = "등록하였습니다!";
				
			} else {
				upload_service.fileDelete(poster, teaser, video, movie);
				
			}
		}
		
		model.addAttribute("msg", msg);
		return "movie/result";
	}

	
	
	
	/*
	 * 수정 페이지
	 */
	@GetMapping("updatepage/{id}")
	public String updatePage(Model model, @PathVariable("id") int movie_id) {
		movie = mv_service.selectMovieById(movie_id);
		movie.getFileName(movie.getPoster_path(), movie.getTeaser_path(), movie.getVideo_path());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		model.addAttribute("today", max_day.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		model.addAttribute("movie", movie);
		model.addAttribute("release_date", sdf.format(movie.getMovie_release()));		
		model.addAttribute("director", dt_service.selectAllDirectorList());
		model.addAttribute("actor", at_service.selectAllActorList());
		model.addAttribute("genre", gr_service.selectAllGenreList(ENABLED));
		
		return "movie/updateMovie";
	}
	
	@PostMapping("update")
	public String update(Model model, Movie movie,
						MultipartFile poster, MultipartFile teaser, MultipartFile video) {
	
		log.info("======== update Controller ========");
		String msg = "수정에 실패하였습니다. 다시 한번 확인해주세요";
		// 날짜 체크
		if (mv_service.checkDate(movie)
				&& upload_service.checkOverLaps(poster, teaser, video, movie)) {
			
			// 기존 파일 삭제
			upload_service.fileDelete(poster, teaser, video, movie);

			upload_service.setPathNames(poster, teaser, video, movie);
			
			// 파일 업로드
			boolean upload_result = upload_service.upload(poster, teaser, video, movie);
			
			int db_result = mv_service.updateMovie(movie);
			
			if (db_result > 0 && upload_result) {
				
				msg = "수정 되었습니다.";				
			} else {

			}
		}
		model.addAttribute("msg", msg);

		return "movie/result";
	}
	
	
	/*
	 *  삭제 페이지 / status = DISABLED
	 */
	@PostMapping("delete")
	public String delete(Model model, int movie_id) {
		int result = mv_service.deleteOrRecoveryMovieById(movie_id, DISABLED);
		
		String msg = result > 0 ? "삭제 되었습니다." : "삭제에 실패하였습니다.";
		
		model.addAttribute("msg", msg);
		
		return "redirect:/movie/movieindex";
	}
	
	
	/*
	 * 삭제된 목록
	 */
	@GetMapping("deletedMovie")
	public String deletedList(Model model, PageNation pagenation) {

		model.addAttribute("movie", mv_service.selectPageMovieView(pagenation, DISABLED));
		
		model.addAttribute("page", pagenation.getPageData(10, mv_service.getCountMovie(DISABLED)));
		
		return "movie/deletedMovie";
	}
	
	
	/*
	 * 복구
	 */
	@PostMapping("recovery")
	public String recoveryMovie(Model model, int movie_id) {
		int result = mv_service.deleteOrRecoveryMovieById(movie_id, ENABLED);
		
		String msg = result > 0 ? "복구 되었습니다." : "복구에 실패하였습니다.";
		
		model.addAttribute("msg", msg);
		
		return "redirect:/movie/deletedMovie";
	}
		
}

