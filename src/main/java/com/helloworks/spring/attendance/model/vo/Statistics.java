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
	String name; //이름
	int working; //일한시간
	int over; //야근시간
	int totalT; // 총근무시간
	int leaveWT; // 잔여 일한시간
	int leaveOT; // 잔여 야근시간 
}
