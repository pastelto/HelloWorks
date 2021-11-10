package com.helloworks.spring.addressBook.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.addressBook.model.vo.PersonalAddressBook;
import com.helloworks.spring.addressBook.model.vo.SearchPerson;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Repository
public class AddressBookDao {
	
	
	public int selectListCount(SqlSessionTemplate sqlSession, int loginEmpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.selectListCount", loginEmpNo);
	}
	
	public ArrayList<OfficeAddressBook> selectOfficeAddressBook(SqlSessionTemplate sqlSession, int loginEmpNo,
			PageInfo pi) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectOfficeAddressBook", loginEmpNo, rowBounds);
	}
	
	public int searchEnrollCount(SqlSessionTemplate sqlSession, OfficeAddressBook officeAddressBook) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.searchEnrollCount", officeAddressBook);
	}
	
	public Employee searchEmployee(SqlSessionTemplate sqlSession, int addEmpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.searchEmployee", addEmpNo);
	}
	
	public int addOfficeAddressBook(SqlSessionTemplate sqlSession, OfficeAddressBook officeAddressBook) {
		// TODO Auto-generated method stub
		return sqlSession.insert("addressBookMapper.addOfficeAddressBook", officeAddressBook);
	}
	
	public int deleteOfficeAddressBook(SqlSessionTemplate sqlSession, OfficeAddressBook officeAddressBook) {
		// TODO Auto-generated method stub
		return sqlSession.update("addressBookMapper.deleteOfficeAddressBook", officeAddressBook);
	}

	public int selectSearchOfficeAddressBookEmployeeListCount(SqlSessionTemplate sqlSession, SearchEmployee se) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.selectSearchOfficeAddressBookEmployeeListCount", se);
	}

	public ArrayList<Employee> searchOfficeAddressBookEmployee(SqlSessionTemplate sqlSession, SearchEmployee se,
			PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("addressBookMapper.searchOfficeAddressBookEmployee", se, rowBounds);
	}

	public int popUpSearchOfficeAddressBookEmployeeListCount(SqlSessionTemplate sqlSession, SearchEmployee se) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.popUpSearchOfficeAddressBookEmployeeListCount", se);
	}

	public ArrayList<Employee> popUpSearchOfficeAddressBookEmployee(SqlSessionTemplate sqlSession, SearchEmployee se,
			PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("addressBookMapper.popUpSearchOfficeAddressBookEmployee", se, rowBounds);
	}

	public int selectListPerCount(SqlSessionTemplate sqlSession, int loginEmpNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.selectListPerCount", loginEmpNo);
	}

	public ArrayList<PersonalAddressBook> selectPerAddressBook(SqlSessionTemplate sqlSession, int loginEmpNo,
			PageInfo piR) {
		// TODO Auto-generated method stub
		int offset = (piR.getCurrentPage()-1)*piR.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, piR.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectPerAddressBook", loginEmpNo, rowBounds);
	}

	public int insertPersonalAddress(SqlSessionTemplate sqlSession, PersonalAddressBook personalAddressBook) {
		// TODO Auto-generated method stub
		return sqlSession.insert("addressBookMapper.insertPersonalAddress", personalAddressBook);
	}

	public int deletePerosonAddressBook(SqlSessionTemplate sqlSession, PersonalAddressBook personalAddressBook) {
		// TODO Auto-generated method stub
		return sqlSession.update("addressBookMapper.deletePerosonAddressBook", personalAddressBook);
	}

	public int selectSearchPersonalAddressBookListCount(SqlSessionTemplate sqlSession, SearchPerson sp) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.selectSearchPersonalAddressBookListCount", sp);
	}

	public ArrayList<PersonalAddressBook> searchPersonalAddressBook(SqlSessionTemplate sqlSession, SearchPerson sp,
			PageInfo piR) {
		// TODO Auto-generated method stub
		int offset = (piR.getCurrentPage()-1)*piR.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, piR.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("addressBookMapper.searchPersonalAddressBook", sp, rowBounds);
	}


}
