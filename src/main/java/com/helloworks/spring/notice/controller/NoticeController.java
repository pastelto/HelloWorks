package com.helloworks.spring.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.dailyReport.model.service.DailyReportService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeController noticeService;
	
	@RequestMapping("noticeListView.nt")
	public String noticeListView() {
		System.out.println("공지사항 리스트  페이지 전환");
		return "notice/NoticeListView";
	}
}
