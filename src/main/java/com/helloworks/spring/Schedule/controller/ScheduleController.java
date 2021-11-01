package com.helloworks.spring.Schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	
	// 메뉴바 -> 일정관리 메인화면
	@RequestMapping("schMain.sc")
	public String scheduleMain() {
		System.out.println("일정관리 메인화면으로 이동");
		return "schedule/scheduleMain";
	}
	
	// 일정등록하기 - 페이지
	@RequestMapping("addEventsPage.sc")
	public String addEvents() {
		
		return "schedule/addSchedule";
	}
	
	// 일정등록하기
	@RequestMapping("addEvent.sc")
	public String addEvent() {
		
		return "redirect:schMain.sc";
	}
}
