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

	private int mMNo;
	private int empNo;
	private String mMName;
	private int mMCapacity;
	private String mMStatus;
	
}

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