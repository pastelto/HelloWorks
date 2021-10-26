package com.helloworks.spring.addressBook.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.addressBook.model.dao.AddressBookDao;
import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Service
public class AddressBookServiceImpl implements AddressBookService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressBookDao addresssBookDao;

	@Override
	public int selectListCount(int loginEmpNo) {
		// TODO Auto-generated method stub
		return addresssBookDao.selectListCount(sqlSession, loginEmpNo);
	}
	
	@Override
	public ArrayList<OfficeAddressBook> selectOfficeAddressBook(int loginEmpNo, PageInfo pi) {
		// TODO Auto-generated method stub
		return addresssBookDao.selectOfficeAddressBook(sqlSession, loginEmpNo, pi);
	}
	
	@Override
	public int searchEnrollCount(OfficeAddressBook officeAddressBook) {
		// TODO Auto-generated method stub
		
		int result = addresssBookDao.searchEnrollCount(sqlSession, officeAddressBook);

		return result;
	}
	
	@Override
	public Employee searchEmployee(int addEmpNo) {
		// TODO Auto-generated method stub
		return addresssBookDao.searchEmployee(sqlSession, addEmpNo);
	}
	
	@Override
	public void addOfficeAddressBook(OfficeAddressBook officeAddressBook) {
		// TODO Auto-generated method stub
		int result = addresssBookDao.addOfficeAddressBook(sqlSession, officeAddressBook);
		
		if(result < 0) {
			throw new CommException("사내 주소록 등록 실패");
		}
	}
	
	@Override
	public void deleteOfficeAddressBook(OfficeAddressBook officeAddressBook) {
		// TODO Auto-generated method stub
		int result = addresssBookDao.deleteOfficeAddressBook(sqlSession, officeAddressBook);
		
		if(result < 0) {
			throw new CommException("주소록 삭제 실패");
		}
	}
	
	@Override
	public int selectSearchOfficeAddressBookEmployeeListCount(SearchEmployee se) {
		// TODO Auto-generated method stub
		return addresssBookDao.selectSearchOfficeAddressBookEmployeeListCount(sqlSession, se);
	}

	@Override
	public ArrayList<Employee> searchOfficeAddressBookEmployee(SearchEmployee se, PageInfo pi) {
		// TODO Auto-generated method stub
		return addresssBookDao.searchOfficeAddressBookEmployee(sqlSession, se, pi);
	}


}
