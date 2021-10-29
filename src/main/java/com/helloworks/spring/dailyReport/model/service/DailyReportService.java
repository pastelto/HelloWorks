package com.helloworks.spring.dailyReport.model.service;

import com.helloworks.spring.dailyReport.model.vo.DailyReport;

public interface DailyReportService{

	int tempDailyReportCount(DailyReport dailyReport);

	void updateDailyReportMe(DailyReport dailyReport);

	void insertDailyReport(DailyReport dailyReport);

	DailyReport selectTempSaveDailyReport(int empNo);

	void updateTempDailyReportMe(DailyReport dailyReport);

	void insertTempDailyReport(DailyReport dailyReport);

	int alreadySendReport(DailyReport dailyReport);

}
