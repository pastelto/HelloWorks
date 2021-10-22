package com.helloworks.spring.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.attendance.model.dao.AttendanceDao;
import com.helloworks.spring.attendance.model.vo.Attendance;
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
}
