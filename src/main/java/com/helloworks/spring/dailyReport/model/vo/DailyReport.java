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
	private int drNo;				//	DR_NO NUMBER
	private int drWriterNo;			//	DR_WRITER_NO	NUMBER
	private String drCategory;		//	DR_CATEGORY	VARCHAR2(1 BYTE)
	private int drReceiverNo;		//	DR_RECEIVER_NO	NUMBER
	private int drRef;				//	DR_REF NUMBER
	private String drTitle;			//	DR_TITLE	VARCHAR2(500 BYTE)
	private String drContent;		//	DR_CONTENT	VARCHAR2(4000 BYTE)
	private String drCreateDate;		//	DR_CREATE_DATE	DATE
	private String drAttachOrigin;	//	DR_ATTACH_ORIGIN	VARCHAR2(4000 BYTE)
	private String drAttachChange;	//	DR_ATTACH_CHANGE	VARCHAR2(4000 BYTE)
	private String drConfirm;		//	DR_CONFIRM	VARCHAR2(1 BYTE)
	private String drStatus;		//	DR_STATUS	VARCHAR2(2 BYTE)
	
	
	private String writerName;			// 	DR_RECEIVER_NO Join -> Employee 테이블 userName
	private String receiverName;		// 	DR_RECEIVER_NO Join -> Employee 테이블 userName
	
	private String drReceiverList;	
	private String drRefList;
}
