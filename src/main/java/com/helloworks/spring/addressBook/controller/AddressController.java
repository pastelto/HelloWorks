package com.helloworks.spring.addressBook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helloworks.spring.addressBook.model.service.AddressService;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.model.vo.PageInfo;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	/*
	@RequestMapping("officeAddressBook.or") 
	public String officeAddressBook(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = addressService.selectOfficeAddressBookCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		return"addressBook/officeAddressBookMain";
	}
	*/ 
}
