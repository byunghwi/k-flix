package com.kflix.watch.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
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
import com.kflix.genre.domain.Genre;
import com.kflix.genre.service.GenreService;
import com.kflix.member.domain.Member;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.domain.WishVO;
import com.kflix.watch.domain.test;
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
		
		Member member = (Member) session.getAttribute("login");
		test test = new test();
		List<MovieVO> movies = watchservice.getAllmovie();
		ArrayList<Integer> arr = new ArrayList<>();
		for (MovieVO movie : movies) {
			arr.add(movie.getGenre_id1());
			arr.add(movie.getGenre_id2());
		}
		HashSet<Integer> arr2 = new HashSet<Integer>(arr);
		ArrayList<Integer> movie_genre = new ArrayList<>(arr2);
		
		model.addAttribute("Ranking", watchservice.getmovieRanking());
		
		test.setMovie(watchservice.getAllmovie());
		test.setWatch(watchservice.getSelectWatch(member.getEmail()));
		test.setWish(watchservice.getSelectWish(member.getEmail()));
		test.setGenre(watchservice.getAllGenre());

		model.addAttribute("AllGenre", watchservice.getAllGenre());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList('Y'));
		model.addAttribute("test", test);
		model.addAttribute("movie_genre", movie_genre);
		model.addAttribute("email", member.getEmail());
		return "/watch/browse";
	}

	@GetMapping("/btest")
	public String btest(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("login");
		test test = new test();
		List<MovieVO> movies = watchservice.getAllmovie();
		ArrayList<Integer> arr = new ArrayList<>();
		for (MovieVO movie : movies) {
			arr.add(movie.getGenre_id1());
			arr.add(movie.getGenre_id2());
		}
		HashSet<Integer> arr2 = new HashSet<Integer>(arr);
		ArrayList<Integer> movie_genre = new ArrayList<>(arr2);
		
		/* WatchController 에서 컬렉션sort로 중복 제거한 영화의 장르를 model에 담아서 */
		test.setMovie(watchservice.getAllmovie());
		test.setWatch(watchservice.getSelectWatch(member.getEmail()));
		test.setWish(watchservice.getSelectWish(member.getEmail()));
		test.setGenre(watchservice.getAllGenre());
		test.setGenre(watchservice.getAllGenre());
		model.addAttribute("movie_genre", movie_genre);
		model.addAttribute("test", test);
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList('Y'));
		model.addAttribute("email", member.getEmail());

		System.out.println("[WatchController] test 객체 > " + test);
		System.out.println("===============================================================");
		System.out.println("[WatchController] AllActor 객체 > " + test);
		System.out.println("===============================================================");
		System.out.println("[WatchController] AllDirector 객체 > " + test);
		System.out.println("===============================================================");

		return (member.getEmail().equals("wmffff@naver.com")) ? "/watch/NewFile_kbh" : "/watch/NewFile";
		//return "/watch/NewFile";
	}

	/*
	 * js에서 form으로 보낼 경우
	 * 
	 * @PostMapping("/browse/{currentTime:.+}") public String
	 * getbrowse1(RedirectAttributes rttr, @PathVariable("currentTime") double
	 * currentTime) { System.out.println(currentTime); return "redirect:/browse"; }
	 */

	@PostMapping(value = "/browse/{movie_id}", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String setwatch(@RequestBody WatchVO watch) {

		if (watch.getResult().equals("update")
				&& watchservice.getSelectWatchUser(watch.getEmail(), watch.getMovie_id()) != null) {
			int result1 = watchservice.updateWatch(watch);
		} else if (watch.getResult().equals("create")
				&& watchservice.getSelectWatchUser(watch.getEmail(), watch.getMovie_id()) == null) {
			int result1 = watchservice.createWatch(watch);
		}
		System.out.println("결과 : " + watch.getView_point() + " 과연 : " + watch.getResult());
		return "/watch/browse";
	}

	@GetMapping(value = "/browse/{movie_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getmovie(Model model, @PathVariable("movie_id") int movie_id, HttpSession session) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList('Y'));
		model.addAttribute("AllGenre", watchservice.getAllGenre());
		model.addAttribute("movie", watchservice.getmovie(movie_id));

		Member member = (Member) session.getAttribute("login");
		model.addAttribute("watch", watchservice.getSelectWatch(member.getEmail()));
		model.addAttribute("email", member.getEmail());
		model.addAttribute("watching", watchservice.getSelectWatchUser(member.getEmail(), movie_id));
		model.addAttribute("getwish", watchservice.getSelectWishUser(member.getEmail(), movie_id));
		return "/watch/movieInfo";
	}

	@GetMapping(value = "/browse/watch/{movie_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getwatch(Model model, @PathVariable("movie_id") int movie_id, HttpSession session) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList('Y'));
		model.addAttribute("AllGenre", watchservice.getAllGenre());
		model.addAttribute("movie", watchservice.getmovie(movie_id));

		Member member = (Member) session.getAttribute("login");
		model.addAttribute("watch", watchservice.getSelectWatch(member.getEmail()));
		model.addAttribute("email", member.getEmail());
		model.addAttribute("watching", watchservice.getSelectWatchUser(member.getEmail(), movie_id));
		model.addAttribute("today", max_day.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		return "/watch/video";
	}

	@PostMapping(value = "/wish", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String setwish(@RequestBody WishVO wish) {
		System.out.println("wish왔나");
		if (wish.getResult().equals("create")
				&& watchservice.getSelectWishUser(wish.getEmail(), wish.getMovie_id()) == null) {
			int result1 = watchservice.createWish(wish);
			System.out.println("wish생성");
		} else if (wish.getResult().equals("delete")
				&& watchservice.getSelectWishUser(wish.getEmail(), wish.getMovie_id()) != null) {
			int result1 = watchservice.deleteWish(wish);
			System.out.println("wish삭제");
		}
		return "";
	}

	@GetMapping(value = "/bttest")
	public String testdsf() {
		return "/watch/NewFile1";
		
	}
	
}