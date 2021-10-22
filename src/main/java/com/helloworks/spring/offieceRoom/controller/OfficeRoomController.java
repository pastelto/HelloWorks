package com.helloworks.spring.offieceRoom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.service.OfficeRoomService;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Controller
public class OfficeRoomController {

	@Autowired
	private OfficeRoomService officeRoomService;
	
	/* 직원 검색 */
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
	
	@RequestMapping("searchEmployee.or")
	public String searchEmployee(String optionType, String deptTypeOption, String searchEmployee, Model model) {

		System.out.println("optionType: "+optionType);
		System.out.println("deptTypeOption: "+deptTypeOption);
		System.out.println("searchEmployee: "+searchEmployee);
		
		SearchEmployee se = new SearchEmployee();
		
		switch(optionType) {
		case "allType":
			se.setAllType(searchEmployee);
			break;
		case "deptType":
			se.setDeptType(searchEmployee);
			se.setDeptTypeOption(deptTypeOption);
			break;
		case "empNoType":
			se.setEmpNoType(searchEmployee);
			break;
		case "empNameType":
			se.setEmpNameType(searchEmployee);
			break;
		case "ePhoneType":
			se.setePhoneType(searchEmployee);
			break;
		case "emailType":
			se.setEmailType(searchEmployee);
			break;
		}
		
		ArrayList<Employee> list = officeRoomService.searchEmployee(se);
		
		model.addAttribute("optionType", optionType);
		model.addAttribute("deptTypeOption", deptTypeOption);
		model.addAttribute("searchEmployee", searchEmployee);
		model.addAttribute("list", list);
		return "searchEmployee/searchEmployeeMain";
		
	}
	

}
