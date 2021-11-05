package com.helloworks.spring.dailyReport.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.dailyReport.model.vo.DailyReport;
import com.helloworks.spring.dailyReport.model.vo.DailyReportReply;
import com.helloworks.spring.dailyReport.model.vo.SearchDailyReport;

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

	public int selectDailyReportTermTypeListCount(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.selectDailyReportTermTypeListCount", dailyReport);
	}

	public ArrayList<DailyReport> selectDailyReportTermTypeList(SqlSessionTemplate sqlSession, DailyReport dailyReport,
			PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("dailyReportMapper.selectDailyReportTermTypeList", dailyReport, rowBounds);
	}

	public DailyReport selectDetailDailyReport(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.selectDetailDailyReport", dailyReport);
	}

	public int addReply(SqlSessionTemplate sqlSession, DailyReportReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("dailyReportMapper.addReply", r);
	}

	public ArrayList<DailyReportReply> selectReplyList(SqlSessionTemplate sqlSession, int drNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("dailyReportMapper.selectReplyList", drNo);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int drNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.deleteReply", drNo);
	}

	public ArrayList<DailyReport> selectMyAllDailyReportList(SqlSessionTemplate sqlSession, int loginUserNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("dailyReportMapper.selectMyAllDailyReportList", loginUserNo);
	}

	public DailyReport selectDetailSendDailyReport(SqlSessionTemplate sqlSession, int drNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dailyReportMapper.selectDetailSendDailyReport", drNo);
	}

	public int updateConfirm(SqlSessionTemplate sqlSession, DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.updateConfirm", dailyReport);
	}

	public int searchDailyReportListCount(SqlSessionTemplate sqlSession, SearchDailyReport sdr) {
		// TODO Auto-generated method stub
		return sqlSession.update("dailyReportMapper.searchDailyReportListCount", sdr);
	}

	public ArrayList<DailyReport> searchDailyReportList(SqlSessionTemplate sqlSession, DailyReport dailyReport,
			PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("dailyReportMapper.searchDailyReportList", dailyReport, rowBounds);
	}

}
