package com.helloworks.spring.request.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class managementController {
	
	//회의실 관리 페이지로 전환
	@RequestMapping("manage.mtr")
	public String manageMtr() {
		System.out.println("회의실 관리페이지");
		return "request/manageMeetingRoom";
	}
	
	//차량 관리 페이지로 전환
	@RequestMapping("manage.car")
	public String manageCar() {
		System.out.println("차량 관리페이지");
		return "request/manageCar";
	}
}
