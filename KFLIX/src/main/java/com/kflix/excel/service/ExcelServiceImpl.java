package com.kflix.excel.service;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kflix.watch.service.WatchService;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ExcelServiceImpl implements ExcelService {

	@Autowired
	WatchService watchService;
	
	@Override
	public void getExcelDown(HttpServletResponse response, String target) {

		// 엑셀에 작성할 리스트를 가져온다.
		List<Map<String, Object>> excelList = watchService.getAllmoviemap();
		

		try {
			// Excel Down 시작
			Workbook workbook = new HSSFWorkbook();

			// 시트생성
			Sheet sheet = workbook.createSheet("시트1");

			// 행, 열, 열번호
			Row row = null;
			Cell cell = null;
			int rowCount = 0;
			int cellCount = 0;

			/*
			 * // 배경색은 흰색입니다.
			 * headStyle.setFillForegroundColor(HSSFColorPredefined.WHITE.getIndex());
			 * headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			 */

			// 테이블 헤더용 스타일
			CellStyle headStyle = workbook.createCellStyle();

			// 헤더 폰트 스타일
			Font headFont = workbook.createFont();
			headFont.setFontHeightInPoints((short) 12);
			headFont.setBold(true);
			headFont.setFontName("맑은 고딕");

			headStyle.setFont(headFont);
			headStyle.setBorderTop(BorderStyle.THIN);
			headStyle.setBorderBottom(BorderStyle.THIN);
			headStyle.setBorderLeft(BorderStyle.THIN);
			headStyle.setBorderRight(BorderStyle.THIN);
			// 데이터는 가운데 정렬합니다.
			headStyle.setAlignment(HorizontalAlignment.CENTER);

			// 테이블 데이터용 스타일
			CellStyle bodyStyle = workbook.createCellStyle();

			// 테이터 폰트 스타일
			Font bodyFont = workbook.createFont();
			bodyFont.setFontHeightInPoints((short) 12);
			bodyFont.setFontName("맑은 고딕");

			bodyStyle.setFont(bodyFont);
			bodyStyle.setBorderTop(BorderStyle.THIN);
			bodyStyle.setBorderBottom(BorderStyle.THIN);
			bodyStyle.setBorderLeft(BorderStyle.THIN);
			bodyStyle.setBorderRight(BorderStyle.THIN);
			// 데이터는 가운데 정렬합니다.
			bodyStyle.setAlignment(HorizontalAlignment.CENTER);

			List<String> headNames = Arrays.asList(
					"movie_id", "movie_title", "rating", "play_time", "director_id",
					"actor_id1", "actor_id2", "actor_id3", "genre_id1", "genre_id2",
					"country", "movie_release", "summary", "reg_date", "poster_path",
					"teaser_path", "video_path", "view_cnt", "movie_rank");
			
			// 헤더 생성
			row = sheet.createRow(rowCount++);
			for (String headname : headNames) {
				cell = row.createCell(cellCount++);
				cell.setCellStyle(headStyle);
				cell.setCellValue(headname);
			}
			System.out.println(excelList);
			// 데이터 부분 생성
			for (Map<String, Object> map : excelList) {

				System.out.println("DB DATA : " + map.toString());

				row = sheet.createRow(rowCount++);
				cellCount = 0;
				for (String headname : headNames) {
					cell = row.createCell(cellCount++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue("" + map.get(headname.toUpperCase()));
				}
			}

			// 파일 명이 겹치지 않게 파일 이름에 날짜 추가
			Date date = new Date();
			SimpleDateFormat dayformat = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat hourformat = new SimpleDateFormat("hh:mm:ss");
			String day = dayformat.format(date);
			String hour = hourformat.format(date);

			// 파일 저장 이름
			String fileName = target + "_" + day + "_" + hour + ".xlsx";

			// 컨텐츠 타입과 파일명 지정
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName);

			// 엑셀 출력
			OutputStream os = response.getOutputStream();
			workbook.write(os);
			workbook.close();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}