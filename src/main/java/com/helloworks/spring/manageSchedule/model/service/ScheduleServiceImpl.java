package com.helloworks.spring.manageSchedule.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.employee.model.vo.Dept;
import com.helloworks.spring.manageSchedule.model.dao.ScheduleDao;
import com.helloworks.spring.manageSchedule.model.vo.ManageSchedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	// 개인 캘린더 타입 조회
	@Override
	public ManageSchedule selectPrivateCal(ManageSchedule calType) throws Exception {

		return scheduleDao.selectPrivateCal(sqlSession, calType);
	}
	
	// 부서별 캘린더 타입 조회
	@Override
	public ManageSchedule selectCalType(ManageSchedule calType) {

		return scheduleDao.selectCalType(sqlSession, calType);
	}
	
	// 일정 등록하기 - 페이지 
	@Override
	public void addEvent(ManageSchedule schedule) throws Exception {
 
		 int result = scheduleDao.addEvent(sqlSession, schedule);
		 System.out.println("일정 등록 ? " + result);
		 
		 if(result < 0) { 
			 throw new CommException("일정등록 실패"); 
		 }
	}
	
	// 내 일정 가져오기
	@Override
	public List<ManageSchedule> getMyCalender(HashMap<String, Object> getMyCalender) throws Exception {
		
		return scheduleDao.getMyCalender(sqlSession, getMyCalender);
	}
	
	// 본부/부서별 일정 가져오기
	@Override
	public List<ManageSchedule> getDeptSchedule(int cal_no) throws Exception {
		
		return scheduleDao.getDeptSchedule(sqlSession, cal_no);
	}
	
	// 일정 삭제
	@Override
	public int deleteCal(int schNo) throws Exception {
		
		return scheduleDao.deleteCal(sqlSession, schNo);
	}
	
	// 부서 목록 가져오기
	@Override
	public List<Dept> getDeptList() throws Exception {
		
		return scheduleDao.getDeptList(sqlSession);
	}

	
	

	
}
