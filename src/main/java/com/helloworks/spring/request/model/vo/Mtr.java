package com.helloworks.spring.request.model.vo;

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
public class Mtr {

	private int mRNo; //회의실 예약 번호
	private String mRDate; //회의실 예약 날짜
	private String mRTime; //회의실 예약 시간
	private String mRUsg; //회의실 사용 용도
	private String mRStatus; //회의실 예약 상태값
	private String deptDname; // 비품 신청인 부서
	private String jobName; // 비품 신청인 직급
	
	private int mMNo; //회의실 관리 번호
	private int empNo; //회의실 담당자 사번
	private int rEmpNo; //회의실 예약자 사번
	private String empName; //회의실 담당자 이름
	private String mMName; //회의실 명
	private int mMCapacity; //회의실 수용인원
	private String mMStatus; //회의실 상태값
	
}

//RS_MR_NO	NUMBER
//RS_MM_NO	NUMBER
//RS_MR_EMP_NO	NUMBER
//RS_MR_DATE	DATE
//RS_MR_TIME	DATE
//RS_MR_USG	VARCHAR2(1000 BYTE)
//RS_MR_STATUS	VARCHAR2(1 BYTE)
//회의실 신청 번호
//회의실 관리 번호
//회의실 신청인 사원번호
//회의실 신청 날짜
//회의실 사용 시간
//회의실 사용 용도
//회의실 신청 상태값

//RS_MM_NO
//RS_MM_EMP_NO
//RS_MM_NAME
//RS_MM_CAPACITY
//RS_MM_STATUS
//
//NUMBER
//NUMBER
//VARCHAR2(1000 BYTE)
//NUMBER
//VARCHAR2(1 BYTE)
//
//회의실 관리 번호
//회의실 관리담당자 사번
//회의실 명
//회의실 수용인원
//회의실 상태값



