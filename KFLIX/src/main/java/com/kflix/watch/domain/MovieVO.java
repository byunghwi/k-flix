package com.kflix.watch.domain;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;


@Data
@Component
public class MovieVO {
	
	List<String> headNames = Arrays.asList(
			"movie_id", "movie_title", "rating", "play_time", "director_id",
			"actor_id1", "actor_id2", "actor_id3", "genre_id1", "genre_id2",
			"country", "movie_release", "summary", "reg_date", "poster_path",
			"teaser_path", "video_path", "view_cnt", "movie_rank");
	
	private int movie_id;
	private String movie_title;
	private String rating;
	private int play_time;
	private int director_id;
	private int actor_id1;
	private int actor_id2;
	private int actor_id3;
	private int genre_id1;
	private int genre_id2;
	private String country;
	private String movie_release;
	private String summary;
	private String result;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	
	private String poster_path;
	private String teaser_path;
	private String video_path;
	private int view_cnt;
	private int movie_rank;
	private char movie_status;
	
	public void changePath(String poster_path, String teaser_path, String video_path) {
		this.poster_path = "/kflix/poster/" + poster_path;
		this.teaser_path = "/kflix/teaser/" + teaser_path;
		this.video_path = "/kflix/video/" + video_path;
	}

}
