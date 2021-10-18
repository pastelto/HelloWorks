package com.helloworks.spring.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.employee.model.dao.EmployeeDao;
import com.helloworks.spring.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public Employee loginMember(Employee m) throws Exception {

		Employee loginUser = employeeDao.loginMember(sqlSession , m);
		
		if(loginUser == null) {
			throw new Exception("loginUser확인");
		}
		return loginUser;
	}
	
}
