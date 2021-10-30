package com.helloworks.spring.mail.model.vo;

//import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Mail {
	
	private int mailNo; //메일 번호
	private String mailRcvr; // 메일 수신자 사원번호
	private int mailSndr; // 메일 발신자 사원번호
	private String mailRef; //메일 참조자 사원번호
	private String mailTitle; // 메일 제목
	private String mailContent; // 메일 내용
	private Timestamp mailDate; // 메일 날짜
	private String mailStatus; // 메일 열람유무(Y/N)
	private String mailSStatus; // 발신메일 상태값(Y/N)
	private String mailRStatus; // 수신메일 읽은사람

	//MailInfo
	private int mailRcvrNo; // 수신자 사번
	private String mailRcvrName; // 수신자 이름
	private String mailRcvrDept; // 수신자 부서
	private String mailRcvrJobName; // 수신자 직급

	private String mailSndrName; // 발신자 이름
	private String mailSndrDept; // 발신자 부서
	private String mailSndrJobName; // 발신자 직급

	
//	MAIL_NO	NUMBER
//	MAIL_RCVR	NUMBER
//	MAIL_SNDR	NUMBER
//	MAIL_REF	NUMBER
//	MAIL_TITLE	VARCHAR2(1000 BYTE)
//	MAIL_CONTENT	VARCHAR2(4000 BYTE)
//	MAIL_DATE	DATE
//	MAIL_STATUS	VARCHAR2(1 BYTE)
//	MAIL_S_STATUS	VARCHAR2(1 BYTE)
//	MAIL_R_STATUS	VARCHAR2(1 BYTE)
	
}
