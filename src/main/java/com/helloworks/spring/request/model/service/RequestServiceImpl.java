package com.helloworks.spring.request.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.request.model.dao.RequestDao;
import com.helloworks.spring.request.model.vo.Car;
import com.helloworks.spring.request.model.vo.Mtr;

@Service
public class RequestServiceImpl implements RequestService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private RequestDao requestDao;

	// 회의실 등록
	@Override
	public void addMtr(Mtr mtr) {
		System.out.println("회의실 등록 Impl 입장 ? ");

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

	// 차량 등록
	@Override
	public void addCar(Car car) {
		System.out.println("차량 등록 Impl 입장 ? ");

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

}
