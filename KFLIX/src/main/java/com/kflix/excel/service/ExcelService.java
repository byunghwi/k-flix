package com.kflix.excel.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
 
 
public interface ExcelService {

	public List<Map<String, Object>> getAllmoviemap();
	
	public List<Map<String, Object>> getAllmember();
	
	
	public void getExcelDown(HttpServletResponse response, String target);

 
}
