package com.kflix.movie.controller;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kflix.actor.domain.Actor;
import com.kflix.actor.service.ActorService;
import com.kflix.director.domain.Director;
import com.kflix.director.service.DirectorService;
import com.kflix.genre.domain.Genre;
import com.kflix.genre.service.GenreService;
import com.kflix.movie.domain.Movie;
import com.kflix.movie.service.MovieService;
import com.kflix.util.fileupload.FileUploadService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie*")
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
	FileUploadService upload;
	
	// http://localhost:8080/kflix/movie
	
	/*
	 * 영화 관리 페이지
	 */
	@GetMapping
	public String movieMain(Model model) {
		model.addAttribute("movie", mv_service.selectAllMovieVeiw('Y'));
		
		return "movie/movieindex";
	}
	
	
	/*
	 * 상세보기 페이지
	 */
	@GetMapping("/detail/{id}")
	public String detail(Model model, @PathVariable("id") int movie_id) {
		model.addAttribute("movie", mv_service.selectMovieById(movie_id)); 
		
		return "movie/detail";
	}
	
	
	/*
	 * 영화 등록 페이지
	 */
	@GetMapping("/addpage")
	public String add(Model model) {
		model.addAttribute("director", dt_service.selectAllDirectorList());
		model.addAttribute("actor", at_service.selectAllActorList());
		model.addAttribute("genre", gr_service.selectAllGenreList('Y'));
		
		return "movie/addMovie";
	}

	// 등록 입력 값 넘기기 , 등록 성공 / 실패 체크 추가하기	
	@PostMapping("/add")
	public String addMovie(Model model, Movie movie, MultipartFile[] mpf){
		// 파일 업로드
		String[] path = upload.restore(mpf);
		
		// 파일 경로 Set
		movie.changePaths(path);
		
		// DB 추가
		int result = mv_service.insertNewMovie(movie);
		
		String msg = result > 0 ? "등록하였습니다!" : "등록에 실패하였습니다.";
		
		model.addAttribute("msg", msg);
		
		return "movie/result";
	}

	
	
	
	/*
	 * 수정 페이지
	 */
	@GetMapping("/updatepage/{id}")
	public String updatePage(Model model, @PathVariable("id") int movie_id) {
		model.addAttribute("movie", mv_service.selectMovieById(movie_id));
		model.addAttribute("director", dt_service.selectAllDirectorList());
		model.addAttribute("actor", at_service.selectAllActorList());
		model.addAttribute("genre", gr_service.selectAllGenreList('Y'));
		
		return "movie/updateMovie";
	}
	
	@PostMapping("/update")
	public String update(Model model, Movie movie, MultipartFile[] mpf) {
		// 파일 업로드
		String[] path = upload.restore(mpf);
				
		// 파일 경로 Set
		movie.changePaths(path);
		
		int result = mv_service.updateMovie(movie);
		
		String msg = result > 0 ? "수정 되었습니다." : "수정에 실패하였습니다.";
		
		model.addAttribute("msg", msg);
		
		return "movie/result";
	}
	
	
	/*
	 *  삭제 페이지 / status = 'N'
	 */
	@GetMapping("/delete/{id}")
	public String delete(Model model, @PathVariable("id") int moive_id) {
		int result = mv_service.deleteOrRecoveryMovieById(moive_id, 'N');
		
		String msg = result > 0 ? "삭제 되었습니다." : "삭제에 실패하였습니다.";
		
		model.addAttribute("msg", msg);
		
		return "movie/result";
	}
	
	
	/*
	 * 삭제된 목록
	 */
	@GetMapping("/deletedList")
	public String deletedList(Model model) {
		model.addAttribute("movie", mv_service.selectAllMovieVeiw('N'));
		
		return "movie/deletedMovie";
	}
	
	
	/*
	 * 복구
	 */
	@GetMapping("/recovery/{id}")
	public String recoveryMovie(Model model, @PathVariable("id") int moive_id) {
		int result = mv_service.deleteOrRecoveryMovieById(moive_id, 'Y');
		
		String msg = result > 0 ? "복구 되었습니다." : "복구에 실패하였습니다.";
		
		model.addAttribute("msg", msg);
		
		return "movie/result";
	}
}

