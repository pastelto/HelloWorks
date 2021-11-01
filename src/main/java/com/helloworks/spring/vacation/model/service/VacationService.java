package com.helloworks.spring.vacation.model.service;

import java.util.ArrayList;

import com.helloworks.spring.vacation.model.vo.ApprovalAttendance;
import com.helloworks.spring.vacation.model.vo.LoginUserVacation;
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

	//사용자 연차 조회
	LoginUserVacation selectAnnual(int empNo);
	
	//결재문서 진행중 조회
	ArrayList<Vacation> selectApproval();

	//결재문서 승인
	void progressChange(String documentNo);
	
	//결재문서 승인 -해당문서 조회
	Vacation onlyOneSelect(String documentNo);

	//연차테이블 변경
	void updateAnnual(LoginUserVacation annual);
	
	//사용휴가 일수추가
	void addVacation(LoginUserVacation vacation);
	
	//출근등록시 결재서류가있다면
	Vacation sysdateVacation(int empNo);

	

}
