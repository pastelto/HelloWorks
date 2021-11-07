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
public class VacationCC extends Vacation{

	private String ccDept; 	// 수신부서
	private Integer ccMember;	// 수신자
	private int ckCount;	// 확인인원
	private int ccCount;	// 수신인원 
	private String  ccName;	
	

	
	
}
