package com.helloworks.spring.dailyReport.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.dailyReport.model.dao.DailyReportDao;
import com.helloworks.spring.dailyReport.model.vo.DailyReport;
import com.helloworks.spring.dailyReport.model.vo.DailyReportReply;

@Service
public class DailyReportServiceImpl implements DailyReportService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DailyReportDao dailyReportDao;
	
	@Override
	public int tempDailyReportCount(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return dailyReportDao.tempDailyReportCount(sqlSession, dailyReport);
	}

	@Override
	public void updateDailyReportMe(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		int result = dailyReportDao.updateDailyReportMe(sqlSession, dailyReport);
		
		if(result < 0) {
			throw new CommException("일일보고 업데이트 저장 실패");
		}
	}

	@Override
	public void insertDailyReport(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		int result = dailyReportDao.insertDailyReport(sqlSession, dailyReport);
		
		if(result < 0) {
			throw new CommException("일일보고 저장 실패");
		}
	}

	@Override
	public DailyReport selectTempSaveDailyReport(int empNo) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectTempSaveDailyReport(sqlSession, empNo);
	}

	@Override
	public void updateTempDailyReportMe(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		int result = dailyReportDao.updateTempDailyReportMe(sqlSession, dailyReport);
		
		if(result < 0) {
			throw new CommException("일일보고 임시 저장 업데이트 저장 실패");
		}
	}

	@Override
	public void insertTempDailyReport(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		
		int result = dailyReportDao.insertTempDailyReport(sqlSession, dailyReport);
		
		if(result < 0) {
			throw new CommException("일일보고 임시 저장 실패");
		}
	}

	@Override
	public int alreadySendReport(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return dailyReportDao.alreadySendReport(sqlSession, dailyReport);
	}

	@Override
	public int selectDailyReportListCount(int loginUserNo) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectDailyReportListCount(sqlSession, loginUserNo);
	}

	@Override
	public ArrayList<DailyReport> selectDailyReportList(int loginUserNo, PageInfo pi) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectDailyReportList(sqlSession, loginUserNo, pi);
	}

	@Override
	public int receiveCheck(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return dailyReportDao.receiveCheck(sqlSession, dailyReport);
	}

	@Override
	public void updateDailyReportRef(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		int result = dailyReportDao.updateDailyReportRef(sqlSession, dailyReport);
		
		if(result < 0) {
			throw new CommException("일일보고 임시 저장 업데이트 저장 실패");
		}
	}

	@Override
	public int selectDailyReportCategoryTypeListCount(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectDailyReportCategoryTypeListCount(sqlSession, dailyReport);
	}

	@Override
	public ArrayList<DailyReport> selectDailyReportCategoryTypeList(DailyReport dailyReport, PageInfo pi) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectDailyReportCategoryTypeList(sqlSession, dailyReport, pi);
	}

	@Override
	public int selectDailyReportTermTypeListCount(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectDailyReportTermTypeListCount(sqlSession, dailyReport);
	}

	@Override
	public ArrayList<DailyReport> selectDailyReportTermTypeList(DailyReport dailyReport, PageInfo pi) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectDailyReportTermTypeList(sqlSession, dailyReport, pi);
	}

	@Override
	public DailyReport selectDetailDailyReport(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectDetailDailyReport(sqlSession, dailyReport);
	}

	@Override
	public int addReply(DailyReportReply r) {
		int result = dailyReportDao.addReply(sqlSession, r);
		if(result < 0) {
			throw new CommException("addReply 실패");
		}
		return result;
	}

	@Override
	public ArrayList<DailyReportReply> selectReplyList(int drNo) {
		// TODO Auto-generated method stub
		return dailyReportDao.selectReplyList(sqlSession, drNo);
	}

	@Override
	public int deleteReply(int drNo) {
		// TODO Auto-generated method stub
		int result = dailyReportDao.deleteReply(sqlSession, drNo);
		
		if(result < 0) {
			throw new CommException("일일보고 임시 저장 업데이트 저장 실패");
		}
		return result;
	}

}
