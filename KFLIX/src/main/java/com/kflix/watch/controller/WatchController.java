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
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kflix.actor.service.ActorService;
import com.kflix.director.service.DirectorService;
import com.kflix.genre.domain.Genre;
import com.kflix.genre.service.GenreService;
import com.kflix.member.domain.Member;
import com.kflix.member.service.MemberService;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.SearchVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.domain.WishVO;
import com.kflix.watch.domain.Basket;
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
	@Autowired
	MemberService memberservice;

	@GetMapping("/browse")
	public String getbrowse(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("login");
		session.setAttribute("login", memberservice.getMemberByEmail(member.getEmail()));
		Basket basket = new Basket();
		List<MovieVO> movies = watchservice.getAllmovie();
		ArrayList<Integer> arr = new ArrayList<>();
		for (MovieVO movie : movies) {
			arr.add(movie.getGenre_id1());
			arr.add(movie.getGenre_id2());
		}
		HashSet<Integer> arr2 = new HashSet<Integer>(arr); // 등록된 영화 장르 중복제거
		ArrayList<Integer> movie_genre = new ArrayList<>(arr2); // 배열로 다시 넣기


		basket.setMovie(watchservice.getAllmovie());
		basket.setWatch(watchservice.getSelectWatch(member.getEmail()));
		basket.setWatching(watchservice.getSelectWatching(member.getEmail()));
		basket.setWish(watchservice.getSelectWish(member.getEmail()));
		basket.setGenre(watchservice.getAllGenre());

		model.addAttribute("basket", basket);
		model.addAttribute("AllGenre", watchservice.getAllGenre());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList('Y'));
		model.addAttribute("movie_genre", movie_genre);
		model.addAttribute("member", watchservice.checkTicket(member.getEmail()));
		model.addAttribute("Ranking", watchservice.getmovieRanking());
		model.addAttribute("newmovie", watchservice.getNewmovie());
		return "/watch/browse";
	}

	@GetMapping("/btest")
	public String btest(Model model, HttpSession session) {

		
		
		return "/watch/NewFile";
		// return "/watch/NewFile";
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
		model.addAttribute("getlike", watchservice.getSelectLikeUser(member.getEmail(), movie_id));
		model.addAttribute("Ranking", watchservice.getmovieRanking());
		model.addAttribute("newmovie", watchservice.getNewmovie());
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
		model.addAttribute("Ranking", watchservice.getmovieRanking());
		model.addAttribute("newmovie", watchservice.getNewmovie());
		return "/watch/video";
	}

	@GetMapping(value = "/browse/search")
	public String search(Model model, String searchValue, HttpSession session) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList('Y'));
		model.addAttribute("AllGenre", watchservice.getAllGenre());
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("Ranking", watchservice.getmovieRanking());
		model.addAttribute("newmovie", watchservice.getNewmovie());
		model.addAttribute("Searchlist", watchservice.getSearch(searchValue));
		for (MovieVO vo : watchservice.getSearch(searchValue)) {
			System.out.println(vo.getMovie_id());
		}

		return "/watch/search";
	}

	@GetMapping(value = "/browse/newmovie")
	public String newmovie(Model model, HttpSession session) {
		model.addAttribute("Allmovie", watchservice.getAllmovie());
		model.addAttribute("AllActor", actorservice.selectAllActorList('Y'));
		model.addAttribute("AllDirector", directorservice.selectAllDirectorList('Y'));
		model.addAttribute("AllGenre", watchservice.getAllGenre());
		model.addAttribute("newmovie", watchservice.getNewmovie());

		Member member = (Member) session.getAttribute("login");
		System.out.println("alarm왔나");
		System.out.println(member.getEmail());
		watchservice.cleanAlarm(member.getEmail());
		model.addAttribute("Ranking", watchservice.getmovieRanking());
		session.setAttribute("login", memberservice.getMemberByEmail(member.getEmail()));
		
		return "/watch/newmovie";
	}
}