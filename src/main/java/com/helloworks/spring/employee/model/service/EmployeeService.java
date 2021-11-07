package com.helloworks.spring.employee.model.service;

import java.util.ArrayList;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

public interface EmployeeService {

	Employee loginMember(Employee m) throws Exception;

	Employee updateEmp(Employee m);

	Employee selectEmp(int empNo);

	void insertEmp(Employee m);

	int selectAllEmployeeListCount(); //인사관리

	ArrayList<Employee> selectAllEmployee(PageInfo pi); //인사관리

	int selectHrTypeEmployeeListCount(String hrType); //인사관리


	ArrayList<Employee> selectHrTypeEmployee(String hrType, PageInfo pi); //인사관리

	int searchEmployeeListCount(SearchEmployee se); //인사관리

	ArrayList<Employee> searchEmployee(SearchEmployee se, PageInfo pi); //인사관리;
}
