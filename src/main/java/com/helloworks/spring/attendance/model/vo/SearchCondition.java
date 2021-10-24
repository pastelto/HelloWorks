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
public class SearchCondition {
	
	String attendanceYM; // 날짜년도+달
	String attendance_type; // 근태구분(상태
	String vacation_type; // 휴가구분
	String optionType; // 검색타입
	String search; // 검색내용
	

}
