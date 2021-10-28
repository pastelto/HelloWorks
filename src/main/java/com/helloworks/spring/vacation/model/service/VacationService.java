package com.helloworks.spring.vacation.model.service;

import com.helloworks.spring.vacation.model.vo.ApprovalAttendance;
import com.helloworks.spring.vacation.model.vo.Vacation;
import com.helloworks.spring.vacation.model.vo.VacationCC;
import com.helloworks.spring.vacation.model.vo.VacationLine;

public interface VacationService {

	//결재라인 insert
	void insertLine(VacationLine line);

	//수신참조
	void insertCcEmpl(VacationCC vaCC);
	void insertCcDept(VacationCC vaCC);

	//첨부파일
	void insertAttachment(Vacation vacation);

	//근태구분 결재
	void insertVacation(Vacation vacation);
	void insertAttendance(ApprovalAttendance apA);

}
