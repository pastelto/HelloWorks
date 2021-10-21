package com.helloworks.spring.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.attendance.model.vo.Attendance;

@Repository
public class AttendanceDao {
	
	//출근등록
	public int insertInTime(SqlSessionTemplate sqlSession, Attendance a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("attendanceMapper.insertInTime", a);
	}
	
	//메인조회
	public Attendance selectAttendance(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attendanceMapper.selectAttendance", empNo);
	}

}
