package com.helloworks.spring.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.attendance.model.vo.SearchAttendance;
import com.helloworks.spring.attendance.model.vo.Statistics;
import com.helloworks.spring.common.model.vo.SearchCondition;

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
	public ArrayList<Attendance> searchAttendance(SqlSessionTemplate sqlSession, SearchAttendance searchCondition) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.searchAttendance", searchCondition);
	}
	
	//소속부서출결 조회 - 휴가구분
	public ArrayList<Attendance> searchVacation(SqlSessionTemplate sqlSession, SearchAttendance searchCondition) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.searchVacation", searchCondition);
	}
	
	//소속부서출결조회 - 전체
	public ArrayList<Attendance> checkDeptTimeAll(SqlSessionTemplate sqlSession, String dept) {
		// TODO Auto-generated method stub
		return  (ArrayList)sqlSession.selectList("attendanceMapper.checkDeptTimeAll", dept);
	}

	//소속부서출결 조회 - 근태구분 -> 인사팀
	public ArrayList<Attendance> searchAttendance1(SqlSessionTemplate sqlSession, SearchAttendance searchCondition) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.searchAttendance1", searchCondition);
	}

	//소속부서출결 조회 - 휴가구분 -> 인사팀
	public ArrayList<Attendance> searchVacation1(SqlSessionTemplate sqlSession, SearchAttendance searchCondition) {
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
	
	//상태변경 
	public int changeStatus(SqlSessionTemplate sqlSession, Attendance change) {
		// TODO Auto-generated method stub
		return sqlSession.update("attendanceMapper.changeStatus", change);
	}

	//통계에서 달 선택 후 week 리스트 조회
	public ArrayList<SearchAttendance> monthselect(SqlSessionTemplate sqlSession, String monthselect) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.monthselect", monthselect);
	}
	
	//통계 전체조회
	public ArrayList<Statistics> wtStatisticsAll(SqlSessionTemplate sqlSession, SearchAttendance as) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.wtStatisticsAll", as);
	}
	
	//sysdateWeek
	public SearchAttendance sysdateWeek(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attendanceMapper.sysdateWeek");
	}

	//통계 검색조회
	public ArrayList<Statistics> statisticsSearch(SqlSessionTemplate sqlSession, SearchAttendance search) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.statisticsSearch", search);
	}
	
	//조정문서 날짜 선택 후 상태값 가져오기
	public Attendance selectStatus(SqlSessionTemplate sqlSession, SearchAttendance searchStatus) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attendanceMapper.selectStatus", searchStatus);
	}

	//결재문서에 따른 출퇴근 시간 변경
	public int changeTime(SqlSessionTemplate sqlSession, Attendance attendance) {
		
		return sqlSession.update("attendanceMapper.changeTime", attendance);
	}
	
	//근태 상태별로 조회
	public Statistics selectAtndCount(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attendanceMapper.selectAtndCount", empNo);
	}
	
	//출근기록-연차 사용일수
	public Statistics selectThreeCount(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attendanceMapper.selectThreeCount", empNo);
	}
	
	//API
	public ArrayList<Attendance> selectAPI(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAPI", empNo);
	}



}
