package com.helloworks.spring.attendance.model.service;

import java.util.ArrayList;

import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.attendance.model.vo.SearchAttendance;
import com.helloworks.spring.attendance.model.vo.Statistics;
import com.helloworks.spring.common.model.vo.SearchCondition;
import com.helloworks.spring.vacation.model.vo.LoginUserVacation;

public interface AttendanceService {

	//출근시간 등록
	void updateInTime(Attendance attendance);

	//메인조회
	Attendance selectAttendance(int empNo);

	//퇴근시간 등록 
	void updateOutTime(Attendance attendance);

	//소속부서출결 조회 - 근태구분
	ArrayList<Attendance> searchAttendance(SearchAttendance searchCondition);

	//소속부서출결 조회 - 휴가구분
	ArrayList<Attendance> searchVacation(SearchAttendance searchCondition);
	
	//소속부서출결조회 - 전체
	ArrayList<Attendance> checkDeptTimeAll(String dept);
	
	//소속부서출결 조회 - 근태구분 ->인사팀
	ArrayList<Attendance> searchAttendance1(SearchAttendance searchCondition);

	//소속부서출결 조회 - 휴가구분 -> 인사팀
	ArrayList<Attendance> searchVacation1(SearchAttendance searchCondition);

	//소속부서출결조회 - 전체 -> 인사팀
	ArrayList<Attendance> checkDeptTimeAll1(String dept);
	
	//상태변경할 값 조회
	Attendance updateStatus(int psaNo);
	
	//상태변경 
	void changeStatus(Attendance change);

	//통계에서 달 선택 후 week 리스트 조회
	ArrayList<SearchAttendance> monthselect(String monthselect);
	
	//통계 전체조회
	ArrayList<Statistics> wtStatisticsAll(String dept);

	//통계 검색조회
	ArrayList<Statistics> statisticsSearch(SearchAttendance search);
	
	//조정문서 날짜 선택 후 상태 값
	Attendance selectStatus(SearchAttendance searchStatus);
	
	//결재문서에 따른 출퇴근 시간 변경 
	void changeTime(Attendance attendance);
	
	//근태 상태별로 조회
	Statistics selectAtndCount(int empNo);
	
	//연차 사용일수 
	Statistics selectThreeCount(int empNo);
	


}
