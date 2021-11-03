package com.helloworks.spring.attendance.model.vo;

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
public class Statistics {
	
	int empNo; //사번
	String jobName; // 직급
	String name; //이름
	int working; //일한시간
	int over; //야근시간
	int totalT; // 총근무시간
	int leaveWT; // 잔여 일한시간
	int leaveOT; // 잔여 야근시간 
	
	String start; //시작일
	String end; //종료일 
	
	double half; //반차 갯수 받아오는 
	
	String workingS;//시간변환용	
	String overS;//시간변환용
	String totalTS;//시간변환용
	String leaveWTS;//시간변환용
	String leaveOTS;//시간변환용
}
