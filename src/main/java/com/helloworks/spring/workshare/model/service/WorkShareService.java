package com.helloworks.spring.workshare.model.service;

import java.util.ArrayList;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

public interface WorkShareService {

	void insertWorkShare(WorkShare ws) throws Exception;

	void insertWSAttach(ArrayList<WSAttachment> wsaList) throws Exception;

	int selectUncheckedWSListCount(Employee myEmp) throws Exception;

	ArrayList<WorkShare> selectUnCheckedList(Employee myEmp, PageInfo pi) throws Exception;

	int selectRecvWSListCount(Employee myEmp) throws Exception;

	ArrayList<WorkShare> selectRecvList(Employee myEmp, PageInfo pi) throws Exception;

	int selectSendWSListCount(Employee myEmp) throws Exception;

	ArrayList<WorkShare> selectSendList(Employee myEmp, PageInfo pi) throws Exception;

	int selectSavedWSListCount(Employee myEmp) throws Exception;

	ArrayList<WorkShare> selectSavedList(Employee myEmp, PageInfo pi) throws Exception;

}
