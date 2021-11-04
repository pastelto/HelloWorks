package com.helloworks.spring.dailyReport.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchDailyReport {
	
	private String allReport;
	private String reportDType;
	private String reportWType;
	private String reportMType;
	
	private String allType;
	private String writerType;
	private String titleType;
	private String contentType;
	
	private int userNo;


}
