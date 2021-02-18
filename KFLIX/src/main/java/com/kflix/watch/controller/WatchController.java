package com.kflix.watch.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.service.WatchService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class WatchController {

   WatchService service;
   /* String email = "nn@naver.com"; 이럼 안됨 */

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
      model.addAttribute("Allmovie", service.getAllmovie());
      model.addAttribute("watch", service.getSlectWatch("nn@naver.com"));
      model.addAttribute("email", "nn@naver.com");
      return "/watch/browse";
   }

   /* js에서 form으로 보낼 경우
    * @PostMapping("/browse/{currentTime:.+}") public String
    * getbrowse1(RedirectAttributes rttr, @PathVariable("currentTime") double
    * currentTime) { System.out.println(currentTime); return "redirect:/browse"; }
    */

   @PostMapping(value = "/browse", consumes = "application/json", produces = "text/html; charset=UTF-8")
   public String createEmployee(@RequestBody WatchVO watch) {
      log.info(watch);
      System.out.println(watch.getView_point());
      int result = service.createWatch(watch);
      return "redirect:/kflix/browse";
   }

   @GetMapping(value = "/browse/watch/{movie_id}", produces = MediaType.APPLICATION_JSON_VALUE)
   public String getwatch(Model model, @PathVariable("movie_id") int movie_id) {
      model.addAttribute("movie", service.getmovie(movie_id));
      model.addAttribute("watch", service.getSlectWatch("nn@naver.com"));
      model.addAttribute("email", "nn@naver.com");
      return "/watch/video";
   }

}