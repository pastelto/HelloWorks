package com.helloworks.spring.request.model.service;

import java.util.ArrayList;
import java.util.List;

import com.helloworks.spring.request.model.vo.Car;
import com.helloworks.spring.request.model.vo.Mtr;
import com.helloworks.spring.request.model.vo.RequestEq;
import com.helloworks.spring.request.model.vo.RequestId;

public interface RequestService {
	
	//회의실 등록
	void addMtr(Mtr mtr);
	//회의실 목록
	ArrayList<Mtr> manageMtr();
	//회의실 삭제
	void deleteMtr(List<String> checkArr);
	//차량 등록
	void addCar(Car car);
	//차량 목록
	ArrayList<Mtr> manageCar();
	//차량 삭제
	void deleteCar(List<String> checkArr);
	//비품 신청
	void requestEquipment(RequestEq rEq);
	//사원증 신청
	void requestIdCard(RequestId rId);
	//비품 신청 목록
	ArrayList<RequestEq> selectEqList();
	//사원증 신청 목록
	ArrayList<RequestId> selectIdList();
	//비품 신청 승인완료
	void confirmEq(List<String> checkArr);
	//사원증 신청 승인완료
	void confirmId(List<String> checkArr);
	//비품 신청 승인취소
	void cancelEq(List<String> checkArr);
	//사원증 신청 승인취소
	void cancelId(List<String> checkArr);
	
}
