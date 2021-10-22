package com.helloworks.spring.request.model.service;

import java.util.ArrayList;

import com.helloworks.spring.request.model.vo.Car;
import com.helloworks.spring.request.model.vo.Mtr;

public interface RequestService {
	
	//회의실 등록
	void addMtr(Mtr mtr);
	//회의실 목록
	ArrayList<Mtr> manageMtr();
	//차량 등록
	void addCar(Car car);
	//차량 목록
	ArrayList<Mtr> manageCar();

}
