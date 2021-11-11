package com.helloworks.spring.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.dao.EmployeeDao;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

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

	// 인사관리 - 하연
	@Override
	public int selectAllEmployeeListCount() {
		// TODO Auto-generated method stub
		return employeeDao.selectAllEmployeeListCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectAllEmployee(PageInfo pi) {
		// TODO Auto-generated method stub
		return employeeDao.selectAllEmployee(sqlSession, pi);
	}
	
	// 가장 최신 등록된 직원 가져오기
	@Override
	public Employee getLastEmpNo() {
		
		return employeeDao.getLastEmpNo(sqlSession);
	}

	@Override
	public int selectHrTypeEmployeeListCount(String hrType) {
		// TODO Auto-generated method stub
		return employeeDao.selectHrTypeEmployeeListCount(sqlSession, hrType);
	}

	@Override
	public ArrayList<Employee> selectHrTypeEmployee(String hrType, PageInfo pi) {
		// TODO Auto-generated method stub
		return employeeDao.selectHrTypeEmployee(sqlSession, hrType, pi);
	}

	@Override
	public int searchEmployeeListCount(SearchEmployee se) {
		// TODO Auto-generated method stub
		return employeeDao.searchEmployeeListCount(sqlSession, se);
	}

	@Override
	public ArrayList<Employee> searchEmployee(SearchEmployee se, PageInfo pi) {
		// TODO Auto-generated method stub
		return employeeDao.searchEmployee(sqlSession, se, pi);
	}


	@Override
	public void updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		int result = employeeDao.updateEmployee(sqlSession, employee);
		
		if(result < 0) {
			throw new CommException("사원 정보 수정 실패");
		}
	}

	
}
