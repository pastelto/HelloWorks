package com.helloworks.spring.vacation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.attendance.model.vo.Statistics;
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
	
	//결재문서 진행중 조회
	@Override
	public ArrayList<Vacation> selectApproval() {
		// TODO Auto-generated method stub
		return vacationDao.selectApproval(sqlSession);
	}
	
	//결재문서 승인
	@Override
	public void progressChange(String documentNo) {
		int result = vacationDao.progressChange(sqlSession, documentNo);
		
		if(result < 0) {
			throw new CommException("결재 체인지 실패");
		}
		
	}
	
	//해당문서 조회
	@Override
	public Vacation onlyOneSelect(String documentNo) {
		// TODO Auto-generated method stub
		return vacationDao.onlyOneSelect(sqlSession , documentNo);
	}

	//연차테이블 변경
	@Override
	public void updateAnnual(LoginUserVacation annual) {
		int result = vacationDao.updateAnnual(sqlSession, annual);
		
		if(result < 0) {
			throw new CommException("연차테이블 변경 실패");
		}
		
	}
	
	//사용휴가 일수추가
	@Override
	public void addVacation(LoginUserVacation vacation) {
		int result = vacationDao.addVacation(sqlSession, vacation);
		
		if(result < 0) {
			throw new CommException("휴가테이블 변경 실패");
		}
		
	}
	
	//출근등록시 결재서류가있다면
	@Override
	public Vacation sysdateVacation(int empNo) {
		// TODO Auto-generated method stub
		return vacationDao.sysdateVacation(sqlSession , empNo);
	}
	
	//휴가사용일수
	@Override
	public LoginUserVacation selectVacation(int empNo) {
		// TODO Auto-generated method stub
		return vacationDao.selectVacation(sqlSession, empNo);
	}
	
	//제출한 휴가문서
	@Override
	public ArrayList<Vacation> selectAPapproval(int empNo) {
		// TODO Auto-generated method stub
		return vacationDao.selectAPapproval(sqlSession, empNo);
	}
	
	//결재할 문서 갯수
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return vacationDao.selectListCount(sqlSession);
	}
	
	//연차 사용 통계
	@Override
	public ArrayList<LoginUserVacation> vacationStatistics(String dept) {
		// TODO Auto-generated method stub
		return vacationDao.vacationStatistics(sqlSession, dept);
	
	}
}
