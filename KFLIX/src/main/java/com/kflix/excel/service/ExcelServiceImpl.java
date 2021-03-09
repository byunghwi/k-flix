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

import com.kflix.excel.style.Excelcellstyle;
import com.kflix.mapper.ExcelMapper;
import com.kflix.mapper.WatchMapper;
import com.kflix.watch.domain.MovieVO;
import com.kflix.watch.service.WatchService;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ExcelServiceImpl implements ExcelService {

	@Autowired
	ExcelMapper mapper;

	// DB
	@Override
	public List<Map<String, Object>> getAllmoviemap() {
		return mapper.getAllmoviemap();
	}

	@Override
	public List<Map<String, Object>> getAllmember() {
		return mapper.getAllmember();
	}

	// ExcelDown
	@Override
	public void getExcelDown(HttpServletResponse response, String target) {

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

			// 테이블 헤더용/바디용 스타일
			CellStyle headStyle = Excelcellstyle.headstyle(workbook);
			CellStyle bodyStyle = Excelcellstyle.bodystyle(workbook);

			List<Map<String, Object>> excelList = null;
			List<String> headNames = null;

			if (target.toUpperCase().equals("MOVIE")) {
				// 엑셀에 작성할 리스트를 가져온다.
				excelList = getAllmoviemap();
				headNames = new MovieVO().getHeadNames();

			} else if (target.toUpperCase().equals("MEMBER")) {
				// 엑셀에 작성할 리스트를 가져온다.
				excelList = getAllmember();
				headNames = Arrays.asList("email", "nick", "birth", "member_age", "gender", "join_date", "ticket_id",
						"kakao", "pay_sid", "pay_exp_date", "pay_remove_dt");
			} else {

			}

			// 헤더 생성
			row = sheet.createRow(rowCount++);
			for (String headname : headNames) {
				cell = row.createCell(cellCount++);
				cell.setCellStyle(headStyle);
				cell.setCellValue(headname);
			}

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

			// 가로 자동 맞춤
			for (int i = 0; i < cellCount; i++) // autuSizeColumn after setColumnWidth setting!!
			{
				sheet.autoSizeColumn(i);
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