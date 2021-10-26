package com.helloworks.spring.request.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.request.model.dao.RequestDao;
import com.helloworks.spring.request.model.vo.Car;
import com.helloworks.spring.request.model.vo.Mtr;
import com.helloworks.spring.request.model.vo.RequestEq;
import com.helloworks.spring.request.model.vo.RequestId;

@Service
public class RequestServiceImpl implements RequestService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private RequestDao requestDao;

	// 회의실 등록
	@Override
	public void addMtr(Mtr mtr) {
		// System.out.println("회의실 등록 Impl 입장 ? ");

		int result = requestDao.addMtr(sqlSession, mtr);

		if (result < 0) {
			throw new CommException("회의실 등록 실패");
		}

	}

	// 회의실 리스트
	@Override
	public ArrayList<Mtr> manageMtr() {

		return requestDao.manageMtr(sqlSession);
	}

	// 회의실 삭제
	@Override
	public void deleteMtr(List<String> checkArr) {
		int result = 0;

		result = requestDao.deleteMtr(sqlSession, checkArr);

		if (result < 0) {
			throw new CommException("회의실 삭제 실패");
		}
	}

	// 차량 등록
	@Override
	public void addCar(Car car) {
		// System.out.println("차량 등록 Impl 입장 ? ");

		int result = requestDao.addCar(sqlSession, car);

		if (result < 0) {
			throw new CommException("차량 등록 실패");
		}

	}

	// 차량 목록
	@Override
	public ArrayList<Mtr> manageCar() {

		return requestDao.manageCar(sqlSession);
	}

	// 차량 삭제
	@Override
	public void deleteCar(List<String> checkArr) {
		int result = 0;

		result = requestDao.deleteCar(sqlSession, checkArr);

		if (result < 0) {
			throw new CommException("차량 삭제 실패");
		}
	}

	// 비품 신청
	@Override
	public void requestEquipment(RequestEq rEq) {
		
		int result = requestDao.requestEquipment(sqlSession, rEq);

		if (result < 0) {
			throw new CommException("비품 신청 실패");
		}
	}

	// 사원증 신청
	@Override
	public void requestIdCard(RequestId rId) {
		int result = requestDao.requestIdCard(sqlSession, rId);

		if (result < 0) {
			throw new CommException("사원증 신청 실패");
		}
	}

	// 비품 신청 리스트
	@Override
	public ArrayList<RequestEq> selectEqList() {
		
		return requestDao.selectEqList(sqlSession);
	}
	
	// 사원증 신청 리스트
	@Override
	public ArrayList<RequestId> selectIdList() {
		
		return requestDao.selectIdList(sqlSession);
	}
	
	// 비품 체크박스 제출 -> 승인완료
	@Override
	public void confirmEq(List<String> checkArr) {
		int result = 0;

		result = requestDao.confirmEq(sqlSession, checkArr);

		if (result < 0) {
			throw new CommException("승인완료 처리 실패");
		}
	}
	// 사원증 체크박스 제출 -> 승인완료
	@Override
	public void confirmId(List<String> checkArr) {
		int result = 0;

		result = requestDao.confirmId(sqlSession, checkArr);

		if (result < 0) {
			throw new CommException("승인완료 처리 실패");
		}
	}
	// 비품 체크박스 제출 -> 승인취소
	@Override
	public void cancelEq(List<String> checkArr) {
		int result = 0;

		result = requestDao.cancelEq(sqlSession, checkArr);

		if (result < 0) {
			throw new CommException("승인취소 처리 실패");
		}
	}
	// 사원증 체크박스 제출 -> 승인취소
	@Override
	public void cancelId(List<String> checkArr) {
		int result = 0;

		result = requestDao.cancelId(sqlSession, checkArr);

		if (result < 0) {
			throw new CommException("승인취소 처리 실패");
		}
	}
}
