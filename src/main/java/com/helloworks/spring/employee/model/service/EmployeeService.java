package com.helloworks.spring.employee.model.service;

import java.util.List;

import com.helloworks.spring.employee.model.vo.Dept;
import com.helloworks.spring.employee.model.vo.Employee;

public interface EmployeeService {

	Employee loginMember(Employee m) throws Exception;

	Employee updateEmp(Employee m);

	Employee selectEmp(int empNo);

	void insertEmp(Employee m);

	List<Dept> getDeptList();

	List<Dept> getDeptUList();

	Employee getLastEmpNo();

	
	

}
