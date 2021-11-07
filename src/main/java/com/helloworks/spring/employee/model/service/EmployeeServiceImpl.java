package com.helloworks.spring.employee.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.employee.model.dao.EmployeeDao;
import com.helloworks.spring.employee.model.vo.Dept;
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
		
		
		System.out.println("@@@@@@@@임플 m : " + m);
		System.out.println("@@@@@@@@임플 loginUser : " + loginUser);
		
		if(loginUser == null) {
			throw new Exception("loginUser확인");
		}
		return loginUser;
	}

	//회원수정
	@Override
	public Employee updateEmp(Employee m) {

		int result = employeeDao.updateEmp(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회원 수정에 실패하였습니다");
		}else {
			Employee loginUser = employeeDao.loginMember(sqlSession, m);
			  return loginUser;
		}
		
	}

	@Override
	public Employee selectEmp(int empNo) {
		
		return employeeDao.selectEmp(sqlSession, empNo);
	}

	@Override
	public void insertEmp(Employee m) {
		
		int result = employeeDao.insertEmp(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("사원등록에 실패하였습니다.");
		}
		
	}

	@Override
	public List<Dept> getDeptList() {
		// TODO Auto-generated method stub
		return employeeDao.getDeptList(sqlSession);

	}

	@Override
	public List<Dept> getDeptUList() {
		// TODO Auto-generated method stub
		return employeeDao.getDeptUList(sqlSession);
	}

	@Override
	public void imgEmp(Employee m) {
		int result = employeeDao.imgEmp(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("사진등록에 실패하였습니다.");
		}
		
	}


	
}
