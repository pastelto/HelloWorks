package com.helloworks.spring.addressBook.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.employee.model.vo.Employee;

@Repository
public class AddressBookDao {
	
	public ArrayList<OfficeAddressBook> selectOfficeAddressBook(SqlSessionTemplate sqlSession, int loginEmpNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectOfficeAddressBook", loginEmpNo);
	}

	public Employee searchEmployee(SqlSessionTemplate sqlSession, int addEmpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.searchEmployee", addEmpNo);
	}

	public int addOfficeAddressBook(SqlSessionTemplate sqlSession, OfficeAddressBook officeAddressBook) {
		// TODO Auto-generated method stub
		return sqlSession.insert("addressBookMapper.addOfficeAddressBook", officeAddressBook);
	}

}
