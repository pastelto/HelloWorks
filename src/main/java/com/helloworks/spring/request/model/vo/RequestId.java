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
	private String eqCondition; //사원증 처리 상태 (제출, 승인완료, 승인취소)
	private String eqStatus; //사원증 신청 상태값(Y|N)
}

//ES_IR_NO	NUMBER
//ES_IR_EMP_NO	NUMBER
//ES_IR_DATE	DATE
//ES_IR_KIND	VARCHAR2(1000 BYTE)
//ES_IR_ORG_PIC	VARCHAR2(1000 BYTE)
//ES_IR_CHG_PIC	VARCHAR2(1000 BYTE)
//ES_IR_ORG_ATTACH	VARCHAR2(1000 BYTE)
//ES_IR_CHG_ATTACH	VARCHAR2(1000 BYTE)
//ES_IR_CONDITION	VARCHAR2(1000 BYTE)
//ES_IR_STATUS	VARCHAR2(1 BYTE)
//
//사원증 신청 번호
//사원증 신청인 사원번호
//사원증 신청 접수일
//사원증 신청 발급 종류
//사원증 신청 원본 사진파일명
//사원증 신청 변경 사진파일명
//사원증 신청 입금 원본 첨부파일명
//사원증 신청 입금 변경 첨부파일명
//사원증 신청 처리상태
//사원증 신청 상태값