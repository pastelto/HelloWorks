package com.helloworks.spring.dailyReport.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DailyReport {
	// DB table
	private int drNo;				//	DR_NO NUMBER
	private int drWriterNo;			//	DR_WRITER_NO	NUMBER
	private String drCategory;		//	DR_CATEGORY	VARCHAR2(1 BYTE)
	private int drReceiverNo;		//	DR_RECEIVER_NO	NUMBER
	private int drRef;				//	DR_REF NUMBER
	private String drTitle;			//	DR_TITLE	VARCHAR2(500 BYTE)
	private String drContent;		//	DR_CONTENT	VARCHAR2(4000 BYTE)
	private Date drCreateDate;		//	DR_CREATE_DATE	DATE
	private String drAttachOrigin;	//	DR_ATTACH_ORIGIN	VARCHAR2(4000 BYTE)
	private String drAttachChange;	//	DR_ATTACH_CHANGE	VARCHAR2(4000 BYTE)
	private String drConfirm;		//	DR_CONFIRM	VARCHAR2(1 BYTE)
	private String drStatus;		//	DR_STATUS	VARCHAR2(2 BYTE)
	
	// DB join
	private String writerName;		// 	DR_WRITER_NO Join -> Employee 테이블 userName
	private String receiverName;	// 	DR_RECEIVER_NO Join -> Employee 테이블 userName
	private String deptCode;		//하위부서코드
	private String jobCode;			//직급코드
	private String jobName; 		//직급명
	private String deptUname;		//상위부서이름
	private String deptDname;		//하위부서이름 
	
	// 활용 데이터
	private String drReceiverList;	//수신직원 전체
	private String drRefList;		//참조직원 전체
	private int termType;		//기간 값
	private String startDate;		//기간 설정 첫번째 값
	private String endDate; 		//기간 설정 두번째 값
	
	// 검색 값
	private String searchType; 
	private String search; 
}
