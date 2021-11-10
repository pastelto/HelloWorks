package com.helloworks.spring.offieceRoom.model.vo;

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
public class DeptResourcesReply {
	private int deptrRepNo;				//	DEPTR_REP_NO	NUMBER
	private int deptrNo;				//	DEPTR_NO	NUMBER
	private String deptrRepCode;		//	DEPTR_REP_CODE	VARCHAR2(3 BYTE)
	private int deptrRepWriterNo;		//	DEPTR_REP_WRITER_NO	NUMBER
	private int deptrRepReceiverNo;		//	DEPTR_REP_RECEIVER_NO	NUMBER
	private String deptrRepContent;		//	DEPTR_REP_CONTENT	VARCHAR2(4000 BYTE)
	private Date deptrRepCreateDate;	//	DEPTR_REP_CREATE_DATE	DATE
	private String deptrRepStatus;		//	DEPTR_REP_STATUS	VARCHAR2(1 BYTE)
	
	// join
	private String writerName;
	private String writerJobName;
	private String writerDeptDName;
}

