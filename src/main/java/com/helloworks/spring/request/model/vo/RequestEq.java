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
public class RequestEq {
	private int requestEqNo; //비품 신청 번호
	private int rownum; //rownum
	private int empNo; // 비품 신청인 사원번호
	private String empName; // 비품 신청인 이름
	private String deptDname; // 비품 신청인 부서
	private String jobName; // 비품 신청인 직급
	private Date requestDate; // 비품 신청 접수일
	private String place; //비품사용장소
	private String usage; //비품사용목적
	private Date sDate; //비품 사용 시작일
	private Date eDate; //비품 사용 종료일
	private String eqName; //비품 명
	private String addRequest; //기타요청사항
	private String erCondition; //비품 처리 상태 (제출, 승인완료, 승인취소)
	private String erStatus; //비품 신청 상태값(Y|N)
}
