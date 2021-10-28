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
public class ApprovalAttendance extends Vacation{
	
	private String documentType; // 연차, 반차, 조퇴, 결근
	private String halfDay; //오전,오후
	private String startDate; //시작일자
	private String endDate; //종료일자
	

	

}
