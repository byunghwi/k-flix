package com.kflix.watch.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kflix.genre.domain.Genre;
import com.kflix.mapper.WatchMapper;
import com.kflix.member.domain.Member;
import com.kflix.watch.domain.LikeVO;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.domain.WishVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WatchServiceImpl implements WatchService {

	WatchMapper mapper;

	// 뮤비
	@Override
	public List<MovieVO> getAllmovie() {
		return mapper.getAllmovie();
	}

	@Override
	public List<MovieVO> getmovieRanking() {
		return mapper.getmovieRanking();
	}

	@Override
	public MovieVO getmovie(int movie_id) {
		return mapper.getmovie(movie_id);
	}
	
	@Override
	public List<MovieVO> getNewmovie() {
		return mapper.getNewmovie();
	}

	@Override
	public int likePlus(LikeVO like) {
		return mapper.likePlus(like);
	}

	@Override
	public int likeMinus(LikeVO like) {
		return mapper.likeMinus(like);
	}

	// 와치
	@Override
	public List<WatchVO> getAllwatch() {
		return mapper.getAllwatch();
	}

	@Override
	public List<WatchVO> getSelectWatch(String email) {
		return mapper.getSelectWatch(email);
	}

	@Override
	public List<WatchVO> getSelectWatching(String email) {
		return mapper.getSelectWatching(email);
	}

	@Override
	public int createWatch(WatchVO watch) {
		return mapper.createWatch(watch);
	}

	@Override
	public int updateWatch(WatchVO watch) {
		return mapper.updateWatch(watch);
	}

	@Override
	public int deleteWatch(WatchVO watch) {
		return mapper.deleteWatch(watch);
	}

	@Override
	public WatchVO getSelectWatchUser(String email, int movie_id) {
		return mapper.getSelectWatchUser(email, movie_id);
	}

	// 위시
	@Override
	public List<WishVO> getSelectWish(String email) {
		return mapper.getSelectWish(email);
	}

	@Override
	public int createWish(WishVO wish) {
		return mapper.createWish(wish);
	}

	@Override
	public int deleteWish(WishVO wish) {
		return mapper.deleteWish(wish);
	}

	@Override
	public WishVO getSelectWishUser(String email, int movie_id) {
		return mapper.getSelectWishUser(email, movie_id);
	}

	// 라이크

	@Override
	public int createLike(LikeVO like) {
		return mapper.createLike(like);
	}

	@Override
	public int deleteLike(LikeVO like) {
		return mapper.deleteLike(like);
	}

	@Override
	public LikeVO getSelectLikeUser(String email, int movie_id) {
		return mapper.getSelectLikeUser(email, movie_id);
	}

	// 검색
	@Override
	public List<MovieVO> getSearch(String searchValue) {
		return mapper.getSearch(searchValue);
	}

	// 장르
	@Override
	public List<Genre> getAllGenre() {
		return mapper.getAllGenre();
	}

	@Override
	public Member checkTicket(String email) {
		return mapper.checkTicket(email);
	}

	// 알림
	@Override
	public List<Member> getSelectAlarm() {
		return mapper.getSelectAlarm();
	}
	
	@Override
	public Member getSelectAlarmUser(String email) {
		return mapper.getSelectAlarmUser(email);
	}

	@Override
	public int updateAlarm(Member alarm) {
		return mapper.updateAlarm(alarm);
	}
	
	@Override
	public int cleanAlarm(String email) {
		return mapper.cleanAlarm(email);
	}

}
