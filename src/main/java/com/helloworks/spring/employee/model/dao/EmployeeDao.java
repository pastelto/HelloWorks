package com.helloworks.spring.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

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

	public int selectAllEmployeeListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.selectAllEmployeeListCount");
	}

	public ArrayList<Employee> selectAllEmployee(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAllEmployee", null, rowBounds);
	}


	public int selectHrTypeEmployeeListCount(SqlSessionTemplate sqlSession, String hrType) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.selectHrTypeEmployeeListCount", hrType);
	}

	public ArrayList<Employee> selectHrTypeEmployee(SqlSessionTemplate sqlSession, String hrType, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectHrTypeEmployee", hrType, rowBounds);
	}

	public int searchEmployeeListCount(SqlSessionTemplate sqlSession, SearchEmployee se) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.searchEmployeeListCount", se);
	}

	public ArrayList<Employee> searchEmployee(SqlSessionTemplate sqlSession, SearchEmployee se, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("employeeMapper.searchEmployee", se, rowBounds);
	}

	public Employee getLastEmpNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("employeeMapper.getLastEmpNo");
	}
}
