package com.kflix.watch.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kflix.actor.service.ActorService;
import com.kflix.director.service.DirectorService;
import com.kflix.genre.service.GenreService;
import com.kflix.member.domain.Member;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.service.WatchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class WatchController {
	
	@Autowired
	WatchService watchservice;
	
	@Autowired
	ActorService actorservice;
	@Autowired
	DirectorService directorservice;
	@Autowired
	GenreService genreservice;
	
	LocalDate max_day = LocalDate.now();

	@GetMapping("/browse")
	public String getbrowse(Model model, HttpSession session) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList());
		model.addAttribute("AllGenre", genreservice.selectAllGenreList('Y'));
		
		Member member = (Member) session.getAttribute("login");
		model.addAttribute("watch", watchservice.getSelectWatch(member.getEmail()));
		model.addAttribute("email", member.getEmail());
		System.out.println("이메일 받아오기 : " + member.getEmail());
		return "/watch/browse";
	}
	
	@GetMapping("/btest")
	public String btest(Model model, HttpSession session) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList());
		model.addAttribute("AllGenre", genreservice.selectAllGenreList('Y'));
		Member member = (Member) session.getAttribute("login");
		model.addAttribute("watch", watchservice.getSelectWatch(member.getEmail()));
		model.addAttribute("email", member.getEmail());
		
		return "/watch/NewFile";
	}
	
	/*
	 * js에서 form으로 보낼 경우
	 * 
	 * @PostMapping("/browse/{currentTime:.+}") public String
	 * getbrowse1(RedirectAttributes rttr, @PathVariable("currentTime") double
	 * currentTime) { System.out.println(currentTime); return "redirect:/browse"; }
	 */

	@PostMapping(value = "/browse/{movie_id}", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String createEmployee(@RequestBody WatchVO watch) {
		System.out.println("왔나");
		if (watch.getResult().equals("update")) {
			
			int result1 = watchservice.updateWatch(watch);
		} else {
			int result1 = watchservice.createWatch(watch);
		}
		System.out.println("결과 : " + watch.getView_point() + " 과연 : " + watch.getResult());
		return "/watch/browse";
	}
	
	
	@GetMapping(value = "/browse/{movie_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getmovie(Model model, @PathVariable("movie_id") int movie_id, HttpSession session) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList());
		model.addAttribute("AllGenre", genreservice.selectAllGenreList('Y'));
		model.addAttribute("movie", watchservice.getmovie(movie_id));
		
		Member member = (Member) session.getAttribute("login");
		System.out.println("여기는 상세페이지 이동");
		System.out.println("[상세페이지]이메일 받아오기 : " + member.getEmail());
		model.addAttribute("watch", watchservice.getSelectWatch(member.getEmail()));
		model.addAttribute("email", member.getEmail());
		model.addAttribute("watching", watchservice.getSelectWatchUser(member.getEmail(), movie_id));
		return "/watch/movieInfo";
	}
	
	@GetMapping(value = "/browse/watch/{movie_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getwatch(Model model, @PathVariable("movie_id") int movie_id, HttpSession session) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList());
		model.addAttribute("AllGenre", genreservice.selectAllGenreList('Y'));
		model.addAttribute("movie", watchservice.getmovie(movie_id)); 
		
		Member member = (Member) session.getAttribute("login");
		model.addAttribute("watch", watchservice.getSelectWatch(member.getEmail()));
		model.addAttribute("email", member.getEmail());
		model.addAttribute("watching", watchservice.getSelectWatchUser(member.getEmail(), movie_id));
		model.addAttribute("today", max_day.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		return "/watch/video";
	}

	/*
	 * @GetMapping(value = "/browse/watch/{movie_id}", produces =
	 * MediaType.APPLICATION_JSON_VALUE) public String getvideo(Model
	 * model, @PathVariable("movie_id") int movie_id) { model.addAttribute("movie",
	 * service.getmovie(movie_id)); model.addAttribute("watch",
	 * service.getSelectWatch("nn@naver.com")); model.addAttribute("email",
	 * "nn@naver.com"); model.addAttribute("watching",
	 * service.getSelectWatchUser("nn@naver.com", movie_id));
	 * 
	 * System.out.println("나와ㅗ나얼" + service.getSelectWatchUser("nn@naver.com",
	 * movie_id));
	 * 
	 * return "/watch/video"; }
	 */
}