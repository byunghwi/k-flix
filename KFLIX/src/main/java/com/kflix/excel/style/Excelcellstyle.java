package com.kflix.excel.style;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Workbook;

public class Excelcellstyle {

	public static CellStyle headstyle(Workbook workbook) {

		// 테이블 헤더용/바디용 스타일
		CellStyle cellStyle = workbook.createCellStyle();

		// 폰트 스타일
		Font font = workbook.createFont();
		font.setFontHeightInPoints((short) 12);
		font.setBold(true);
		font.setFontName("맑은 고딕");

		cellStyle.setFont(font);
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		// 데이터는 가운데 정렬합니다.
		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		/*
		 * // 배경색은 흰색입니다.
		 * headStyle.setFillForegroundColor(HSSFColorPredefined.WHITE.getIndex());
		 * headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		 */

		return cellStyle;
	}

	public static CellStyle bodystyle(Workbook workbook) {

		// 테이블 헤더용/바디용 스타일
		CellStyle cellStyle = workbook.createCellStyle();

		// 폰트 스타일
		Font font = workbook.createFont();
		font.setFontHeightInPoints((short) 12);
		font.setFontName("맑은 고딕");

		cellStyle.setFont(font);
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		// 데이터는 가운데 정렬합니다.
		cellStyle.setAlignment(HorizontalAlignment.CENTER);

		return cellStyle;
	}
}
