package com.kflix.watch.service;

import java.util.List;
import java.util.Map;


import com.kflix.genre.domain.Genre;
import com.kflix.member.domain.Member;
import com.kflix.watch.domain.LikeVO;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.domain.WishVO;


public interface WatchService {

	// 뮤비 관련 쿼리 서비스
	public List<MovieVO> getAllmovie();

	public List<MovieVO> getmovieRanking();

	public MovieVO getmovie(int movie_id);
	
	public List<MovieVO> getNewmovie();

	// 좋아요 관련 쿼리 서비스
	public int likePlus(LikeVO like);

	public int likeMinus(LikeVO like);

	// 와치 관련 쿼리 서비스
	public List<WatchVO> getAllwatch();

	public List<WatchVO> getSelectWatch(String email);

	public List<WatchVO> getSelectWatching(String email);

	public WatchVO getSelectWatchUser(String email, int movie_id);

	public int createWatch(WatchVO watch);

	public int updateWatch(WatchVO watch);

	public int deleteWatch(WatchVO watch);

	// 위시 관련 쿼리 서비스
	public int createWish(WishVO wish);

	public List<WishVO> getSelectWish(String email);

	public int deleteWish(WishVO wish);

	public WishVO getSelectWishUser(String email, int movie_id);

	// 라이크 관련 쿼리 서비스
	public int createLike(LikeVO wish);

	public int deleteLike(LikeVO like);

	public LikeVO getSelectLikeUser(String email, int movie_id);

	// 검색 서비스
	public List<MovieVO> getSearch(String searchValue);
	
	// 장르 관련 쿼리 서비스
	public List<Genre> getAllGenre();

	// 메인화면 티켓확인
	Member checkTicket(String email);
	
	// 알림
	public List<Member> getSelectAlarm();

	public Member getSelectAlarmUser(String email);

	public int updateAlarm(Member alarm);
	
	public int cleanAlarm(String email);
}