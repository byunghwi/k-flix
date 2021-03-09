package com.kflix.excel.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kflix.excel.service.ExcelService;
import com.kflix.watch.service.WatchService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@Controller
public class ExcelController {
 
    @Autowired
    WatchService watchService;
    
    @Autowired
    ExcelService excelService;
    
    @RequestMapping(value = "/excelDownload", method = RequestMethod.POST)
    public void ExcelDown(String target, HttpServletResponse response) throws Exception{
    	 
    	System.out.println("@@@@@@@@@@@@@@@ExcelDown START@@@@@@@@@@@@@@@");
         
    	 excelService.getExcelDown(response, target);
         
    	 System.out.println("@@@@@@@@@@@@@@@ExcelDown END@@@@@@@@@@@@@@@");
         
    }
 
}