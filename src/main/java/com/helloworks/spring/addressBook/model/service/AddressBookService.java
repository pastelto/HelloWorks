package com.helloworks.spring.addressBook.model.service;

import java.util.ArrayList;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

public interface AddressBookService {
	
	
	Employee searchEmployee(int addEmpNo);
	
	ArrayList<OfficeAddressBook> selectOfficeAddressBook(int loginEmpNo, PageInfo pi);

	void addOfficeAddressBook(OfficeAddressBook officeAddressBook);

	int selectListCount(int loginEmpNo);
	
	int selectSearchOfficeAddressBookEmployeeListCount(SearchEmployee se);

	ArrayList<Employee> searchOfficeAddressBookEmployee(SearchEmployee se, PageInfo pi);

	


}
