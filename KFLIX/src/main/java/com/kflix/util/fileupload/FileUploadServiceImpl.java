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
			"/filepath/img_kflix/",
			"/filepath/teaser_kflix/",
			"/filepath/movie_kflix/"
	};


	private static int POSTER = 0;
	private static int TEASER = 1;
	private static int VIDEO = 2;

	Tika tika = new Tika();

	//private static final String LOCAL_PATH = "C:\\Users\\gpdld\\git\\";

	// 저장할 주소
	private static final String[] SAVE_PATH = {
			"C:\\Users\\gpdld\\Desktop\\img_kflix\\",
			"C:\\Users\\gpdld\\Desktop\\teaser_kflix\\",
			"C:\\Users\\gpdld\\Desktop\\movie_kflix\\"
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
		log.info("======== 확장자 오류 체크 ========");
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


	private boolean checkOverlap(MultipartFile file, int i, Movie movie) {
		// 멀티파일 널체크
		if(file == null) {
			log.info("파일 변경하지 않음(multifiel - null)");
			return true;
		}
		
		String origin_name = file.getOriginalFilename();
		
		// 변경인지 아닌지 체크
		if(origin_name.equals("")) {
			log.info("파일 변경하지 않음(파일 변경을 시도 하지 않음)");
			return true;
		}
		
		File check_file = new File(SAVE_PATH[i]);

		if (!check_file.isDirectory()) {

			if(check_file.mkdir()) {
				log.info("디렉토리 만들기 성공");

			} else {
				log.info("디렉토리 만들기 실패");
				return false;
			}

		}


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
			log.info("변경되지 않아 pathName 안건듬(multifile - null)");
			
		} else if ( file.getOriginalFilename().equals("")) {
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

	private boolean delete(MultipartFile file, int num, Movie movie) {
		String origin_name = "";
		File check;
		if (file == null) {
			log.info("변경되지 않아 삭제하지 않음(multifile - null)");
		} else if (file.getOriginalFilename().equals("")) {
			log.info("변경되지 않아 삭제하지 않음(파일 변경을 시도 하지 않음)");
		} else {

			switch(num) {
			case 0:
				if (file.getOriginalFilename().equals(movie.getPoster_path())) {
					log.info("변경되지 않아 삭제하지 않음");
				} else {

					origin_name = movie.getPoster_path();
					check = new File(SAVE_PATH[num] + origin_name);
					del(check, origin_name);
				}
				break;
			case 1:
				if (file.getOriginalFilename().equals(movie.getTeaser_path())) {
					log.info("변경되지 않아 삭제하지 않음");
				} else {

					origin_name = movie.getTeaser_path();
					check = new File(SAVE_PATH[num] + origin_name);
					del(check, origin_name);
				}
				break;
			case 2:
				if (file.getOriginalFilename().equals(movie.getVideo_path())) {
					log.info("변경되지 않아 삭제하지 않음");
				} else {

					origin_name = movie.getVideo_path();
					check = new File(SAVE_PATH[num] + origin_name);
					del(check, origin_name);
				}
				break;
			}

		} 
		//		else {
		//
		//			origin_name = file.getOriginalFilename();
		//			check = new File(SAVE_PATH[num] + origin_name);
		//			del(check, origin_name);
		//		}

		return true;
	}

	private void del(File check, String origin_name){

		if (check.exists()) {

			if(check.delete()) {
				log.info(origin_name + "  - 삭제 성공");
			} else {
				log.info(origin_name + " - 삭제 실패");
			}

		} else {
			log.warn(origin_name + " - File not Found 삭제 못함");
		}
	}

	@Override
	public boolean upload(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie) {

		try {
			log.info("======== 파일 업로드 ========");
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
	public boolean checkOverLaps(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie) {
		log.info("======= 파일명 중복 체크 ========");
		boolean poster_ck = checkOverlap(poster, POSTER, movie);
		boolean teaser_ck = checkOverlap(teaser, TEASER, movie);
		boolean video_ck = checkOverlap(video, VIDEO, movie);

		return poster_ck && teaser_ck && video_ck;
	}



	@Override
	public boolean fileDelete(MultipartFile poster, MultipartFile teaser, MultipartFile video, Movie movie) {
		log.info("======== 파일 삭제 처리 ========");
		delete(poster, POSTER, movie);
		delete(teaser, TEASER, movie);
		delete(video, VIDEO, movie);

		return true;
	}
}
