package com.kflix.util.fileupload;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

	public String[] restore(MultipartFile[] file);
}
