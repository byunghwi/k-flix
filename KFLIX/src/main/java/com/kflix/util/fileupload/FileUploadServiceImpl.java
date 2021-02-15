package com.kflix.util.fileupload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FileUploadServiceImpl implements FileUploadService {

	// 저장할 주소
	private static final String[] SAVE_PATH = {
			"C:/Users/windows/git/k-flix/KFLIX/src/main/webapp/resources/imgs/movie/poster/",
			"C:/Users/windows/git/k-flix/KFLIX/src/main/webapp/resources/videos/teaser/",
			"C:/Users/windows/git/k-flix/KFLIX/src/main/webapp/resources/videos/full/"
	};
	
	// jsp 요청
	private static final String[] PREFIX_URI = {
							"/kflix/resources/imgs/movie/poster/",
							"/kflix/resources/videos/teaser/",
							"/kflix/resources/videos/full/"
	};
	
	
	@Override
	public String[] restore(MultipartFile[] file) {
		String[] url = new String[3];
		String originFile_name = "";
		String ext_name= "";
		String saveFileName = "";
		
		try {

			for (int i = 0; i < 3; ++i) {
				
				originFile_name = file[i].getOriginalFilename();
//				ext_name = originFile_name.substring(originFile_name.lastIndexOf("."), originFile_name.length());
//				saveFileName = getSaveFileName(ext_name);			
//
//				log.info("겟 오리진 : "+originFile_name);
//				log.info("저장될 이름 : "+saveFileName);
				
				writeFile(file[i], i, originFile_name);
				url[i] = PREFIX_URI[i] + originFile_name;
			}
			
			
		} catch (IOException e) {throw new RuntimeException(e);}
		
		return url;
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

}
