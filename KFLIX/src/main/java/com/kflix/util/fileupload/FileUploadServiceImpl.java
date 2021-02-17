package com.kflix.util.fileupload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.tika.Tika;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FileUploadServiceImpl implements FileUploadService {

	// 저장할 주소
	private static final String[] SAVE_PATH = {
			"C:/Users/Ahos/Desktop/local_workSpace/k-flix/KFLIX/src/main/webapp/resources/imgs/movie/poster/",
			"C:/Users/Ahos/Desktop/local_workSpace/k-flix/KFLIX/src/main/webapp/resources/videos/teaser/",
			"C:/Users/Ahos/Desktop/local_workSpace/k-flix/KFLIX/src/main/webapp/resources/videos/full/"
	};

	// jsp 요청
	private static final String[] PREFIX_URI = {
			"/kflix/resources/imgs/movie/poster/",
			"/kflix/resources/videos/teaser/",
			"/kflix/resources/videos/full/"
	};

	Tika tika = new Tika();


	@Override
	public boolean checkExt(MultipartFile file) {
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

	private boolean writeFile(MultipartFile file, int i, String saveFileName) throws IOException{
		boolean result = false;

		byte[] data = file.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH[i] + saveFileName);
		fos.write(data);
		fos.close();

		return result;
	};


	@Override
	public String[] restore(MultipartFile[] file) {
		String[] url = new String[3];
		String originFile_name = "";
		String ext_name= "";
		String saveFileName = "";

//		try {

			for (int i = 0; i < 3; ++i) {
				if(file[i] == null) {
					continue;
				}
				
				originFile_name = file[i].getOriginalFilename();
				//				ext_name = originFile_name.substring(originFile_name.lastIndexOf("."), originFile_name.length());
				//				saveFileName = getSaveFileName(ext_name);			
				//
				//				log.info("겟 오리진 : "+originFile_name);
				//				log.info("저장될 이름 : "+saveFileName);

//				writeFile(file[i], i, originFile_name);
				
				// DB에 저장될거
				url[i] = PREFIX_URI[i] + originFile_name;
			}


//		} catch (IOException e) {
//			throw new RuntimeException(e);
//		}

		return url;
	}


}
