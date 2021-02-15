package com.kflix.movie.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
@Component
public class Movie {

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
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	
	private String poster_path;
	private String teaser_path;
	private String video_path;
	private int view_cnt;
	private int movie_rank;
	private String movie_status;
	
	public void changePaths(String[] path) {
		this.poster_path = path[0];
		this.teaser_path = path[1];
		this.video_path = path[2];
	}

}