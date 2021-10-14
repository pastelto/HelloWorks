package com.helloworks.spring.dailyReport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.dailyReport.model.service.DailyReportService;

@Controller
public class DailyReportController {

	@Autowired
	private DailyReportService dailyReportService;
	
	@RequestMapping("enrollReportForm.dr")
	public String enrollReportForm() {
		System.out.println("일일보고 등록 페이지 전환");
		return "dailyReport/dailyReportForm";
	}
}
