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
public class OfficeAddressBook {
	private int oabNo;			//	OAB_NO	NUMBER
	private int oabUserNo;		//	OAB_USER_NO	NUMBER
	private int oabEnrollNo;	//	OAB_ENROLL_NO	NUMBER
	private String oabStatus;	//	OAB_STATUS	VARCHAR2(1 BYTE)

	private String empName;			//사원이름
	private String empEn;			//영문이름
	private String empEmail;		//이메일
	private String empEphone;		//내선번호
	private String deptCode;		//하위부서코드
	private String jobCode;			//직급코드
	private String jobName; 		//직급명
	private String deptUname;		//상위부서이름
	private String deptDname;		//하위부서이름 
}

