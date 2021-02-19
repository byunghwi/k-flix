package com.kflix.watch.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.annotations.Param;
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
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.service.WatchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class WatchController {

	WatchService watchservice;
	ActorService actorservice;
	DirectorService directorservice;
	GenreService genreservice;
	
	/*
	 * 계정 url로 들고올 경우
	 * 
	 * @GetMapping("/browse") public String getbrowse(Model model, Member member) {
	 * model.addAttribute("Allmovie", service.getAllmovie());
	 * model.addAttribute("Allwatch", service.getAllwatch(member.email)); return
	 * "/watch/browse"; }
	 */

	@GetMapping("/browse")
	public String getbrowse(Model model) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList());
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList());
		model.addAttribute("AllGenre", genreservice.selectAllGenreList('Y'));
		model.addAttribute("watch", watchservice.getSelectWatch("nn@naver.com"));
		model.addAttribute("email", "nn@naver.com");
		return "/watch/browse";
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
		if (watch.getResult().equals("update")) {
			int result1 = watchservice.updateWatch(watch);
		} else {
			int result1 = watchservice.createWatch(watch);
		}
		System.out.println("결과 : " + watch.getView_point() + " 과연 : " + watch.getResult());
		return "/watch/browse";
	}
	
	
	@GetMapping(value = "/browse/{movie_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getmovie(Model model, @PathVariable("movie_id") int movie_id) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList());
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList());
		model.addAttribute("AllGenre", genreservice.selectAllGenreList('Y'));
		model.addAttribute("movie", watchservice.getmovie(movie_id));
		model.addAttribute("watch", watchservice.getSelectWatch("nn@naver.com"));
		model.addAttribute("email", "nn@naver.com");
		model.addAttribute("watching", watchservice.getSelectWatchUser("nn@naver.com", movie_id));
		/*
		 * System.out.println("나와ㅗ나얼" + service.getSelectWatchUser("nn@naver.com",
		 * movie_id));
		 */
		return "/watch/movieInfo";
	}
	
	@GetMapping(value = "/browse/watch/{movie_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getwatch(Model model, @PathVariable("movie_id") int movie_id) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList());
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList());
		model.addAttribute("AllGenre", genreservice.selectAllGenreList('Y'));
		model.addAttribute("movie", watchservice.getmovie(movie_id)); 
		model.addAttribute("watch", watchservice.getSelectWatch("nn@naver.com"));
		model.addAttribute("email", "nn@naver.com");
		model.addAttribute("watching", watchservice.getSelectWatchUser("nn@naver.com", movie_id));
		/*
		 * System.out.println("나와ㅗ나얼" + service.getSelectWatchUser("nn@naver.com",
		 * movie_id));
		 */
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