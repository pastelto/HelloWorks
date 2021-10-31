package com.helloworks.spring.vacation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.vacation.model.vo.ApprovalAttendance;
import com.helloworks.spring.vacation.model.vo.LoginUserVacation;
import com.helloworks.spring.vacation.model.vo.Vacation;
import com.helloworks.spring.vacation.model.vo.VacationCC;
import com.helloworks.spring.vacation.model.vo.VacationLine;

@Repository
public class VacationDao {
	
	//결재라인 insert
	public int insertLine(SqlSessionTemplate sqlSession, VacationLine line) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertLine", line);
	}
	
	//수신참조
	public int insertCcEmpl(SqlSessionTemplate sqlSession, VacationCC vaCC) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertCcEmpl", vaCC);
	}

	public int insertCcDept(SqlSessionTemplate sqlSession, VacationCC vaCC) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertCcDept", vaCC);
	}

	//첨부파일
	public int insertAttachment(SqlSessionTemplate sqlSession, Vacation vacation) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertAttachment", vacation);
	}

	//근태구분 결재
	public int insertVacation(SqlSessionTemplate sqlSession, Vacation vacation) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertVacation", vacation);
	}

	public int insertAttendance(SqlSessionTemplate sqlSession, ApprovalAttendance apA) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertAttendance", apA);
	}
	
	//사용자 연차정보조회
	public LoginUserVacation selectAnnual(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("vacationMapper.selectAnnual", empNo);
	}
	
	//결재문서 진행중 조회
	public ArrayList<Vacation> selectApproval(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("vacationMapper.selectApproval");
	}
	
	//결재문서 승인
	public int progressChange(SqlSessionTemplate sqlSession, String documentNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.progressChange", documentNo);
	}
	
	//해당문서조회
	public Vacation onlyOneSelect(SqlSessionTemplate sqlSession, String documentNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("vacationMapper.onlyOneSelect", documentNo);
	}

	//연차테이블 변경
	public int updateAnnual(SqlSessionTemplate sqlSession, LoginUserVacation annual) {
		// TODO Auto-generated method stub
		return sqlSession.update("vacationMapper.updateAnnual", annual);
	}
	
	//사용휴가일수추가
	public int addVacation(SqlSessionTemplate sqlSession, LoginUserVacation vacation) {
		// TODO Auto-generated method stub
		return  sqlSession.update("vacationMapper.addVacation", vacation);
	}

}
