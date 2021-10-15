package com.helloworks.spring.Schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	
	// 메뉴바 -> 일정관리 메인화면
	@RequestMapping("schMain.sc")
	public String workShareMain() {
		System.out.println("일정관리 메인화면으로 이동");
		return "schedule/scheduleMain";
	}
}
