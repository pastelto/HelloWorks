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
	private String mailFvr; // 메일 즐겨찾기 유무(Y/N)
	private String mailSStatus; // 발신메일 상태값(Y/N)
	private String mailRStatus; // 수신메일 상태값(Y/N)
	
//	MAIL_NO	NUMBER
//	MAIL_RCVR	NUMBER
//	MAIL_SNDR	NUMBER
//	MAIL_REF	NUMBER
//	MAIL_TITLE	VARCHAR2(1000 BYTE)
//	MAIL_CONTENT	VARCHAR2(4000 BYTE)
//	MAIL_DATE	DATE
//	MAIL_STATUS	VARCHAR2(1 BYTE)
//	MAIL_FVR	VARCHAR2(1 BYTE)
//	MAIL_S_STATUS	VARCHAR2(1 BYTE)
//	MAIL_R_STATUS	VARCHAR2(1 BYTE)
	
}
