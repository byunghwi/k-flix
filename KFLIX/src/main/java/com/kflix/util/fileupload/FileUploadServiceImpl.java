package com.kflix.util.fileupload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.UUID;

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

	String class_path = this.getClass().getResource("/").getPath();
	String local_path = class_path.substring(1, class_path.indexOf("SPRING/"));

	// 저장할 주소
	String[] SAVE_PATH = {
			local_path + "k-flix/KFLIX/src/main/webapp/resources/imgs/movie/poster/",
			local_path + "k-flix/KFLIX/src/main/webapp/resources/videos/teaser/",
			local_path + "k-flix/KFLIX/src/main/webapp/resources/videos/full/"
	};


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

	
	private boolean checkOverlap(MultipartFile file, int i) {
		File check_file = new File(SAVE_PATH[i]);

		if (!check_file.isDirectory()) {

			if(check_file.mkdir()) {
				log.info("디렉토리 만들기 성공");

			} else {
				log.info("디렉토리 만들기 실패");
				return false;
			}

		}
		
		String origin_name = file.getOriginalFilename();
		
		check_file = new File(SAVE_PATH[i] + origin_name);
		
		// 파일 존재 여부 중복처리
		if (!check_file.exists()) {
			log.info(origin_name + " - 중복 되지 않음");
			return true;

		}  else {

			log.info(origin_name + " - 중복 파일");
			
		}
		return false;
	}


	private void writeFile(MultipartFile file, int i) throws IOException{
		if(checkExt(file)) {
			String origin_name = file.getOriginalFilename();
			String upload_path = SAVE_PATH[i] + origin_name;
			//			String ext_name = origin_name.substring(origin_name.lastIndexOf("."), origin_name.length());
			//			
			//			UUID uid = UUID.randomUUID();

			byte[] data = file.getBytes();
			FileOutputStream fos = new FileOutputStream(upload_path);
			fos.write(data);
			fos.close();
			log.info(origin_name + " 업로드 성공");			

		}  else {
			log.info("수정하지 않은 파일");
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

	private boolean delete(MultipartFile file, int num) {
		String origin_name = file.getOriginalFilename();
		File check = new File(SAVE_PATH[num] + origin_name);
		
		if (check.exists()) {
			
			if(check.delete()) {
				log.info(origin_name + "  - 삭제 성공");
			} else {
				log.info(origin_name + " - 삭제 실패");
			}
			
		} else {
			log.warn(origin_name + " - File not Found");
		}
		
		
		return true;
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

	@Override
	public boolean checkOverLaps(MultipartFile poster, MultipartFile teaser, MultipartFile video) {
		boolean poster_ck = checkOverlap(poster, POSTER);
		boolean teaser_ck = checkOverlap(teaser, TEASER);
		boolean video_ck = checkOverlap(video, VIDEO);
		
		return poster_ck && teaser_ck && video_ck;
	}



	@Override
	public boolean fileDelete(MultipartFile poster, MultipartFile teaser, MultipartFile video) {
		delete(poster, POSTER);
		delete(teaser, TEASER);
		delete(video, VIDEO);
		
		return true;
	}

}
