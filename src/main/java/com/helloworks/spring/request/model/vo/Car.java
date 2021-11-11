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
	
	private int cSNo; //차량 번호시퀀스
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