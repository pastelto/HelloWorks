package com.helloworks.spring.addressBook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helloworks.spring.addressBook.model.service.AddressBookService;
import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Controller
public class AddressBookController {
	
	@Autowired
	private AddressBookService addressBookService;
	
	/* 주소록 */
	
	@RequestMapping("officeAddressBook.adb")
	public String officeAddressBook(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		System.out.println("공유 주소록 전환");
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		int listCount = addressBookService.selectListCount(loginEmpNo);
		
		System.out.println("공유 주소록 등록 인원: "+listCount);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		//ArrayList<OfficeAddressBook> officeAddresslist = addressBookService.selectOfficeAddressBook(loginEmpNo);
		ArrayList<OfficeAddressBook> officeAddresslist = addressBookService.selectOfficeAddressBook(loginEmpNo, pi);
		
		
		model.addAttribute("officeAddresslist", officeAddresslist);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "officeAddressBook.adb");
		return "addressBook/officeAddressBookMain";
	}
	
	
	@RequestMapping("addOfficeAddressBook.adb")
	public String addOfficeAddressBook(int addEmpNo, HttpServletRequest request, Model model) {
		
				
		Employee emp = addressBookService.searchEmployee(addEmpNo);
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		System.out.println("추가할 직원 사번: "+ addEmpNo);
		System.out.println("로그인 직원 사번: "+ loginEmpNo);
		
		OfficeAddressBook officeAddressBook = new OfficeAddressBook();
		if(emp != null) {
			officeAddressBook.setOabUserNo(loginEmpNo);
			officeAddressBook.setOabEnrollNO(addEmpNo);
			
			addressBookService.addOfficeAddressBook(officeAddressBook);
		}
		
		
		
		model.addAttribute("addEmpNo", addEmpNo);
		return "redirect:officeAddressBook.adb";
	}
	
	@RequestMapping("searchOfficeAddressBookEmployee.adb")
	public String searchOfficeAddressBookEmployee(String optionType, String deptTypeOption, String searchEmployee, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		
		
		SearchEmployee se = new SearchEmployee();
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		
		se.setLoginUserEmpNo(loginEmpNo);
		
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
		
		int listCount = addressBookService.selectSearchOfficeAddressBookEmployeeListCount(se);
		
		System.out.println("주소록 검색 결과 총 등록 인원: "+listCount);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Employee> officeAddresslist = addressBookService.searchOfficeAddressBookEmployee(se, pi);
		
		model.addAttribute("optionType", optionType);
		model.addAttribute("deptTypeOption", deptTypeOption);
		model.addAttribute("searchEmployee", searchEmployee);
		model.addAttribute("officeAddresslist", officeAddresslist);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "searchOfficeAddressBookEmployee.adb");
		return "addressBook/officeAddressBookMain";
	}
	
}
