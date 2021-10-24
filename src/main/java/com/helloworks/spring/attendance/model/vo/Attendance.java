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
public class Attendance {
	
	private int psaNo;//기록번호	
	private Date psCreateDate; // 출퇴근날짜
	private String inTime; //출근시간
	private String outTime; //퇴근시간	
	private String psStatus; //출퇴근상태
	private int empNo; //사번
	private int workingTime; //일한시간
	private int overTime; //야근시간
	private int total; //총 근로시간
	private String jobName;	//직급	
	private String deptName; //부서
	private String deptUname; //상위부서
	private int appliedIN; //적용 출근시간
	private int appliedOut; //적용 퇴근시간
	private String name;//이름 

	
	
}
