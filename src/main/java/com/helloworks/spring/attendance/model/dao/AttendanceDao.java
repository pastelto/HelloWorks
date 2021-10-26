package com.helloworks.spring.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.attendance.model.vo.SearchCondition;

@Repository
public class AttendanceDao {
	
	//출근등록
	public int updateInTime(SqlSessionTemplate sqlSession, Attendance attendance) {
		// TODO Auto-generated method stub
		return sqlSession.update("attendanceMapper.updateInTime", attendance);
	}
	
	//메인조회
	public Attendance selectAttendance(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attendanceMapper.selectAttendance", empNo);
	}

	//퇴근등록
	public int updateOutTime(SqlSessionTemplate sqlSession, Attendance attendance) {
		// TODO Auto-generated method stub
		return sqlSession.update("attendanceMapper.updateOutTime", attendance);
	}

	//소속부서출결 조회 - 근태구분
	public ArrayList<Attendance> searchAttendance(SqlSessionTemplate sqlSession, SearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.searchAttendance", searchCondition);
	}
	
	//소속부서출결 조회 - 휴가구분
	public ArrayList<Attendance> searchVacation(SqlSessionTemplate sqlSession, SearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.searchVacation", searchCondition);
	}
	
	//소속부서출결조회 - 전체
	public ArrayList<Attendance> checkDeptTimeAll(SqlSessionTemplate sqlSession, String dept) {
		// TODO Auto-generated method stub
		return  (ArrayList)sqlSession.selectList("attendanceMapper.checkDeptTimeAll", dept);
	}

	//소속부서출결 조회 - 근태구분 -> 인사팀
	public ArrayList<Attendance> searchAttendance1(SqlSessionTemplate sqlSession, SearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.searchAttendance1", searchCondition);
	}

	//소속부서출결 조회 - 휴가구분 -> 인사팀
	public ArrayList<Attendance> searchVacation1(SqlSessionTemplate sqlSession, SearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return  (ArrayList)sqlSession.selectList("attendanceMapper.searchVacation1", searchCondition);
	}

	//소속부서출결조회  - 전체 -> 인사팀
	public ArrayList<Attendance> checkDeptTimeAll1(SqlSessionTemplate sqlSession, String dept) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.checkDeptTimeAll1", dept);
	}

	//상태변경 한 행 조회
	public Attendance updateStatus(SqlSessionTemplate sqlSession, int psaNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attendanceMapper.updateStatus", psaNo);
	}

}
