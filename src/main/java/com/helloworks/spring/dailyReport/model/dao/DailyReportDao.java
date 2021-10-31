package com.helloworks.spring.dailyReport.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.dailyReport.model.vo.DailyReport;

@Repository
public class DailyReportDao {

	public int tempDailyReportCount(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.tempDailyReportCount", dailyReport);
	}

	public int updateDailyReportMe(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.updateDailyReportMe", dailyReport);
	}

	public int insertDailyReport(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.insertDailyReport", dailyReport);
	}

	public DailyReport selectTempSaveDailyReport(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.selectTempSaveDailyReport", empNo);
	}

	public int updateTempDailyReportMe(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.updateTempDailyReportMe", dailyReport);
	}

	public int insertTempDailyReport(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.insertTempDailyReport", dailyReport);
	}

	public int alreadySendReport(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.alreadySendReport", dailyReport);
	}

	public int selectDailyReportListCount(SqlSessionTemplate sqlSession, int loginUserNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.selectDailyReportListCount", loginUserNo);
	}

	public ArrayList<DailyReport> selectDailyReportList(SqlSessionTemplate sqlSession, int loginUserNo, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("dailyReportMapper.selectDailyReportList", loginUserNo, rowBounds);
	}

	public int receiveCheck(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.receiveCheck", dailyReport);
	}

	public int updateDailyReportRef(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.updateDailyReportRef", dailyReport);
	}

	public int selectDailyReportCategoryTypeListCount(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.selectDailyReportCategoryTypeListCount", dailyReport);
	}

	public ArrayList<DailyReport> selectDailyReportCategoryTypeList(SqlSessionTemplate sqlSession,
			DailyReport dailyReport, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("dailyReportMapper.selectDailyReportCategoryTypeList", dailyReport, rowBounds);
	}

}
