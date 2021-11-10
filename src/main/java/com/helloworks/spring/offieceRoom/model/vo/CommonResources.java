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
public class CommonResources {
	private int crNo;					//	CR_NO	NUMBER
	private String crCode;				//	CR_CODE	VARCHAR2(500 BYTE)
	private int crWriterNo;				//	CR_WRITER_NO	NUMBER
	private String crCategory;			//	CR_CATEGORY	VARCHAR2(6 BYTE)
	private String crTitle;				//	CR_TITLE	VARCHAR2(500 BYTE)
	private String crContent;			//	CR_CONTENT	VARCHAR2(4000 BYTE)
	private Date crCreateDate;			//	CR_CREATE_DATE	DATE
	private String crCount;				//	CR_COUNT	NUMBER
	private String crAttach;			//	CR_ATTACH	VARCHAR2(1 BYTE)
	private String crStatus;			//	CR_STATUS	VARCHAR2(1 BYTE)
	
	//join
	private String writerName;			//	CR_WRITER_NO 이름
	private String writerJobName;		//	CR_WRITER_NO 이름
	private String writerDeptUName;		//	CR_WRITER_NO 이름
	private String writerDeptDName;		//	CR_WRITER_NO 이름
	
	//search 부분
	private String optionType;
	private String Search;
}


