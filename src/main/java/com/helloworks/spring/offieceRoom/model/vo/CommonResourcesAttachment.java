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
public class CommonResourcesAttachment {
	private int crAttachNo;				//	CR_ATTACH_NO	NUMBER
	private int crNo;					//	CR_NO	NUMBER
	private String crAttachOrigin;		//	CR_ATTACH_ORIGIN	VARCHAR2(4000 BYTE)
	private String crAttachChange;		//	CR_ATTACH_CHANGE	VARCHAR2(4000 BYTE)
	private String crAttachStatus;		//	CR_ATTACH_STATUS	VARCHAR2(1 BYTE)
}

