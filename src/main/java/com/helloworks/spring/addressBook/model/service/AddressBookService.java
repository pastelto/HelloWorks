package com.helloworks.spring.addressBook.model.service;

import java.util.ArrayList;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.employee.model.vo.Employee;

public interface AddressBookService {
	
	ArrayList<OfficeAddressBook> selectOfficeAddressBook(int loginEmpNo);
	
	Employee searchEmployee(int addEmpNo);

	void addOfficeAddressBook(OfficeAddressBook officeAddressBook);


}
