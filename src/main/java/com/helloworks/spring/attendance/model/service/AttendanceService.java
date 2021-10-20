package com.helloworks.spring.attendance.model.service;

import java.util.ArrayList;

import com.helloworks.spring.attendance.model.vo.Attendance;

public interface AttendanceService {

	//출근시간 등록
	void insertInTime(Attendance a);

	//메인조회
	ArrayList<Attendance> selectAttendance(int empNo);

}
