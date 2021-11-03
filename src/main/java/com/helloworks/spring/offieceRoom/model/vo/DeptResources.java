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
public class DeptResources {
	private int deptrNo;			//	DEPTR_NO	NUMBER
	private String deptCode;		//	DEPT_CODE	VARCHAR2(30 BYTE)
	private int deptrWriterNo;		//	DEPTR_WRITER_NO	NUMBER
	private String deptrCategory;	//	DEPTR_CATEGORY	VARCHAR2(6 BYTE)
	private String deptrTitle;		//	DEPTR_TITLE	VARCHAR2(500 BYTE)
	private String deptrContent;	//	DEPTR_CONTENT	VARCHAR2(4000 BYTE)
	private int deptrCount;			//	DEPTR_COUNT	NUMBER
	private String deptrAttach;		//	DEPTR_ATTACH	VARCHAR2(1 BYTE)
	private String deptrStatus;		//	DEPTR_STATUS	VARCHAR2(1 BYTE)
	
	//join
	private String writerName;			//	CR_WRITER_NO 이름
	private String writerJobName;		//	CR_WRITER_NO 이름
	private String writerDeptUName;		//	CR_WRITER_NO 이름
	private String writerDeptDName;		//	CR_WRITER_NO 이름
}
