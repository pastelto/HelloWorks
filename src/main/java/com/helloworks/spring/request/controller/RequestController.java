package com.helloworks.spring.request.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestController {

	// 신청 메뉴 페이지 전환
	@RequestMapping("request.menu")
	public String composeMail() {
		System.out.println("신청메뉴페이지");
		return "request/menu";
	}
	
	// 비품 신청

}
