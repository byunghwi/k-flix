package com.kflix.util.fileupload;

import org.springframework.web.multipart.MultipartFile;

import com.kflix.movie.domain.Movie;

public interface FileUploadService {

	public boolean upload(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie);
	
	public void setPathNames(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie);
	
	public boolean checkExtAll(MultipartFile poster, MultipartFile teaser, MultipartFile video);
	
	public boolean checkExt(MultipartFile file);
	
	public boolean checkOverLaps(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie);
	
	public boolean fileDelete(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie);
	
}
