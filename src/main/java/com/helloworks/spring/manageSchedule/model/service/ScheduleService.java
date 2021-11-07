package com.helloworks.spring.manageSchedule.model.service;

import java.util.HashMap;
import java.util.List;

import com.helloworks.spring.employee.model.vo.Dept;
import com.helloworks.spring.manageSchedule.model.vo.ManageSchedule;

public interface ScheduleService {

	ManageSchedule selectPrivateCal(ManageSchedule calType) throws Exception;

	ManageSchedule selectCalType(ManageSchedule calType) throws Exception;

	void addEvent(ManageSchedule schedule) throws Exception;

	List<ManageSchedule> getMyCalender(HashMap<String, Object> getMyCalender) throws Exception;

	List<ManageSchedule> getDeptSchedule(int cal_no) throws Exception;

	int deleteCal(int schNo) throws Exception;

	List<Dept> getDeptList() throws Exception;

	ManageSchedule getUpdateCal(int schNo) throws Exception;

	void updateEvent(ManageSchedule schedule) throws Exception;



}
