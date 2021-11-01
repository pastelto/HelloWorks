package com.helloworks.spring.dailyReport.model.service;

import java.util.ArrayList;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.dailyReport.model.vo.DailyReport;

public interface DailyReportService{

	int tempDailyReportCount(DailyReport dailyReport);

	void updateDailyReportMe(DailyReport dailyReport);

	void insertDailyReport(DailyReport dailyReport);

	DailyReport selectTempSaveDailyReport(int empNo);

	void updateTempDailyReportMe(DailyReport dailyReport);

	void insertTempDailyReport(DailyReport dailyReport);

	int alreadySendReport(DailyReport dailyReport);

	int selectDailyReportListCount(int loginUserNo);

	ArrayList<DailyReport> selectDailyReportList(int loginUserNo, PageInfo pi);

	int receiveCheck(DailyReport dailyReport);

	void updateDailyReportRef(DailyReport dailyReport);

	int selectDailyReportCategoryTypeListCount(DailyReport dailyReport);

	ArrayList<DailyReport> selectDailyReportCategoryTypeList(DailyReport dailyReport, PageInfo pi);

	int selectDailyReportTermTypeListCount(DailyReport dailyReport);

	ArrayList<DailyReport> selectDailyReportTermTypeList(DailyReport dailyReport, PageInfo pi);

}
