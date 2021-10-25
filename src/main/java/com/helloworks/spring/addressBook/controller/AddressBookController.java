package com.helloworks.spring.addressBook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		
		ArrayList<OfficeAddressBook> officeAddresslist = addressBookService.selectOfficeAddressBook(loginEmpNo, pi);
		
		
		model.addAttribute("officeAddresslist", officeAddresslist);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "officeAddressBook.adb");
		return "addressBook/officeAddressBookMain";
	}
	
	
	@RequestMapping("addOfficeAddressBook.adb")
	public String addOfficeAddressBook(int addEmpNo, HttpServletRequest request, HttpSession session,  Model model) {
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		// 본인은 주소록 등록 불가
		if(loginEmpNo == addEmpNo) {
			session.setAttribute("msg", "본인은 등록할 수 없습니다.");
			return "redirect:searchEmpMain.or";
		}
		
		OfficeAddressBook officeAddressBook = new OfficeAddressBook();
		
		officeAddressBook.setOabUserNo(loginEmpNo);
		officeAddressBook.setOabEnrollNo(addEmpNo);
		
		// 이미 주소록 등록된 직원인지 확인
		int result = addressBookService.searchEnrollCount(officeAddressBook);
		
		if( result > 0) {
			session.setAttribute("msg", "이미 등록된 직원입니다.");
			return "redirect:searchEmpMain.or";
		}else {
			Employee emp = addressBookService.searchEmployee(addEmpNo);
			
			System.out.println("추가할 직원 사번: "+ addEmpNo);
			System.out.println("로그인 직원 사번: "+ loginEmpNo);
			if(emp != null) {
				
				addressBookService.addOfficeAddressBook(officeAddressBook);
				session.setAttribute("msg", "주소록에 등록되었습니다.");
			}
			//model.addAttribute("addEmpNo", addEmpNo);
			return "redirect:officeAddressBook.adb";
		}
		
	}
	
	@RequestMapping("deleteOfficeAddressBook.adb")
	public String deleteOfficeAddressBook(int deleteEmpNo, HttpServletRequest request, HttpSession session ,Model model) {
		System.out.println("직원 삭제 컨트롤러");
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		OfficeAddressBook officeAddressBook = new OfficeAddressBook();
		
		officeAddressBook.setOabUserNo(loginEmpNo);
		officeAddressBook.setOabEnrollNo(deleteEmpNo);
		
		addressBookService.deleteOfficeAddressBook(officeAddressBook);
		
		session.setAttribute("msg", "주소록에서 삭제되었습니다.");
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
