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
public class CommonResourcesReply {
	private int crRepNo;				//	CR_REP_NO	NUMBER
	private int crNo;					//	CR_NO	NUMBER
	private String crRepCode;				//	CR_REP_CODE	VARCHAR2(3 BYTE)
	private int crRepWriterNo;			//	CR_REP_WRITER_NO	NUMBER
	private int crRepReceiverNo;		//	CR_REP_RECEIVER_NO	NUMBER
	private String crRepContent;			//	CR_REP_CONTENT	VARCHAR2(4000 BYTE)
	private Date crRepCreateDate;		//	CR_REP_CREATE_DATE	DATE
	private String crRepStatus;			//	CR_REP_STATUS	VARCHAR2(1 BYTE)
	
	// join
	private String writerName;
	private String writerJobName;
	private String writerDeptDName;
	
}
