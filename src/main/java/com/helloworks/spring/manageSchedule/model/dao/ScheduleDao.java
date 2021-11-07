package com.helloworks.spring.manageSchedule.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.employee.model.vo.Dept;
import com.helloworks.spring.manageSchedule.model.vo.ManageSchedule;

@Repository
public class ScheduleDao {

	public ManageSchedule selectPrivateCal(SqlSessionTemplate sqlSession, ManageSchedule calType) {
		
		return sqlSession.selectOne("manageScheduleMapper.selectPrivateCal", calType);
	}
	
	public ManageSchedule selectCalType(SqlSessionTemplate sqlSession, ManageSchedule calType) {
		
		return sqlSession.selectOne("manageScheduleMapper.selectCalType", calType);
	}
	
	public int addEvent(SqlSessionTemplate sqlSession, ManageSchedule schedule) {
		
		return sqlSession.insert("manageScheduleMapper.addEvent", schedule);
	}

	public List<ManageSchedule> getMyCalender(SqlSessionTemplate sqlSession, HashMap<String, Object> getMyCalender) {
	
		return (ArrayList)sqlSession.selectList("manageScheduleMapper.getMyCalender", getMyCalender);
	}

	public List<ManageSchedule> getDeptSchedule(SqlSessionTemplate sqlSession, int cal_no) {
		
		return (ArrayList)sqlSession.selectList("manageScheduleMapper.getDeptSchedule", cal_no);
	}

	public int deleteCal(SqlSessionTemplate sqlSession, int schNo) {
		
		return sqlSession.delete("manageScheduleMapper.deleteCal", schNo);
	}

	public List<Dept> getDeptList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("manageScheduleMapper.getDeptList");
	}
	
	public ManageSchedule getUpdateCal(SqlSessionTemplate sqlSession, int schNo) {
		
		return sqlSession.selectOne("manageScheduleMapper.getUpdateCal", schNo);
	}

	public int updateEvent(SqlSessionTemplate sqlSession, ManageSchedule schedule) {
		
		return sqlSession.update("manageScheduleMapper.updateEvent", schedule);
	}



}
