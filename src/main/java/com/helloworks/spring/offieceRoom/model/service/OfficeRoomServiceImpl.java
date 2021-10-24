package com.helloworks.spring.offieceRoom.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.dao.OfficeRoomDao;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Service
public class OfficeRoomServiceImpl implements OfficeRoomService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OfficeRoomDao officeRoomDao;
	
	
	@Override
	public ArrayList<Employee> selectAllEmployee() {
		// TODO Auto-generated method stub
		return officeRoomDao.selectAllEmployee(sqlSession);
	}


	@Override
	public ArrayList<Employee> selectDeptEmployee(String deptCode) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectDeptEmployee(sqlSession, deptCode);
	}


	@Override
	public ArrayList<Employee> selectKorSortEmployee(String catTitle) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectKorSortEmployee(sqlSession, catTitle);
	}


	@Override
	public ArrayList<Employee> selectEngSortEmployee(String catTitle) {
		// TODO Auto-generated method stub
		return officeRoomDao.selectEngSortEmployee(sqlSession, catTitle);
	}


	@Override
	public Employee searchEmployeeDetail(int empNo) {
		// TODO Auto-generated method stub
		return officeRoomDao.searchEmployeeDetail(sqlSession, empNo);
	}


	@Override
	public ArrayList<Employee> searchEmployee(SearchEmployee se) {
		// TODO Auto-generated method stub
		return officeRoomDao.searchEmployee(sqlSession, se);
	}

}
