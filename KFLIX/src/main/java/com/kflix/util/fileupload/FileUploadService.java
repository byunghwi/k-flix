package com.kflix.util.fileupload;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

	public String[] restore(MultipartFile[] file);
	
	public boolean checkExtAll(MultipartFile poster, MultipartFile teaser, MultipartFile video);
	
	public boolean checkExt(MultipartFile file);
	
}
