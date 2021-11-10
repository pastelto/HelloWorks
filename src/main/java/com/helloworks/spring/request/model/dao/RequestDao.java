package com.helloworks.spring.request.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.request.model.vo.Car;
import com.helloworks.spring.request.model.vo.Mtr;
import com.helloworks.spring.request.model.vo.RequestEq;
import com.helloworks.spring.request.model.vo.RequestId;

@Repository
public class RequestDao {

	//회의실 등록
	public int addMtr(SqlSessionTemplate sqlSession, Mtr mtr) {
		return sqlSession.insert("requestMapper.addMtr", mtr);
	}
	
	//회의실 목록
	public ArrayList<Mtr> manageMtr(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("requestMapper.manageMtr");
	}
	
	//회의실 삭제
	public int deleteMtr(SqlSessionTemplate sqlSession, List<String> checkArr) {
		return sqlSession.delete("requestMapper.deleteMtr", checkArr);
	}
	
	//차량 등록
	public int addCar(SqlSessionTemplate sqlSession, Car car) {
		return sqlSession.insert("requestMapper.addCar", car);
	}

	//차량 목록
	public ArrayList<Car> manageCar(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("requestMapper.manageCar");
	}
	
	//차량 삭제
	public int deleteCar(SqlSessionTemplate sqlSession, List<String> checkArr) {
		return sqlSession.delete("requestMapper.deleteCar", checkArr);
	}

	//비품 신청
	public int requestEquipment(SqlSessionTemplate sqlSession, RequestEq rEq) {
		return sqlSession.insert("requestMapper.requestEquipment", rEq);
	}

	//사원증 신청
	public int requestIdCard(SqlSessionTemplate sqlSession, RequestId rId) {
		return sqlSession.insert("requestMapper.requestIdCard", rId);
	}
	
	//비품 신청 리스트
	public ArrayList<RequestEq> selectEqList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("requestMapper.selectEqList");
	}
	
	//사원증 신청 리스트
	public ArrayList<RequestId> selectIdList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("requestMapper.selectIdList");
	}
	
	//회의실 신청 리스트
	public ArrayList<Mtr> selectMtrList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("requestMapper.selectMtrList");
	}
	
	//비품 승인완료
	public int confirmEq(SqlSessionTemplate sqlSession, List<String> checkArr) {
		return sqlSession.update("requestMapper.confirmEq", checkArr);
	}
	
	//사원증 승인완료
	public int confirmId(SqlSessionTemplate sqlSession, List<String> checkArr) {
		return sqlSession.update("requestMapper.confirmId", checkArr);
	}
	
	//비품 승인취소
	public int cancelEq(SqlSessionTemplate sqlSession, List<String> checkArr) {
		return sqlSession.update("requestMapper.cancelEq", checkArr);
	}
	
	//사원증 승인취소
	public int cancelId(SqlSessionTemplate sqlSession, List<String> checkArr) {
		return sqlSession.update("requestMapper.cancelId", checkArr);
	}

	//비품 신청 상세조회
	public RequestEq selectEq(SqlSessionTemplate sqlSession, int requestEqNo) {
		return sqlSession.selectOne("requestMapper.selectEq", requestEqNo);
	}
	
	//사원증 신청 상세조회
	public RequestId selectId(SqlSessionTemplate sqlSession, int requestIdNo) {
		return sqlSession.selectOne("requestMapper.selectId", requestIdNo);
	}

	//비품 신청 목록에서 삭제
	public int deleteListEq(SqlSessionTemplate sqlSession, List<String> checkArr) {
		return sqlSession.update("requestMapper.deleteListEq", checkArr);
	}
	
	//사원증 신청 목록에서 삭제
	public int deleteListId(SqlSessionTemplate sqlSession, List<String> checkArr) {
		return sqlSession.update("requestMapper.deleteListId", checkArr);
	}

	//비품 상세페이지에서 삭제
	public int deleteOneEq(SqlSessionTemplate sqlSession, int requestEqNo) {
		return sqlSession.update("requestMapper.deleteOneEq", requestEqNo);
	}
	
	//비품 상세페이지에서 승인완료
	public int confirmOneEq(SqlSessionTemplate sqlSession, int requestEqNo) {
		return sqlSession.update("requestMapper.confirmOneEq", requestEqNo);
	}

	//비품 상세페이지에서 승인취소
	public int cancelOneEq(SqlSessionTemplate sqlSession, int requestEqNo) {
		return sqlSession.update("requestMapper.cancelOneEq", requestEqNo);
	}

	//사원증 상세페이지에서 삭제
	public int deleteOneId(SqlSessionTemplate sqlSession, int requestIdNo) {
		return sqlSession.update("requestMapper.deleteOneId", requestIdNo);
	}
	
	//사원증 상세페이지에서 승인완료
	public int confirmOneId(SqlSessionTemplate sqlSession, int requestIdNo) {
		return sqlSession.update("requestMapper.confirmOneId", requestIdNo);
	}
	
	//사원증 상세페이지에서 승인취소
	public int cancelOneId(SqlSessionTemplate sqlSession, int requestIdNo) {
		return sqlSession.update("requestMapper.cancelOneId", requestIdNo);
	}
	
	//회의실 예약위한 회의실 리스트 가져오기
	public ArrayList<Mtr> listMtr(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("requestMapper.manageMtr");
	}

	// 회의실 예약위한 시간표 가져오기
	public ArrayList<Mtr> timeMtr(SqlSessionTemplate sqlSession, Mtr mtr) {
		return (ArrayList)sqlSession.selectList("requestMapper.timeMtr", mtr);
	}

	//회의실 예약정보 삭제
	public int delRsvMtr(SqlSessionTemplate sqlSession, int mRNo) {
		return sqlSession.delete("requestMapper.delRsvMtr", mRNo);
	}

	//회의실 예약하기
	public int rsvMtr(SqlSessionTemplate sqlSession, Mtr mtr) {
		return sqlSession.insert("requestMapper.rsvMtr", mtr);
	}
	
	//차량 예약위한 차량 리스트
	public ArrayList<Car> listCar(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("requestMapper.manageCar");
	}

	// 차량 예약위한 시간표 가져오기
	public ArrayList<Car> timeCar(SqlSessionTemplate sqlSession, Car car) {
		return (ArrayList)sqlSession.selectList("requestMapper.timeCar", car);
	}

	// 차량 예약 삭제하기
	public int delRsvCar(SqlSessionTemplate sqlSession, int cRNo) {
		return sqlSession.delete("requestMapper.delRsvCar", cRNo);
	}
	
	// 차량 예약
	public int rsvCar(SqlSessionTemplate sqlSession, Car car) {
		return sqlSession.insert("requestMapper.rsvCar", car);
	}
	
	// 메인-mtr
	public ArrayList<Mtr> mainRequestMtr(SqlSessionTemplate sqlSession, HashMap<String, Object> selectrMtrList) {
		return (ArrayList)sqlSession.selectList("requestMapper.mainRequestMtr", selectrMtrList);
	}
	
	// 메인-eq
	public ArrayList<RequestEq> mainRequestEq(SqlSessionTemplate sqlSession, HashMap<String, Object> selectEqList) {
		return (ArrayList)sqlSession.selectList("requestMapper.mainRequestEq", selectEqList);
	}


	

}
