package com.kflix.util.fileupload;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;


import org.apache.tika.Tika;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kflix.movie.domain.Movie;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FileUploadServiceImpl implements FileUploadService {
	

	// jsp 요청
	private static final String[] PREFIX_URI = {
			"/kflix/resources/imgs/movie/poster/",
			"/kflix/resources/videos/teaser/",
			"/kflix/resources/videos/full/"
	};


	private static int POSTER = 0;
	private static int TEASER = 1;
	private static int VIDEO = 2;

	Tika tika = new Tika();


	@Override
	public boolean checkExt(MultipartFile file) {
		if (file == null) return false;

		try {
			String stream = tika.detect(file.getInputStream());

			return checking(stream);

		} catch (IOException e) {e.printStackTrace();}

		return false;
	}



	// 확장자 유효성 검사
	@Override
	public boolean checkExtAll(MultipartFile poster, MultipartFile teaser, MultipartFile video) {
		String class_path = this.getClass().getResource("/").getPath();
		String local_path = class_path.substring(1, class_path.indexOf("SPRING/"));
		log.info(local_path);
		if (poster == null && teaser == null && video == null) return false;

		try {

			String poster_type = tika.detect(poster.getInputStream());
			String teaser_type = tika.detect(teaser.getInputStream());
			String video_type = tika.detect(video.getInputStream());

			log.info("포스터 이름 / mimeType - " + poster.getOriginalFilename() + " / "+ poster_type);
			log.info("티 저 이름 / mimeType - " + teaser.getOriginalFilename() + " / " + teaser_type);
			log.info("비디오 이름 / mimeType -" + video.getOriginalFilename() + " / " + video_type);

			if (checking(poster_type) && checking(teaser_type) && checking(video_type)) {
				return true;
			};

		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

		return false;
	}


	private boolean checking(String type) {
		if (type == null || type.equals("")) return false;

		ArrayList<String> ext = new ArrayList<>();

		if(type.startsWith("image")) {
			ext.add("image/jpg");
			ext.add("image/png");
			ext.add("image/jpeg");
			ext.add("image/jfif");
			ext.add("image/pjpeg");
			ext.add("image/pjp");

		} else {
			ext.add("video/x-msvideo");
			ext.add("video/mp4");
			ext.add("video/quicktime");
			ext.add("video/x-matroska");
			ext.add("application/x-matroska");

		}

		for (int i = 0; i < ext.size(); i++) {
			if (type.equals(ext.get(i))) {
				return true;
			}
		}

		return false;
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String getSaveFileName(String ext_name) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += ext_name;

		return fileName;
	}

	private boolean writeFile(MultipartFile file, int i) throws IOException{
		//				ext_name = originFile_name.substring(originFile_name.lastIndexOf("."), originFile_name.length());
		//				saveFileName = getSaveFileName(ext_name);			
		//
		//				log.info("겟 오리진 : "+originFile_name);
		//				log.info("저장될 이름 : "+saveFileName);

		String class_path = this.getClass().getResource("/").getPath();
		String local_path = class_path.substring(1, class_path.indexOf("SPRING/"));
		
		// 저장할 주소
		String[] SAVE_PATH = {
				local_path + "k-flix/KFLIX/src/main/webapp/resources/imgs/movie/poster/",
				local_path + "k-flix/KFLIX/src/main/webapp/resources/videos/teaser/",
				local_path + "k-flix/KFLIX/src/main/webapp/resources/videos/full/"
		};
		
		if(checkExt(file)) {
			String origin_name = file.getOriginalFilename();
			byte[] data = file.getBytes();
			FileOutputStream fos = new FileOutputStream(SAVE_PATH[i] + origin_name);
			fos.write(data);
			fos.close();
			log.info(origin_name + " 업로드 성공");			
			return true;

		} else {
			return false;
		}
	};

	private void setPathName(MultipartFile file, int num, Movie movie){	

		String originFile_name = "";
		if (file == null) {
			switch(num) {
			case 0:
				movie.setPoster_path(PREFIX_URI[num] + movie.getPoster_path());
				break;
			case 1:
				movie.setTeaser_path(PREFIX_URI[num] + movie.getTeaser_path());
				break;
			case 2:
				movie.setVideo_path(PREFIX_URI[num] + movie.getVideo_path());
				break;
			}

		} else {
			originFile_name = file.getOriginalFilename();
			String path = PREFIX_URI[num] + originFile_name;

			switch(num) {
			case 0:
				movie.setPoster_path(path);
				break;
			case 1:
				movie.setTeaser_path(path);
				break;
			case 2:
				movie.setVideo_path(path);
				break;
			}
		}

	}


	@Override
	public boolean upload(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie) {

		try {

			writeFile(poster, POSTER);
			writeFile(teaser, TEASER);
			writeFile(video, VIDEO);
			
			return true;
		} catch (IOException e) {
			log.info(e.getMessage());
			return false;
		}		
	}



	@Override
	public void setPathNames(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie) {
		setPathName(poster, POSTER, movie);
		setPathName(teaser, TEASER, movie);
		setPathName(video, VIDEO, movie);

	}


}
