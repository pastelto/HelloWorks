package com.helloworks.spring.dailyReport.model.service;

import com.helloworks.spring.dailyReport.model.vo.DailyReport;

public interface DailyReportService{

	int tempDailyReportCount(int loginUser);

	void updateDailyReportMe(DailyReport dailyReport);

	void insertDailyReport(DailyReport dailyReport);

}
