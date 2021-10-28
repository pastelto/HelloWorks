package com.helloworks.spring.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.attendance.model.dao.AttendanceDao;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.attendance.model.vo.SearchAttendance;
import com.helloworks.spring.attendance.model.vo.Statistics;
import com.helloworks.spring.common.exception.CommException;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttendanceDao attendanceDao;

	//출근시간 등록 
	@Override
	public void updateInTime(Attendance attendance) {
		int result = attendanceDao.updateInTime(sqlSession, attendance);
		
		if(result < 0) {
			throw new CommException("출근 등록 실패");
		}
	}

	//메인조회
	@Override
	public Attendance selectAttendance(int empNo) {
		
		return attendanceDao.selectAttendance(sqlSession, empNo);
	}

	//퇴근시간 등록
	@Override
	public void updateOutTime(Attendance attendance) {
		int result = attendanceDao.updateOutTime(sqlSession, attendance);
		
		if(result < 0) {
			throw new CommException("퇴근 등록 실패");
		}
		
	}

	//소속부서출결 조회 - 근태구분
	@Override
	public ArrayList<Attendance> searchAttendance(SearchAttendance searchCondition) {
		// TODO Auto-generated method stub
		return attendanceDao.searchAttendance(sqlSession, searchCondition);
	}

	//소속부서출결 조회 - 휴가구분
	@Override
	public ArrayList<Attendance> searchVacation(SearchAttendance searchCondition) {
		// TODO Auto-generated method stub
		return attendanceDao.searchVacation(sqlSession, searchCondition);
	}
	
	//소속부서출결 조회 - 전체
	@Override
	public ArrayList<Attendance> checkDeptTimeAll(String dept) {
		// TODO Auto-generated method stub
		return attendanceDao.checkDeptTimeAll(sqlSession, dept);
	}

	//소속부서출결 조회 - 근태구분 ->인사팀
	@Override
	public ArrayList<Attendance> searchAttendance1(SearchAttendance searchCondition) {
		// TODO Auto-generated method stub
		return attendanceDao.searchAttendance1(sqlSession, searchCondition);
	}
	
	//소속부서출결 조회 - 휴가구분 ->인사팀
	@Override
	public ArrayList<Attendance> searchVacation1(SearchAttendance searchCondition) {
		// TODO Auto-generated method stub
		return attendanceDao.searchVacation1(sqlSession, searchCondition);
	}

	//소속부서출결 조회 - 전체 -> 인사팀
	@Override
	public ArrayList<Attendance> checkDeptTimeAll1(String dept) {
		// TODO Auto-generated method stub
		return  attendanceDao.checkDeptTimeAll1(sqlSession, dept);
	}
	
	//상태변경 한 행 조회
	@Override
	public Attendance updateStatus(int psaNo) {
		
		Attendance update = null;
		update = attendanceDao.updateStatus(sqlSession, psaNo);
		return update;
	}
	
	//상태변경
	@Override
	public void changeStatus(Attendance change) {
		int result = attendanceDao.changeStatus(sqlSession, change);
		
		if(result < 0) {
			throw new CommException("상태 변경 실패");
		}
		
	}

	//통계에서 달 선택 후 week 리스트 조회
	@Override
	public ArrayList<SearchAttendance> monthselect(String monthselect) {
		// TODO Auto-generated method stub
		return attendanceDao.monthselect(sqlSession, monthselect);
	}
	
	//통계 전체조회
	@Override
	public ArrayList<Statistics> wtStatisticsAll(String dept) {
		// TODO Auto-generated method stub
		return attendanceDao.wtStatisticsAll(sqlSession, dept);
	}
	
	//통계 검색조회
	@Override
	public ArrayList<Statistics> statisticsSearch(SearchAttendance search) {
		// TODO Auto-generated method stub
		return attendanceDao.statisticsSearch(sqlSession, search);
	}

	//조정문서 날짜 선택 후 상태 값
	@Override
	public Attendance selectStatus(String cancle) {
		// TODO Auto-generated method stub
		return attendanceDao.selectStatus(sqlSession, cancle);
	}
}
