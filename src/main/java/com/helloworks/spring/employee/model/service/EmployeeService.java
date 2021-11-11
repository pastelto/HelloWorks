package com.helloworks.spring.employee.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

public interface EmployeeService {
 
	Employee loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Employee m) throws Exception;

	Employee updateEmp(Employee m);

	Employee selectEmp(int empNo);

	void insertEmp(Employee m);

	int selectAllEmployeeListCount();

	ArrayList<Employee> selectAllEmployee(PageInfo pi); 

	int selectHrTypeEmployeeListCount(String hrType); 


	ArrayList<Employee> selectHrTypeEmployee(String hrType, PageInfo pi); 

	int searchEmployeeListCount(SearchEmployee se);

	ArrayList<Employee> searchEmployee(SearchEmployee se, PageInfo pi); 
	
	Employee getLastEmpNo(); 

	void updateEmployee(Employee employee);  

}
