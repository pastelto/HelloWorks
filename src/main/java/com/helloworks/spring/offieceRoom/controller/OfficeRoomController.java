package com.helloworks.spring.offieceRoom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.service.OfficeRoomService;

@Controller
public class OfficeRoomController {

	@Autowired
	private OfficeRoomService officeRoomService;
	/*
	@RequestMapping("searchEmpMain.or")
	public String enrollReportForm() {
		System.out.println("직원검색 페이지 전환");
		return "searchEmployee/searchEmployeeMain";
	}
	*/
	@RequestMapping("searchEmpMain.or")
	public String enrollReportForm(Model model) {
		System.out.println("직원검색 페이지 전환");
		
		ArrayList<Employee> list = officeRoomService.selectAllEmployee();
		model.addAttribute("list", list);
		return "searchEmployee/searchEmployeeMain";
	}
	
	@ResponseBody
	@RequestMapping(value="selectAllEmployee.or", produces = "application/json; charset=utf-8")
	public String selectAllEmployee() {
		ArrayList<Employee> list = officeRoomService.selectAllEmployee();
		
		return new GsonBuilder().create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="selectDeptEmployee.or", produces = "application/json; charset=utf-8")
	public String selectDeptEmployee(String deptCode) {
		System.out.println("부서코드: "+deptCode);
		ArrayList<Employee> list = officeRoomService.selectDeptEmployee(deptCode);
		
		return new GsonBuilder().create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="selectKorSortEmployee.or", produces = "application/json; charset=utf-8")
	public String selectKorSortEmployee(String catTitle) {
		System.out.println("한글 코드: "+catTitle);
		ArrayList<Employee> list = officeRoomService.selectKorSortEmployee(catTitle);
		
		return new GsonBuilder().create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="selectEngSortEmployee.or", produces = "application/json; charset=utf-8")
	public String selectEngSortEmployee(String catTitle) {
		System.out.println("영어 코드: "+catTitle);
		ArrayList<Employee> list = officeRoomService.selectEngSortEmployee(catTitle);
		
		return new GsonBuilder().create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="searchEmployeeDetail.or", produces = "application/json; charset=utf-8")
	public String searchEmployeeDetail(int empNo) {
		
		Employee emp = officeRoomService.searchEmployeeDetail(empNo);
		
		System.out.println("직원상세조회 Controller: "+ emp);
		
		return new GsonBuilder().create().toJson(emp); 
	}
	
	@RequestMapping("addOfficeAddressBook.or")
	public String addOfficeAddressBook() {
		System.out.println("주소록 추가");
		return "redirect:searchEmpMain.or";
	}
	
	@RequestMapping("searchEmployee.or")
	public String searchEmployee(HttpServletRequest request) {
		String optionType = request.getParameter("optionType");
		String search = request.getParameter("search");
		
		System.out.println("optionType: "+optionType);
		System.out.println("search: "+search);
		
		switch(optionType) {
		case "allType":
			break;
		case "deptType":
			break;
		case "empNameType":
			break;
		}
			request.setAttribute("optionType", optionType);
			request.setAttribute("search", search);
			return "searchEmployee/searchEmployeeMain";
		
	}
}
