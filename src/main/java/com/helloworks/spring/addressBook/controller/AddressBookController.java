package com.helloworks.spring.addressBook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.addressBook.model.service.AddressBookService;
import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.employee.model.vo.Employee;

@Controller
public class AddressBookController {
	
	@Autowired
	private AddressBookService addressBookService;
	
	/* 주소록 */
	
	@RequestMapping("officeAddressBook.or")
	public String officeAddressBook(HttpServletRequest request, Model model) {
		System.out.println("공유 주소록 전환");
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		ArrayList<OfficeAddressBook> officeAddresslist = addressBookService.selectOfficeAddressBook(loginEmpNo);
		model.addAttribute("officeAddresslist", officeAddresslist);
		return "addressBook/officeAddressBookMain";
	}
	
	
	@RequestMapping("addOfficeAddressBook.or")
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
		return "addressBook/officeAddressBookMain";
	}
}
