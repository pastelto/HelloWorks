package com.helloworks.spring.manageSchedule.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
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

	
	

	
}
