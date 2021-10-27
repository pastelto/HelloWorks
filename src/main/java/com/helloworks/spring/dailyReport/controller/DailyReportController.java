package com.helloworks.spring.dailyReport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.dailyReport.model.service.DailyReportService;
import com.helloworks.spring.employee.model.vo.Employee;

@Controller
public class DailyReportController {

	@Autowired
	private DailyReportService dailyReportService;
	
	@RequestMapping("enrollReportForm.dr")
	public String enrollReportForm(HttpServletRequest request, Model model) {
		System.out.println("일일보고 등록 페이지 전환");
		
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		
		model.addAttribute("loginUser", loginUser);
		return "dailyReport/dailyReportForm";
	}
}
