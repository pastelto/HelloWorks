package com.helloworks.spring.offieceRoom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.employee.model.vo.Employee;

@Repository
public class OfficeRoomDao {

	public ArrayList<Employee> selectAllEmployee(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectAllEmployee");
	}

	public ArrayList<Employee> selectDeptEmployee(SqlSessionTemplate sqlSession, String dept) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectDeptEmployee", dept);
	}

}
