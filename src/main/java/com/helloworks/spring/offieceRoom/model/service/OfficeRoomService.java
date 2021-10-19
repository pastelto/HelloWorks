package com.helloworks.spring.offieceRoom.model.service;

import java.util.ArrayList;

import com.helloworks.spring.employee.model.vo.Employee;

public interface OfficeRoomService {

	ArrayList<Employee> selectAllEmployee();

	ArrayList<Employee> selectDeptEmployee(String dept);

}
