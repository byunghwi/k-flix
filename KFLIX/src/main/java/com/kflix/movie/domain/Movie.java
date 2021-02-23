package com.kflix.movie.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;


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
	private String summary;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date movie_release;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	
	private String poster_path;
	private String teaser_path;
	private String video_path;
	private int view_cnt;
	private int movie_rank;
	private String movie_status;

	public void getFileName(String poster_path, String teaser_path, String video_path) {
		this.poster_path = poster_path.substring(poster_path.lastIndexOf('/') + 1);
		this.teaser_path = teaser_path.substring(teaser_path.lastIndexOf('/') + 1);
		this.video_path = video_path.substring(video_path.lastIndexOf('/') + 1);
	}

	private String director_name;
	private String actor_name1;
	private String actor_name2;
	private String actor_name3;
	private String genre_name1;
	private String genre_name2;
	
	private String searching_word;
	private String searching_index; 
	
}
