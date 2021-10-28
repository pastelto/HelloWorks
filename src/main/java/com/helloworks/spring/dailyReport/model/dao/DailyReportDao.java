package com.helloworks.spring.dailyReport.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.dailyReport.model.vo.DailyReport;

@Repository
public class DailyReportDao {

	public int tempDailyReportCount(SqlSessionTemplate sqlSession, int loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.tempDailyReportCount", loginUser);
	}

	public int updateDailyReportMe(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.updateDailyReportMe", dailyReport);
	}

	public int insertDailyReport(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.insertDailyReport", dailyReport);
	}

}
