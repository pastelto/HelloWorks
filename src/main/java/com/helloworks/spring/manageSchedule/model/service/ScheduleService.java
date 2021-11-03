package com.helloworks.spring.manageSchedule.model.service;

import com.helloworks.spring.manageSchedule.model.vo.ManageSchedule;

public interface ScheduleService {

	ManageSchedule selectPrivateCal(ManageSchedule calType) throws Exception;

	ManageSchedule selectCalType(ManageSchedule calType);

	void addEvent(ManageSchedule schedule) throws Exception;



}
