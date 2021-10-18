package com.helloworks.spring.notice.model.vo;

import java.sql.Date;

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
public class Notice {

	   private int noticeNo;
	   private String noticeTitle;
	   private String noticeContent;
	   private String noticeWriter; //작성자
	   private int empNo; //사번
	   private String jobName; //직급
	   private String deptName; //부서
	   private String originName;
	   private String changeName;
	   private int nt_count;
	   private Date createDate;
	   private String nStatus;//상태
	
}
