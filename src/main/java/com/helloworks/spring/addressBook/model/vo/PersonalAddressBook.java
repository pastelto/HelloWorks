package com.helloworks.spring.addressBook.model.vo;

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
public class PersonalAddressBook {
	private int pabNo;			//	PAB_NO	NUMBER
	private int pabUserNo;		//	PAB_USER_NO	NUMBER
	private String pabName;		//	PAB_NAME	VARCHAR2(500 BYTE)
	private String pabEname;	//	PAB_ENAME	VARCHAR2(500 BYTE)
	private String pabJob;		//	PAB_JOB	VARCHAR2(100 BYTE)
	private String pabPhone;	//	PAB_PHONE	VARCHAR2(100 BYTE)
	private String pabEmail;	//	PAB_EMAIL	VARCHAR2(1000 BYTE)
	private String pabStatus;	//	PAB_STATUS	VARCHAR2(1 BYTE)
}

