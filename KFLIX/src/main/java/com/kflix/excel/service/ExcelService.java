package com.kflix.excel.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
 
 
public interface ExcelService {
 
	public void getExcelDown(HttpServletResponse response, String target);

 
}
