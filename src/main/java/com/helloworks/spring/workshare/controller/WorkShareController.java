package com.helloworks.spring.workshare.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.workshare.model.service.WorkShareService;

@Controller
public class WorkShareController {

	@Autowired
	private WorkShareService workShareService;
	
	// 메뉴바 -> 미확인 업무
	@RequestMapping("unCheckedListWS.ws")
	public String unCheckedWorkShare() {
		System.out.println("미확인 업무 메인화면으로 이동");
		return "workShare/workShareAllPage";
	}
	
	// 메뉴바 -> 수신 업무 내역
	@RequestMapping("recvListWS.ws")
	public String checkedWorkShare() {
		System.out.println("수신내역 메인화면으로 이동");
		return "workShare/workShareAllPage";
	}
	
	// 메뉴바 -> 발신 업무 내역
	@RequestMapping("sendListWS.ws")
	public String sendWorkShare() {
		System.out.println("발신 업무 메인화면으로 이동");
		return "workShare/workShareAllPage";
	}
	
	// 메뉴바 -> 임시저장 업무 내역
	@RequestMapping("savedListWS.ws")
	public String savedWorkShare() {
		System.out.println("임시저장 업무 메인화면으로 이동");
		return "workShare/workShareAllPage";
	}
	
	// 업무공유 작성
	@RequestMapping("sendFormView.ws")
	public String sendFormView() {
		System.out.println("임시저장 업무 메인화면으로 이동");
		return "workShare/sendWSForm";
	}
}
