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
	
	private String cMNo; //차량 관리번호
	private int empNo; //차량 담당자 사번
	private String empName; //차량 담당자 이름
	private String cMMfr; //차량 제조사명
	private String cMName;//차량명
	private String cMStatus;//차량 상태값 Y|N
	
	
}	

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