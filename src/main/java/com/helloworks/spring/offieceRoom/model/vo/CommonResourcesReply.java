package com.helloworks.spring.offieceRoom.model.vo;

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
	private int crRepNo;			//	CR_REP_NO	NUMBER
	private int crNo;					//	CR_NO	NUMBER
	private int crRepCode;				//	CR_REP_CODE	VARCHAR2(3 BYTE)
	private int crRepWriterNo;			//	CR_REP_WRITER_NO	NUMBER
	private int crRepReceiverNo;		//	CR_REP_RECEIVER_NO	NUMBER
	private int crRepContent;			//	CR_REP_CONTENT	VARCHAR2(4000 BYTE)
	private int crRepCreateDate;		//	CR_REP_CREATE_DATE	DATE
	private int crRepStatus;			//	CR_REP_STATUS	VARCHAR2(1 BYTE)
}
