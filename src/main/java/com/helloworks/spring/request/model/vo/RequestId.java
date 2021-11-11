package com.helloworks.spring.request.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class RequestId {
	private int requestIdNo; //사원증 신청 번호
	private int empNo; // 사원증 신청인 사원번호
	private String empKName; // 사원증 신청인 한글이름
	private String empEName; // 사원증 신청인 영문이름
	private String deptDname; // 사원증 신청인 부서
	private String jobName; // 사원증 신청인 직급
	private Date requestDate; // 사원증 신청 접수일
	private String iRkind; //사원증 발급종류(신규발급/재발급)
	private String orgPic; //사원증 사진원본이름
	private String chgPic; //사원증 사진변경이름
	private String irCondition; //사원증 처리 상태 (제출, 승인완료, 승인취소)
	private String irStatus; //사원증 신청 상태값(Y|N)
}