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
public class DailyReportReply {
	
	// DB table
	private int drRefNo;				//	DR_REF_NO	NUMBER
	private int drRepRefNo;				//	DR_REP_REF_NO	NUMBER
	private String drRepCode;			//	DR_REP_CODE	VARCHAR2(3 BYTE)
	private String drRepReRefNo;		//	DR_REP_RE_REF_NO	NUMBER
	private int drRepWriterNo;			//	DR_REP_WRITER_NO	NUMBER
	private int drRepReceiverNo;		//	DR_REP_RECEIVER_NO	NUMBER
	private String drRepContent;		//	DR_REP_CONTENT	VARCHAR2(4000 BYTE)
	private Date drRepCreateDate;		//	DR_REP_CREATE_DATE	DATE
	private String drRepStatus;			//	DR_REP_STATUS	VARCHAR2(1 BYTE)
	
	
	// join
	private String drRepWriterName;
	private String drRepWriterJobName;
	private String drRepWriterDeptDName;
	
}
