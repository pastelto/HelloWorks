package com.helloworks.spring.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	public Employee loginMember(SqlSessionTemplate sqlSession, Employee m) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", m);
}
	
}
