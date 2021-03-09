package com.kflix.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.kflix.genre.domain.Genre;
import com.kflix.member.domain.Member;
import com.kflix.watch.domain.LikeVO;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.domain.WatchVO;
import com.kflix.watch.domain.WishVO;

public interface WatchMapper {

	// 영화 전체 들고오기
	public List<MovieVO> getAllmovie();

	// 영화 top10 들고오기
	public List<MovieVO> getmovieRanking();

	// 영화아이디 영화 검색
	public MovieVO getmovie(int movie_id);

	// 신규 콘텐츠 들고오기 (일주일)
	public List<MovieVO> getNewmovie();

	// 영화 좋아요 누름
	public int likePlus(LikeVO like);

	// 영화 좋아요 취소
	public int likeMinus(LikeVO like);

	// 이어보기 전체 들고오기
	public List<WatchVO> getAllwatch();

	// 이메일별 이어보기 전체 들고오기
	public List<WatchVO> getSelectWatch(String email);

	// 이메일별 이어보기 중 인거 전체 들고오기
	public List<WatchVO> getSelectWatching(String email);

	// 이메일의 영화 이어보기 들고오기
	public WatchVO getSelectWatchUser(@Param("email") String email, @Param("movie_id") int movie_id);

	// 이메일의 영화 이어보기 생성
	public int createWatch(WatchVO watch);

	// 이메일의 영화 이어보기 업데이트
	public int updateWatch(WatchVO watch);

	// 이메일의 영화 이어보기 삭제
	public int deleteWatch(WatchVO watch);

	// 이메일의 영화 찜하기 생성
	public int createWish(WishVO wish);

	// 이메일의 영화 찜하기 삭제
	public int deleteWish(WishVO wish);

	// 이메일별 찜하기 전체 들고오기
	public List<WishVO> getSelectWish(String email);

	// 이메일의 영화 찜하기 들고오기
	public WishVO getSelectWishUser(@Param("email") String email, @Param("movie_id") int movie_id);

	// 이메일의 영화 라이크 생성
	public int createLike(LikeVO like);

	// 이메일의 영화 라이크 삭제
	public int deleteLike(LikeVO like);

	// 이메일의 영화 라이크 들고오기
	public LikeVO getSelectLikeUser(@Param("email") String email, @Param("movie_id") int movie_id);

	// 영화 장르
	public List<Genre> getAllGenre();

	// 검색
	public List<MovieVO> getSearch(String searchValue);

	// 메인화면 티켓확인
	Member checkTicket(String email);

	// 알림
	public List<Member> getSelectAlarm();
	
	public Member getSelectAlarmUser(String email);

	// 신규 콘텐츠 등록 알림 업데이트
	public int updateAlarm(Member alarm);
	
	// 신규 콘텐츠 유저 확인 후 업데이트
	public int cleanAlarm(String email);
}
