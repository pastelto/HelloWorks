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
public class DeptResourcesAttachment {
	private int deptrAttachNo;			//	DEPTR_ATTACH_NO	NUMBER
	private int deptrNo;				//	DEPTR_NO	NUMBER
	private String deptrAttachOrigin;	//	DEPTR_ATTACH_ORIGIN	VARCHAR2(4000 BYTE)
	private String deptrAttachChange;	//	DEPTR_ATTACH_CHANGE	VARCHAR2(4000 BYTE)
	private String deptrAttachStatus;	//	DEPT_ATTACH_STATUS	VARCHAR2(1 BYTE)
}

