package com.helloworks.spring.mail.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MailInfo {
	private int mailNo; //메일번호
	private int empNo;//메일 수신인 사번
	private String empName; //메일 수신인 이름
	private String deptDname; //메일 수신인 부서
	private String jobName; //메일 수신인 직급
	
	
}
