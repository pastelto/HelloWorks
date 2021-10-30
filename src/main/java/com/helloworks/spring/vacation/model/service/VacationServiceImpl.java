package com.helloworks.spring.vacation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.vacation.model.dao.VacationDao;
import com.helloworks.spring.vacation.model.vo.ApprovalAttendance;
import com.helloworks.spring.vacation.model.vo.LoginUserVacation;
import com.helloworks.spring.vacation.model.vo.Vacation;
import com.helloworks.spring.vacation.model.vo.VacationCC;
import com.helloworks.spring.vacation.model.vo.VacationLine;

@Service
public class VacationServiceImpl implements VacationService {
	@Autowired
	private VacationDao vacationDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//결재라인 insert
	@Override
	public void insertLine(VacationLine line) {
		int result = vacationDao.insertLine(sqlSession, line);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	//수신참조
	@Override
	public void insertCcEmpl(VacationCC vaCC) {
		int result = vacationDao.insertCcEmpl(sqlSession, vaCC);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public void insertCcDept(VacationCC vaCC) {
		int result = vacationDao.insertCcDept(sqlSession, vaCC);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	//첨부파일
	@Override
	public void insertAttachment(Vacation vacation) {
		int result = vacationDao.insertAttachment(sqlSession, vacation);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}
	
	//근태구분 결재
	@Override
	public void insertVacation(Vacation vacation) {
		int result = vacationDao.insertVacation(sqlSession,vacation);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}

	@Override
	public void insertAttendance(ApprovalAttendance apA) {
	int result = vacationDao.insertAttendance(sqlSession, apA);
		
		if(result < 0) {
			throw new CommException("결재 등록 실패");
		}
		
	}
	
	//사용자 연차 정보조회
	@Override
	public LoginUserVacation selectAnnual(int empNo) {
		// TODO Auto-generated method stub
		return vacationDao.selectAnnual(sqlSession, empNo);
	}
}
