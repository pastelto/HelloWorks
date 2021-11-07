package com.helloworks.spring.employee.model.service;

import com.helloworks.spring.employee.model.vo.Employee;

public interface EmployeeService {

	Employee loginMember(Employee m) throws Exception;

	Employee updateEmp(Employee m);

	Employee selectEmp(int empNo);

	void insertEmp(Employee m);

	
	

}
