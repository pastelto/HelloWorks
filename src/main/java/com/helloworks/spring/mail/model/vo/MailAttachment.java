package com.helloworks.spring.mail.model.vo;

import java.sql.Date;

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
public class MailAttachment {
	
	private int mailAtNo;
	private int mailNo;
	private String mailAtOrg;
	private String mailAtChg;
	private Date mailAtDate;
	
}

//MAIL_AT_NO	NUMBER
//MAIL_NO	NUMBER
//MAIL_AT_ORG	VARCHAR2(1000 BYTE)
//MAIL_AT_CHG	VARCHAR2(1000 BYTE)
//MAIL_AT_DATE	DATE

//메일 첨부파일 번호
//메일 번호
//메일 원본 첨부파일명
//메일 변경 첨부파일명
//메일 첨부파일 업로드 일자