package com.helloworks.spring.request.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.request.model.service.RequestService;
import com.helloworks.spring.request.model.vo.RequestEq;

@Controller
public class RequestController {

	@Autowired
	private RequestService requestService;

	// 신청 메뉴 페이지 전환
	@RequestMapping("request.menu")
	public String requestMenu() {
		//System.out.println("신청메뉴페이지");
		return "request/menu";
	}

	// 비품 신청
	@RequestMapping("request.eq")
	public String requestEquipment(RequestEq rEq, Model m) {
		//System.out.println(rEq);
		requestService.requestEquipment(rEq);
//		m.addAttribute("msg","신청완료 되었습니다." );
		return "request/menu";
	}
}
