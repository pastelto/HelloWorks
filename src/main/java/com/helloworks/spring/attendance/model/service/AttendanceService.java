package com.helloworks.spring.attendance.model.service;

import java.util.ArrayList;

import com.helloworks.spring.attendance.model.vo.Attendance;

public interface AttendanceService {

	//출근시간 등록
	void updateInTime(Attendance attendance);

	//메인조회
	Attendance selectAttendance(int empNo);

	//퇴근시간 등록 
	void updateOutTime(Attendance attendance);

}
