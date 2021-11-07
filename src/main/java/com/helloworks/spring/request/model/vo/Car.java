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
public class Car {
	
	private String cMNo; //차량번호
	private int empNo; //차량 담당자 사번
	private String empName; //차량 담당자 이름
	private int rEmpNo; //차량 예약자 사번
	private String cMMfr; //차량 제조사명
	private String cMName;//차량명
	private String cMStatus;//차량 상태값 Y|N
	
	private int cRNo; //차량 예약 번호
	private String cRDate; //차량 예약일
	private String cRTime; //차량 예약시간
	private String cRDest; //목적지
	private String cRUsg; //차량 사용목적
	private String cRPsng; //동승자
	private String cRStatus; //차량 예약 상태값
	
	
	
}	

//RS_CR_NO	NUMBER
//RS_CM_NO	VARCHAR2(1000 BYTE)
//RS_CR_EMP_NO	NUMBER
//RS_CR_DATE	DATE
//RS_CR_TIME	DATE
//RS_CR_DEST	VARCHAR2(1000 BYTE)
//RS_CR_USG	VARCHAR2(1000 BYTE)
//RS_CR_PSNGR	NUMBER
//RS_CR_UNIQ	VARCHAR2(4000 BYTE)
//RS_CR_STATUS	VARCHAR2(1 BYTE)
//
//배차 신청 번호
//차량 번호
//배차 신청인 사원번호
//배차 신청 날짜
//배차 사용 시간
//행선지
//배차 사용 목적
//배차 탑승자 사원번호
//배차 특이사항
//배차 신청 상태값

//RS_CM_NO	VARCHAR2(1000)
//RS_CM_EMP_NO	NUMBER
//RS_CM_MFR	VARCHAR2(1000 BYTE)
//RS_CM_NAME	VARCHAR2(1000 BYTE)
//RS_CM_STATUS	VARCHAR2(1 BYTE)
//
//차량 번호
//차량 관리 담당자 사번
//차랑 제조사
//차량명
//차량 상태값