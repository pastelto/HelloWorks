package com.helloworks.spring.attendance.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class SearchAttendance {
	
	String attendanceYM; // 날짜년도+달
	String attendance_type; // 근태구분(상태
	String vacation_type; // 휴가구분
	String optionType; // 검색타입
	String search; // 검색내용
	String dept; //로그인유저 부서
	
	
	
	//통계
	String monthselect; // 선택달 
	
	String year1;
	String month1;
	String week_seq;
	String start_date;
	String end_date;

}
