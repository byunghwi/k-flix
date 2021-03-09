package com.kflix.watch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.member.domain.Member;
import com.kflix.watch.domain.LikeVO;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WishVO;
import com.kflix.watch.service.WatchService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest")
@Log4j
public class WatchRestController {

	@Autowired
	WatchService watchservice;
	
	@PostMapping(value = "/wish", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public void setwish(@RequestBody WishVO wish) {
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
	}
	
	@PatchMapping(value = "/like", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public void setlike(@RequestBody LikeVO like) {
		System.out.println("like왔나");
		System.out.println(like.getMovie_id()+ like.getResult());
		
			if (like.getResult().equals("plus") && watchservice.getSelectLikeUser(like.getEmail(), like.getMovie_id()) == null) { 
			  watchservice.likePlus(like);
			  watchservice.createLike(like);
			  System.out.println("likePlus"); 
			} else if(like.getResult().equals("minus") && watchservice.getSelectLikeUser(like.getEmail(), like.getMovie_id()) != null) { 
			  watchservice.likeMinus(like);
			  watchservice.deleteLike(like);
			  System.out.println("likeMinus"); 
			}
	}
}
