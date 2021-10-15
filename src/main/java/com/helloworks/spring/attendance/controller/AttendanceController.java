package com.helloworks.spring.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.dailyReport.model.service.DailyReportService;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceController attendanceService;
	
	@RequestMapping("attendanceApiView.ps")
	public String attendanceApiView() {
		System.out.println("근태현황 api  페이지 전환");
		return "attendance/AttendanceApiView";
	}
}
