package com.helloworks.spring.employee.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.employee.model.vo.Dept;
import com.helloworks.spring.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	public Employee loginMember(SqlSessionTemplate sqlSession, Employee m) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", m);
	}

	public int updateEmp(SqlSessionTemplate sqlSession, Employee m) {		
		return sqlSession.update("employeeMapper.updateEmp", m);
	}

	public Employee selectEmp(SqlSessionTemplate sqlSession, int empNo) {	
		return sqlSession.selectOne("employeeMapper.selectEmp", empNo);
	}

	public int insertEmp(SqlSessionTemplate sqlSession, Employee m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("employeeMapper.insertEmp", m);
	}

	public List<Dept> getDeptList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.getDeptList");

	}

	public List<Dept> getDeptUList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.getDeptUList");
	}



}
