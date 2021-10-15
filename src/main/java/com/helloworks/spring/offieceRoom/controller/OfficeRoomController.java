package com.helloworks.spring.offieceRoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.offieceRoom.model.service.OfficeRoomService;

@Controller
public class OfficeRoomController {

	@Autowired
	private OfficeRoomService officeRoomService;
	
	@RequestMapping("searchEmpMain.or")
	public String enrollReportForm() {
		System.out.println("직원검색 페이지 전환");
		return "searchEmployee/searchEmployeeMain";
	}
}
