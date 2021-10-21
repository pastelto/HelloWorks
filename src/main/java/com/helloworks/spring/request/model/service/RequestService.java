package com.helloworks.spring.request.model.service;

import java.util.ArrayList;

import com.helloworks.spring.request.model.vo.Mtr;

public interface RequestService {

	void addMtr(Mtr mtr);

	ArrayList<Mtr> manageMtr();

}
