package com.helloworks.spring.employee.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Employee {
	private int empNo;				//사원번호
	private String empPwd;			//비밀번호
	private String empName;			//사원이름
	private String empEn;			//영문이름
	private String empPid;			//주민번호
	private String empEmail;		//이메일
	private String empPhone;		//핸드폰번호
	private String empEphone;		//내선번호
	private String empAddress;		//주소
	private String deptCode;		//하위부서코드
	private String jobCode;			//직급코드
	private int empSalary;			//연봉
	private Date empHire;			//입사일
	private Date empFire;			//퇴사일
	private String empOrgPic;		//사진 등록 첨부파일명
	private String empChgPic;		//사진 변경 첨부파일명
	private String empOrgSign;		//사인 등록 첨부파일명
	private String empChgSign;		//사인 변경 첨부파일명
	private String empNote;			//비고
	private String empStatus;		//재직여부
	private String jobName; 		//직급명
	private String deptUname;		//상위부서이름
	private String deptDname;		//하위부서이름
	
}
