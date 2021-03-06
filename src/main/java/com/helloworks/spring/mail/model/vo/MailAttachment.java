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