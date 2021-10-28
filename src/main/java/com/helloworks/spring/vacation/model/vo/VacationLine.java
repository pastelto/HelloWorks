package com.helloworks.spring.vacation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class VacationLine extends Vacation{
	
	private int lineNo; 
	private int empNo;
	private String empName;
	private String jobName;
	
	private int confirmStatus; 
	
	
	
}
