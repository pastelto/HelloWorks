package com.helloworks.spring.addressBook.model.service;

import java.util.ArrayList;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.addressBook.model.vo.PersonalAddressBook;
import com.helloworks.spring.addressBook.model.vo.SearchPerson;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

public interface AddressBookService {
	
	int selectListCount(int loginEmpNo);
	
	ArrayList<OfficeAddressBook> selectOfficeAddressBook(int loginEmpNo, PageInfo pi);
	
	int searchEnrollCount(OfficeAddressBook officeAddressBook);
	
	Employee searchEmployee(int addEmpNo);
	
	void addOfficeAddressBook(OfficeAddressBook officeAddressBook);
	
	void deleteOfficeAddressBook(OfficeAddressBook officeAddressBook);
	
	int selectSearchOfficeAddressBookEmployeeListCount(SearchEmployee se);

	ArrayList<Employee> searchOfficeAddressBookEmployee(SearchEmployee se, PageInfo pi);

	int popUpSearchOfficeAddressBookEmployeeListCount(SearchEmployee se);

	ArrayList<Employee> popUpSearchOfficeAddressBookEmployee(SearchEmployee se, PageInfo pi);

	int selectListPerCount(int loginEmpNo);

	ArrayList<PersonalAddressBook> selectPerAddressBook(int loginEmpNo, PageInfo piR);

	void insertPersonalAddress(PersonalAddressBook personalAddressBook);

	void deletePerosonAddressBook(PersonalAddressBook personalAddressBook);

	int selectSearchPersonalAddressBookListCount(SearchPerson sp);

	ArrayList<PersonalAddressBook> searchPersonalAddressBook(SearchPerson sp, PageInfo piR);

	
}
