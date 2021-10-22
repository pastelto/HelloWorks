package com.helloworks.spring.offieceRoom.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

public interface OfficeRoomService {

	ArrayList<Employee> selectAllEmployee();

	ArrayList<Employee> selectDeptEmployee(String deptCode);

	ArrayList<Employee> selectKorSortEmployee(String catTitle);

	ArrayList<Employee> selectEngSortEmployee(String catTitle);

	Employee searchEmployeeDetail(int empNo);

	ArrayList<Employee> searchEmployee(SearchEmployee se);

}
