package com.helloworks.spring.request.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helloworks.spring.request.model.service.RequestService;
import com.helloworks.spring.request.model.vo.Car;
import com.helloworks.spring.request.model.vo.Mtr;

@Controller
public class managementController {

	@Autowired
	private RequestService requestService;

	// 회의실 관리 ----------------
	// 회의실 리스트조회
	@RequestMapping("manage.mtr")
	public String manageMtr(Model m) {
		// System.out.println("회의실 관리페이지");
		ArrayList<Mtr> list = requestService.manageMtr();
		// System.out.println("list "+ list);
		m.addAttribute("list", list);
		return "request/manageMeetingRoom";
	}

	// 회의실 등록 팝업 페이지로
	@RequestMapping("openAdd.mtr")
	public String openAddMtr() {
		// System.out.println("회의실 등록페이지 팝업");
		return "request/addMeetingRoom";
	}

	// 회의실 등록
	@ResponseBody
	@RequestMapping("add.mtr")
	public String addMtr(Mtr mtr, HttpServletRequest request, Model model) {
		requestService.addMtr(mtr);
		String result = "성공!";
		return String.valueOf(result);
	}
	
	// 회의실 삭제
	@ResponseBody
	@RequestMapping(value = "/delete.Mtr", method = RequestMethod.POST)
	public String deleteMtr(@RequestParam(value = "checkArr[]") List<String> checkArr){

		requestService.deleteMtr(checkArr);
		System.out.println("성공");
		String result = "성공!";
		return String.valueOf(result);

	}
	

	// 차량 관리 ----------------
	// 차량 관리 페이지로 전환
	@RequestMapping("manage.car")
	public String manageCar(Model m) {
		ArrayList<Mtr> list = requestService.manageCar();
		m.addAttribute("list", list);
		return "request/manageCar";
	}

	// 차량 등록 팝업 페이지로
	@RequestMapping("openAdd.car")
	public String openAddCar() {
		System.out.println("차량 등록페이지 팝업");
		return "request/addCar";
	}

	// 차량 등록
	@ResponseBody
	@RequestMapping("add.car")
	public String addCar(Car car, HttpServletRequest request, Model model) {
		requestService.addCar(car);
		String result = "성공!";
		return String.valueOf(result);
	}

	// 차량 삭제
	@ResponseBody
	@RequestMapping(value = "/delete.car", method = RequestMethod.POST)
	public String deleteCar(@RequestParam(value = "checkArr[]") List<String> checkArr){

		requestService.deleteCar(checkArr);
		System.out.println("성공");
		String result = "성공!";
		return String.valueOf(result);

	}

}
